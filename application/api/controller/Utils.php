<?php
namespace app\api\controller;
use app\common\controller\Api;
use app\admin\model\AgentUser;
use app\admin\model\AgentOrder;
use app\admin\model\AgentPid;
use \think\Image;
use fast\Http;
use fast\Tabao;
use think\Db;
use PHPExcel_IOFactory;
use PHPExcel;

class Utils extends Api
{

    public function _initialize()
    {
        parent::_initialize();
    }

    public function test()
    {
    	/*$data = file_get_contents('https://e.topthink.com/Uploads/Picture/2017-12-23/5a3db9a231795.jpg');
    	$info = getimagesizefromstring($data);
    	dump($info);
    	$im = imagecreatefromstring($data);
    	imagepng($im, 'temp/im.png');
    	exit;
    	$tmp = imagecreatefromstring('https://e.topthink.com/Uploads/Picture/2017-12-23/5a3db9a231795.jpg');
    	imagepng($tmp, 'temp/pp.png');*/

    	/*$image = Image::open('temp/back2.jpeg');
    	$type = $image->mime(); 
    	// echo $type;exit;
    	$image->thumb(800, 4000)->save('temp/background2.png', 'png', 80);*/
    	// $data = spider_alimama();
        /*$data = get_chaozhi_link('563839280044','mm_126370153_41252811_190696425', 'http://shop.m.taobao.com/shop/coupon.htm?seller_id=3012326810&activity_id=7eff871d086245fe9d906e7f0ceb98ae');
        dump($data);*/
        // echo urlencode('scene=xxx');
        $data = get_time_begin_end('week');
        echo date('Y-m-d H:i:s', $data[0]). "  ";
        echo date('Y-m-d H:i:s', $data[1]). "  ";
        $w = '-0 days';
        $Wstart = strtotime(date('Y-m-d'). $w);
        
        echo date('Y-m-d H:i:s', $Wstart). "  ";
    }

    public function handle_share_pic($openid, $id='', $iid, $page='', $pic='', $title='', $s_price=0, $price=0, $coupon_price=0)
    {
        $scene = $this->compose_scene($openid, $id, $iid);
    	$title1 = mb_substr($title, 0, 15, 'utf-8');
    	$title2 = mb_substr($title, 15, 15, 'utf-8');
    	$font_path = 'GB2312.ttf';
    	$color1 = '#000000';
    	$color2 = '#272822';
        $wxacode = $this->getwxacode($openid, $scene, $page, 1);
        $wxacode = json_decode($wxacode, true);
        if ($wxacode['code'] != 200){
            return json(['code'=>500, 'msg'=>'failure', 'data'=>'生成小程序码失败']);
        }
        $logo_path = $wxacode['data']['url'];
    	$fpath = $this->get_filename('jpg');
    	// $logo_path = $this->valid_pic($logo_path, 200, '1');
        $this->thumb_pic($logo_path, 220); 
    	$pic_path = $this->valid_pic($pic, 800, '2');
    	$background = config('base_pic_path');
    	$image = Image::open($background);
    	$image->water($pic_path, Image::WATER_CENTER);
    	$image->water($logo_path, Image::WATER_SOUTHWEST);
    	$image->text('  '.$title1, $font_path, 30, '#272822', Image::WATER_NORTHWEST, 50);
    	$image->text($title2, $font_path, 30, '#272822', Image::WATER_NORTHWEST, 100);
    	$image->text("                   ￥ ".$price, $font_path, 40, '#ff5777', Image::WATER_NORTHWEST, 180 );
    	$image->text("         ￥ ".$s_price.'              ', $font_path, 30, $color2, Image::WATER_NORTHWEST , 250 );
    	$image->text(''. $coupon_price . '               ', $font_path, 36, '#ff5777', Image::WATER_SOUTHEAST, -240);

    	$image->save($fpath, 'jpg', 50);
    	unlink($logo_path);
    	unlink($pic_path);
        return json(['code'=>200, 'msg'=>'success', 'data'=>['url'=>$fpath]]);
    }

    public function compose_scene($openid, $id, $iid)
    {
        $uid = $this->get_uid_byOpenid($openid);
        $ret = $this->get_user_field($uid, 'request_code');
        $request_code = $ret['request_code'];
        return $request_code.'_'.$id.'_'.$iid;
    }

    public function thumb_pic($url, $w)
    {
        $image = Image::open($url);
        $image->thumb($w, $w)->save($url);
    }

