<?php

use app\common\model\Config as meConfig;
use fast\Http;
use fast\Tabao;
use think\Db;

function transform_link($iid, $coupon_url, $pid)
{       
    $from_site = 1;
    $tk_link = '';
    $tk_link = get_chaozhi_link($iid, $pid, $coupon_url);
    if (!$tk_link){
        $tk_link = spider_tkl($iid, $pid, $coupon_url);
        $from_site= 2;
    }
    if (!$tk_link){
        $tb = new Tabao();
        $pids = resolve_pid($pid);
        $data = $tb->get_tkl($iid, $pids['siteid'], $pids['adzoneid']);
        if ($data){
            if (array_key_exists('couponLinkTaoToken', $data)){
                $tk_link = $data['couponLinkTaoToken'];
            }else{
                $tk_link = $data['taoToken'];
            }
        }
        $from_site = 3;
    }
    if (!$tk_link){
        $tk_link = compose_link($iid, $pid, $coupon_url);
        $from_site= 4;
    }
    $date = date('Y-m-d H:i:s');
    trace($date . '——生成淘口令网址——  ' .$from_site. '  =>'.$tk_link, 'error');
    return ['tk_link'=>$tk_link, 'from_site'=>$from_site];
}

function get_chaozhi_link($iid, $pid, $coupon_url)
{
    $exp = explode('_', $pid);
    $site_id = $exp[2];
    $adzone_id = $exp[3];
    $url = 'http://tool.chaozhi.hk/api/tb/ulandPrivilege.php';
    $key = get_configure('chaozhi_key');
    $cookie = get_configure('chaozhi_cookie');
    $params = ['id'=>$iid, 'key' =>$key, 'site_id'=>$site_id, 'adzone_id'=>$adzone_id];
    $result = sendRequest($url, $params, $cookie, 'POST');
    // echo ($result['msg']);exit;
    $resArr = json_decode($result['msg'], true);
    if ($resArr){
        $tk_link = '';
        if (!array_key_exists('result', $resArr)){
            return null;
        }
        $res = $resArr['result']['data'];
        if(array_key_exists('coupon_click_url', $res)){
            $tk_link = $res['coupon_click_url'];
        }else{
            return null;
        }
        if (!$coupon_url){
            return $tk_link;
        }
        $myparam = parse_coupon_link($coupon_url);
        if (array_key_exists('activity_id', $myparam)){
            $tk_link = $tk_link . '&activityId=' . $myparam['activity_id'];
        }else if(array_key_exists('activityId', $myparam))
        {
            $tk_link = $tk_link . '&activityId=' . $myparam['activityId'];
        }
        else{
            trace(date('Y-m-d H:i:s').' [activity_id key not exist] =>'. $coupon_url, 'error');
        }
        return $tk_link;
    }
    return null;
}

function resolve_pid($pid)
{
    $exp = explode('_', $pid);
    $site_id = $exp[2];
    $adzone_id = $exp[3];
    return ['siteid'=>$site_id, 'adzoneid'=>$adzone_id];
}

function spider_tkl($iid, $pid, $coupon_link)
{
    $session = get_configure('chaozhi_key');
    $url = 'http://api.chaozhi.hk/tb/ulandArray';
    $item_url = 'http://item.taobao.com/item.htm?id='.$iid;
    if ($coupon_link){
        $item_url = $item_url . '|' .$coupon_link;
    }
    $title = '粉丝福利购';
    $tkl_img = 'http://c.chaozhi.hk/timg.jpg';
    $params = ['urls'=>$item_url, 'pid' =>$pid, 'tklTitle'=>$title, 'tklImg'=>$tkl_img, 'platform'=>false, 'isTkl'=>true, 'session'=>$session];
    $result = sendRequest($url, $params, '', 'POST');
    $resultArr = json_decode($result['msg'], true);
    if ($resultArr['error_code'] == 0){
        return $resultArr['data'][0]['ulandResult'];
    }else{
        return null;
    }
}

function compose_link($iid, $pid, $coupon_link)
{
    $url = 'https://uland.taobao.com/coupon/edetail?activityId=d88cfc70209f4442ac7db0851a3594c2&itemId='.$iid.'&pid='.$pid.'&mt=1&src=tkdg_tkdggj';
    if(!$coupon_link){
        return $url;
    }
    $myparam = parse_coupon_link($coupon_link);
    $activity_id = '';
    if (array_key_exists('activity_id', $myparam)){
        $activity_id = $myparam['activity_id'];
    }else if(array_key_exists('activityId', $myparam))
    {
        $activity_id = $myparam['activityId'];
    }
    else{
        trace(date('Y-m-d H:i:s').' [activity_id key not exist] =>'. $coupon_link, 'error');
    }
    $coupon = 'https://uland.taobao.com/coupon/edetail?activityId='.
        $activity_id.'&itemId='.$iid.'&pid='.$pid.'&mt=1&src=tkdg_tkdggj';
    return $coupon;   
}