    public function valid_pic($url, $limit, $fn)
    {
    	$with_limit = $limit;
    	$str = file_get_contents($url);
    	$info = getimagesizefromstring($str);
    	$im = imagecreatefromstring($str);
    	$suffix = '.png';
    	$rand = 'temp/'.$fn;
    	$fname = $rand.$suffix;
    	if($info[0] != $with_limit){
    		$fname = change_img($im, $with_limit, $with_limit, $info[0], $info[1], $fname);
    	}else{
    		imagepng($im, $fname);
    	}
    	return $fname;
    }


    public function save_wxacode_img($data, $filename)
    {
        $filename = ROOT_PATH.'/public/'.$filename;
        $file = fopen($filename, 'w') or die('file already open');
        fwrite($file, $data);
        fclose($file);

    }

    public function getwxacode($openid, $scene='', $page='', $type = 0)
    {
        if ($type == 0){
            $uid = $this->get_uid_byOpenid($openid);
            $retd = $this->get_user_field($uid, 'request_code');
            if ($retd){
                $scene = $retd['request_code'];
            }else{
                return json_encode(['code'=>500, 'msg'=>'get request_code error', 'data'=>[]]);
            }

        }
        $access_token = $this->get_access_token();
        if (!$access_token){
            return json_encode(['code'=>500, 'msg'=>'get access_token error', 'data'=>[]]);
        }
        $url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" . $access_token;

        $width = 430;
        $auto_color = true;
        $line_color = ['r'=>0, 'g'=>0, 'b'=>0];
        $parmas = ['scene'=>$scene, 'page'=>$page, 'width'=>$width, 'auto_color'=>$auto_color, 'line_color'=>$line_color];
        $parmas = json_encode($parmas, JSON_UNESCAPED_UNICODE);
        $ret = Http::post($url, $parmas);
        $res = json_decode($ret, true);
        if(!$res){
            $fname = $this->get_filename('jpg');
            $this->save_wxacode_img($ret, $fname);
            $img_url = $fname;
            return json_encode(['code'=>200, 'msg'=>'success', 'data'=>['url'=>$img_url]]);
        }
        return json_encode(['code'=>500, 'msg'=>'failure', 'data'=>[]]);
        
    }

    public function get_filename($suffix='jpg')
    {
        $char = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $prefix = 'temp/';
        $fname = '';
        $len = strlen($char);
        while(true){
            $times = time();
            for ($i=0; $i<6; $i++){
                $times .= $char[mt_rand(0, $len - 1)];
            }
            $fname = $prefix.$times.'.'.$suffix;
            if (!file_exists($fname)){
                break;
            }
        }
        return $fname;
    }

    public function get_access_token()
    {
        $wxapp = config('wxApp');
        $appid = $wxapp['appId'];
        $secret = $wxapp['appSecret'];
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$secret;
        $ret = json_decode(Http::get($url), true);
        if ($ret){
            if (array_key_exists('access_token', $ret)){
                return $ret['access_token'];
            }
        }
        return '';
    }

    public function delete_pic($name)
    {
        $res =  file_exists($name);
        if($res)
        {
            unlink($name);
            return json(['code'=>200, 'msg'=>'success', 'data'=>'ok']);
        }
        return json(['code'=>500, 'msg'=>'file not exist', 'data'=>[]]);
    }

    private function get_user_field($id, $field)
    {
        $field = 'id, '.$field;
        $User = new AgentUser();
        $ret = $User
            ->where(['id'=>$id, 'status'=>1])
            ->field($field)->select();
        if($ret){
            return $ret[0];
        }
        return null;
    }

    private function get_uid_byOpenid($openid)
    {
        $User = new AgentUser();
        $ret = $User
            ->where(['openid'=>$openid])
            ->field('id')->select();
        if($ret){
            return $ret[0]['id'];
        }else{
            dump('用户不存在');exit;
        }
    }


    public function update_order_data()
    {
        $day = get_time_begin_end('day');
        $startTime = date('Y-m-d H:i:s', $day[0]);
        $endTime = date('Y-m-d H:i:s', $day[1]);
        $fname = $this->get_excel($startTime, $endTime);
        if ($fname){
            $this->read_save_order($fname);
            delete_file($fname);
            return json(['code'=>200, 'msg'=>'success']);
        }
        return json(['code'=>500, 'msg'=>'获取excel失败']);
    }

    public function get_excel($startTime='', $endTime='')
    {
        $url = 'http://pub.alimama.com/report/getTbkPaymentDetails.json';
        $parmas = [
            'spm'=>'a219t.7664554.1998457203.58.6bb91a4aWQyKWR',
            'DownloadID'=>'DOWNLOAD_REPORT_INCOME_NEW',
            'queryType'=>1,
            'payStatus'=>'',
            'startTime'=>$startTime,
            'endTime'=>$endTime
        ];
        $cookie = get_configure('alimama_cookie');
        $ret = $this->sendRequest($url, $parmas, 'GET', $cookie, []);
        if ($ret['msg']){
            $fname = $this->get_filename('xls');
            $this->save_wxacode_img($ret['msg'], $fname);
            return $fname;
        }
        return '';
    }

    public function read_save_order($filename='temp/dump203.xls')
    {
        // $filename = 'temp/dump203.xls';
        $src = $this->resolve_order_data($filename);
        $this->save_order_data($src);
    }

    public function resolve_order_data($file_url="")
    {
        $exist = file_exists($file_url);
        if(!$exist){
            dump($file_url." :文件不存在");
            exit;
        }
        $index = ['order_time', 'clicktime', 'msg', 'iid', 'wa', 'shop', 'goods_num', 'price', 'status', 'is_tmall', 'rate', 'fen', 'pay_money', 'xiao', 'end', 'yugu', 'endtime', 'srate', 'commission', 'burate', 'bu', 'bukind', 'platfom', 'three', 'order_num', 'cate', 'm_id', 'm_name', 'adzone_id', 'ad_name'];
        $objReader = PHPExcel_IOFactory::createReader('Excel5');
        $objPHPExcel = $objReader->load($file_url, $encode='utf-8');
        $sheet = $objPHPExcel->getActiveSheet();
        $data = [];
        foreach ($sheet->getRowIterator()  as $row) {
            $rowdata = [];
            if($row->getRowIndex()< 2) continue; //确定从哪一行开始读取
            $i = 0;
            foreach($row->getCellIterator() as $cell)  //逐列读取
            {
                $cellstr = trim($cell->getValue());
                $rowdata[$index[$i]] = $cellstr;
                $i++;
            }
            $data[] = $rowdata;
        }
        return $data;
    }

    public function save_order_data($src)
    {
        if (!$src) {
            return;
        }
        $back_rate = config('back_rate');
        $houma_rate = config('houma_rate');
        $data = [];
        $Order = new AgentOrder();
        foreach($src as $row)
        {
            $order_status = trim($row['status']);

            if($order_status == '订单失效'){
                $order_num = trim($row['order_num']);
                $check = $Order
                    ->where(['order_num'=>$order_num, 'status'=>1])
                    ->field('id, user_id, iid')
                    ->select();
                if ($check){
                    $order_id = $check[0]['id'];
                    $del = $Order
                        ->where(['id'=>$order_id])
                        ->update(['status'=>0]);
                    continue;
                }
            } 
            $adzone_id = $row['adzone_id'];
            $uid = $this->adzone_get_uid($adzone_id);
            if (!$uid) continue;
            $index = trim($row['order_num']);
            if(array_key_exists($index, $data)){
                $pay_money = $data[$index]['pay_money'];
                $rate = $data[$index]['rate'];
                $data[$index]['pay_money'] = $pay_money+(float)$row['pay_money'];
                $tmp_xiao = (float)$row['xiao'] * $back_rate * $houma_rate;
                $data[$index]['income'] = $data[$index]['income'] + $tmp_xiao;
                $data[$index]['goods_num'] += (int)$row['goods_num'];
            }else{
                // $status = $order_status == '订单结算' ? 2 : 1;
                $status = 0;
                if ($order_status == '订单结算'){
                    $status = 2;
                }else if($order_status == '订单付款'){
                    $status = 1;
                }
                $iid = $row['iid'];
                $pic = $this->get_goods_pic($iid);
                $pay_money = (float)$row['pay_money'];
                $rate = (float)$row['rate'] * $back_rate * $houma_rate;
                $income = (float)$row['xiao'] * $back_rate * $houma_rate;
                $order_time = strtotime($row['order_time']);
                $is_tmall = $row['is_tmall'] == '天猫' ? 1 : 0;
                $goods_num = (int)$row['goods_num'];
                $data[$index] = ['user_id'=>$uid, 'iid'=>$iid, 'name'=>$row['msg'], 'pic'=>$pic, 'shop'=>$row['shop'], 'pay_money'=>$pay_money, 'income'=>$income, 'order_time'=>$order_time, 'adzone_id'=>$adzone_id, 'rate'=>$rate, 'order_num'=>$row['order_num'], 'goods_num'=>$goods_num, 'is_tmall'=>$is_tmall, 'status'=>$status];
            }
        }        
        foreach($data as $key=>$val){
            $ret = $Order
                ->where(['order_num'=>$key])
                ->field('id')->select();
            if ($ret) continue;
            $sret = $Order
                ->data($val)
                ->isUpdate(false)->save();
        }
        
    }