function parse_coupon_link($coupon_link)
{
    $urlArr = parse_url($coupon_link);
    $link_params = '';
    if($urlArr){
        $link_params = $urlArr['query'];
    }
    $paramArr = explode('&', $link_params);
    $myparam = [];
    foreach($paramArr as $param){
        $tmpArr = explode('=', $param);
        $myparam[$tmpArr[0]] = $tmpArr[1];
    }
    return $myparam;
}

function spider_swiper()
{
	$url = 'http://www.qu-gou.com/index.php?r=index/wap';
	$result = sendRequest($url);
	$str = str_replace(array("\r\n", "\r", "\n", "\t"), '', $result['msg']);
	$pattern1 = '/class="swiper-wrapper"(.*)class="swiper-pagination"/i';

	$pattern2 = '/data-gid="(.*?)"/i';
	$pattern3 = '/src="(.*?)"/i';
	$matches1 = null;
	$matches2 = null;
	$matches3 = null;
	$data = [];
	$ret1 = preg_match($pattern1, $str, $matches1);
	if ($ret1 > 0){
		$ret2 = preg_match_all($pattern2, $matches1[0], $matches2);
		$ret3 = preg_match_all($pattern3, $matches1[0], $matches3);
		if ($ret2 > 0 && $ret3 > 0){
			$len = count($matches2[1]);
			for($i=0; $i < $len; $i++) {
				$data[] = ['id'=>$matches2[1][$i], 'pic'=>$matches3[1][$i]];
			}
			return $data;
		}
	}
	return false;
}

function check_pic_url($pic_url)
{
	$pattern = '/https?:\/\//i';
	$ret = preg_match($pattern, $pic_url, $matches);
	if ($ret <= 0){
		$pic_url = 'http:' . $pic_url;
	}
	return $pic_url;
}

function get_configure($key)
{
    $Config = new meConfig();
    $ret = $Config
        ->where(['name'=>$key])
        ->field('value')
        ->limit(1)
        ->select();
    if($ret){
        return $ret[0]['value'];
    }
    return '';
}

function delete_file($filename)
{
    if (file_exists($filename)){
        unlink($filename);
    }else{
        $date = date('Y-m-d H:i:s');
        trace($date . ' delete file fail! '. $filename);
    }
}

/**
 * CURL发送Request请求,含POST和REQUEST
 * @param string $url 请求的链接
 * @param mixed $params 传递的参数
 * @param string $method 请求的方法
 * @param mixed $options CURL的参数
 * @return array
 */
function sendRequest($url, $params = [], $cookie='', $method = 'GET', $options = [] )
{
    $method = strtoupper($method);
    $protocol = substr($url, 0, 5);
    $query_string = is_array($params) ? http_build_query($params) : $params;

    $ch = curl_init();
    $defaults = [];
    if ('GET' == $method) {
        $geturl = $query_string ? $url . (stripos($url, "?") !== FALSE ? "&" : "?") . $query_string : $url;
        $defaults[CURLOPT_URL] = $geturl;
    } else {
        $defaults[CURLOPT_URL] = $url;
        if ($method == 'POST') {
            $defaults[CURLOPT_POST] = 1;
        } else {
            $defaults[CURLOPT_CUSTOMREQUEST] = $method;
        }
        $defaults[CURLOPT_POSTFIELDS] = $query_string;
    }

    $defaults[CURLOPT_HEADER] = FALSE;
    $defaults[CURLOPT_USERAGENT] = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.98 Safari/537.36";
    $defaults[CURLOPT_FOLLOWLOCATION] = TRUE;
    $defaults[CURLOPT_RETURNTRANSFER] = TRUE;
    $defaults[CURLOPT_CONNECTTIMEOUT] = 3;
    $defaults[CURLOPT_TIMEOUT] = 3;

    // disable 100-continue
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:'));
    curl_setopt($ch, CURLOPT_COOKIE, $cookie);

    if ('https' == $protocol) {
        $defaults[CURLOPT_SSL_VERIFYPEER] = FALSE;
        $defaults[CURLOPT_SSL_VERIFYHOST] = FALSE;
    }

    curl_setopt_array($ch, (array)$options + $defaults);

    $ret = curl_exec($ch);
    $err = curl_error($ch);

    if (FALSE === $ret || !empty($err)) {
        $errno = curl_errno($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);
        return [
            'ret' => FALSE,
            'errno' => $errno,
            'msg' => $err,
            'info' => $info,
        ];
    }
    curl_close($ch);
    return [
        'ret' => TRUE,
        'msg' => $ret,
    ];
}

function get_time_begin_end($arg)
{
	$lastMstart =  strtotime(date('Y-m-01') . ' -1 month');
    $lastMend = strtotime(date('Y-m-01'))-1;
    $Mstart = strtotime(date('Y-m-01'));
    $Mend = strtotime(date('Y-m-01') . ' +1 month')-1;
    $curw = (int)date('w');
    $w = ($curw==0) ? '-6 days' : '-'.($curw-1).'days';
    $Wstart = strtotime(date('Y-m-d'). $w);
    $Wend = strtotime("+1 weeks", $Wstart)-1;
    $Dstart = strtotime(date('Y-m-d'));
    $Dend = strtotime(date('Y-m-d') . '+1 day') - 1;
    $day = [$Dstart, $Dend];
    $week = [$Wstart, $Wend];
    $month = [$Mstart, $Mend];
    $lastmonth = [$lastMstart, $lastMend];
    $data = ['day'=>$day, 'week'=>$week, 'month'=>$month, 'lastmonth'=>$lastmonth];
    if(array_key_exists($arg, $data)){
    	return $data[$arg];
    }
    return $data['day'];
}