    public function adzone_get_uid($adzone_id)
    {
        $sql = "select id, openid, pid from agent_user where is_agent=1 and status=1 and  pid like '%_". $adzone_id."%';";
        $ret = Db::query($sql);
        if ($ret){
            return $ret[0]['id'];
        }else{
            return null;
        }
    }

    public function create_taobao_adzone()
    {
        $userid = 'mm_126370153_';
        $siteid = '42316876';//代理2
        $pidfile = ROOT_PATH.'/doc/pid.txt';
        $count = 10;
        $str = '';
        $pidstr = '';
        $tb = new Tabao();
        for ($i=0; $i<$count; $i++)
        {
            sleep(2);
            $suffix = $this->gen_adzone_name();
            $name = '代理2_'.$suffix;
            
            $ret = $tb->create_adzone($name, $siteid);
            if ($ret == 'error'){
                dump('create_taobao_adzone error');exit;
            }
            $pid = $userid.$ret['siteId'].'_'.$ret['adzoneId'];
            $str = file_get_contents($pidfile);
            $str = $str . $pid . "\n";
            file_put_contents($pidfile, $str);
        }

        return json(['code'=>200, 'msg'=>'success', 'data'=>$count]);
    }

    public function save_pid_data()
    {
        $pidfile = ROOT_PATH.'/doc/pid.txt';
        $pid_arr = file($pidfile);
        $PidM = new AgentPid();
        $count = 0;
        foreach($pid_arr as $row){
            $pid = trim($row);
            $exist = $PidM
                ->where(['pid'=>$pid])
                ->select();
            if (!$exist){
                $ret = $PidM
                    ->data(['pid'=>$pid])
                    ->isUpdate(false)->save();
                if ($ret >0){
                    $count ++;
                }
            }
        }
        return json(['code'=>200, 'msg'=>'success', 'data'=>$count]);
    }

    public function gen_adzone_name()
    {
        // ROOT_PATH
        $char = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $prefix = 'temp/';
        $fname = '';
        $len = strlen($char);
        $times = time();
        for ($i=0; $i<6; $i++){
            $fname .= $char[mt_rand(0, $len - 1)];
        }
        $fname = $fname.$times;
        $str = md5($fname);  
        $code = substr($str, 26, 6);
        return $code;
    }

    public function get_goods_pic($iid)
    {
        $ret = get_goods_info($iid);
        $data = [];
        if($ret){
            $tmplist = $ret['n_tbk_item'];
            foreach($tmplist as $tmp)
            {
                $data = $tmp['pict_url'];
            }
        }
        return $data;
    }

    
public function sendRequest($url, $params = [], $method = 'POST', $cookie, $options = [])
    {
        $method = strtoupper($method);
        $protocol = substr($url, 0, 5);
        $query_string = is_array($params) ? http_build_query($params) : $params;

        $ch = curl_init();
        $defaults = [];
        if ('GET' == $method)
        {
            $geturl = $query_string ? $url . (stripos($url, "?") !== FALSE ? "&" : "?") . $query_string : $url;
            $defaults[CURLOPT_URL] = $geturl;
        }
        else
        {
            $defaults[CURLOPT_URL] = $url;
            if ($method == 'POST')
            {
                $defaults[CURLOPT_POST] = 1;
            }
            else
            {
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

        if ('https' == $protocol)
        {
            $defaults[CURLOPT_SSL_VERIFYPEER] = FALSE;
            $defaults[CURLOPT_SSL_VERIFYHOST] = FALSE;
        }

        curl_setopt_array($ch, (array) $options + $defaults);


        $ret = curl_exec($ch);
        $err = curl_error($ch);

        if (FALSE === $ret || !empty($err))
        {
            $errno = curl_errno($ch);
            $info = curl_getinfo($ch);
            curl_close($ch);
            return [
                'ret'   => FALSE,
                'errno' => $errno,
                'msg'   => $err,
                'info'  => $info,
            ];
        }
        curl_close($ch);
        return [
            'ret' => TRUE,
            'msg' => $ret,
        ];
    }
}