function change_img($im, $width, $height, $src_w, $src_h, $fname)
{
	$canvas = imagecreatetruecolor($width,$height);
	imagecopyresampled($canvas,$im,0,0,0,0, $width,$height, $src_w,$src_h);
	imagepng($canvas, $fname);
	return $fname;
}

function get_goods_info($iid)
{
	$method = 'taobao.tbk.item.info.get';
	$params = ['fields'=>'num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url', 'num_iids'=>$iid];
	$data = taobao_api($method, $params);
	return $data['tbk_item_info_get_response']['results'];
}


function transform_tbk_link($link, $title, $logo)
{
	$method = 'taobao.tbk.tpwd.create';
	$params = ['text'=>$title, 'url'=>$link, 'logo'=>$logo];
	$data = taobao_api($method, $params);
    // dump($data);exit;
	if (array_key_exists('tbk_tpwd_create_response', $data)){
		return $data['tbk_tpwd_create_response']['data']['model'];
	}else{
		return '';
	}
}

function convert_tkl($link, $title, $logo)
{
    $method = 'taobao.wireless.share.tpwd.create';
    $tpwd_param = ['logo'=>$logo, 'url'=>$link, 'text'=>$title];
    $tpwd_param = json_encode($tpwd_param, JSON_UNESCAPED_UNICODE);
    $params = ['tpwd_param'=>$tpwd_param];
    $data = taobao_api($method, $params);
    if (array_key_exists('wireless_share_tpwd_create_response', $data)){
        return $data['wireless_share_tpwd_create_response']['data']['model'];
    }else{
        return '';
    }
}

function reslove_kouling($content)
{
    $name = '';
    $tb_pattern = '/￥.*￥/';
    $tm_pattern = '/天猫.*【(.*)】/';
    $tb_res = preg_match($tb_pattern, $content);
    if ($tb_res > 0){
        $tmp = query_kouling($content);
        if ($tmp){
            $data = taobao_query_titile($tmp);
            $name = $data['name'];
        }else{
            return '';
        }
    }
    $matches = [];
    $tm_res = preg_match($tm_pattern, $content, $matches);
    if ($tm_res>0){
        $name = $matches[1];
    }
    return $name;
}

function query_kouling($kouling)
{
    $method = 'taobao.wireless.share.tpwd.query';
    $params = ['password_content'=>$kouling];
    $data = taobao_api($method, $params);
    if ($data && array_key_exists('wireless_share_tpwd_query_response', $data)){
        if ($data['wireless_share_tpwd_query_response']['suc']){
            return $data['wireless_share_tpwd_query_response'];
        }
    }
    return '';
}

function taobao_query_titile($res)
{
    $data =[];
    $matches = [];
    if (preg_match('/（(.*)）/', $res['content'], $matches)){
        $data['name'] = $matches[1];
    }else{
        $data['name'] = $res['content'];
    }
    if (array_key_exists('price', $res)){
       $data['price'] = $res['price']; 
    }
    return $data;
}

function taobao_api($method, $params)
{
	$appkey = config('tb_key');
	$appSecret = config('tb_secret');
	$url = 'http://gw.api.taobao.com/router/rest';
    $paramArr = array(
        'app_key' => $appkey,
        'session_key' => $appSecret,
        'method' => $method,
        'format' => 'json',
        'v' => '2.0',
        'sign_method'=>'md5',
        'timestamp' => date('Y-m-d H:i:s'),
        // 'nick' => 'sandbox_c_1'
    );
    $paramArr = array_merge($paramArr, $params);
    $sign = createSign($paramArr);
    $strParam = createStrParam($paramArr);
    $strParam .= 'sign='.$sign;
    $url = $url . '?'.$strParam;
    $result = Http::get($url);
    $result = json_decode($result, true);
    return $result;
}

function createSign ($paramArr) 
{
    $appSecret = config('tb_secret');
    $sign = $appSecret;
    ksort($paramArr);
    foreach ($paramArr as $key => $val) {
        if ($key != '' && $val != '') {
            $sign .= $key.$val;
        }
    }
    $sign.= $appSecret;
    $sign = strtoupper(md5($sign));
    return $sign;
}

function createStrParam ($paramArr) 
{
    $strParam = '';
    foreach ($paramArr as $key => $val) {
        if ($key != '' && $val != '') {
            $strParam .= $key.'='.urlencode($val).'&';
        }
    }
    return $strParam;
}

function compute_param_len($data)
{
    if (!is_array($data)){
        return 0;
    }
    $str = '';
    $len = count($data) - 1;
    foreach ($data as $k=>$v)
    {
        $str .= $k.'='.$v;
    }
    return $len + strlen($str);
}