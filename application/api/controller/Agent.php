<?php
namespace app\api\controller;
use app\common\controller\Api;
use app\admin\model\AgentOrder;
use app\admin\model\AgentGoods;
use app\admin\model\AgentApply;
use app\admin\model\AgentSpread;
use app\admin\model\AgentUser;
use app\admin\model\AgentTixian;
use app\admin\model\AgentClick;
use app\admin\model\AgentClasslist;
use app\admin\model\AgentConfigure;
use app\admin\model\AgentTkl;
use think\Db;
use fast\Http;

class Agent extends Api
{
	public function _initialize()
    {
        parent::_initialize();
    }

    public function test()
    {
    	//return "hello";
    	// $m = spider_swiper();
    	// echo  $m;
    	// print_r($m);
    	// $ret = check_pic_url('//img.alicdn.com/imgextra/i3/2114785329/TB1cND6js2vU1JjSZFwXXX2cpXa_!!0-item_pic.jpg');
    	// $url = 'https://s.click.taobao.com/sOLqrUw';
    	// $title = '克洛斯威超软皮高发泡橡胶<span class=H>篮球</span>3-4-5-6-7号成人小学生儿童幼儿园';
    	// $pic = 'http://img.alicdn.com/bao/uploaded/i3/2271759873/TB1Yd_5aMMPMeJjy1XbXXcwxVXa_!!0-item_pic.jpg';
    	// $ret = transform_tbk_link($url, $title, $pic);
    	// return json($ret);
    	// $time = time();
    	// echo $time."\n";
    	// $tm = date('Y-m-d H:i:s', $time); 
        // echo $lastMstart. "\n".$lastMend."\n";
        // echo $Mstart. "\n".$Mend."\n";
        // $data = transform_tbk_link('https://s.click.taobao.com/YjHmBUw', 'sfgdfgf', 'https://img.alicdn.com/imgextra/i1/1879660321/TB2eTNge0LO8KJjSZFxXXaGEVXa_!!1879660321.jpg');
        /*$data = spider_tkl('45489549813', 'mm_126370153_41252811_190696425', 'http://shop.m.taobao.com/shop/coupon.htm?seller_id=2139091636&activity_id=6ccfc4b61a684de5887a52382a3d7925');
        $str = 'tag:29&gcid:8&siteid:42286283&selectact:sel&adzoneid:210372693&t:1516886579080&_tb_token_:be3471bb6b5f&pvid:10_119.39.90.96_521_1516884467187';*/
        // echo strlen($str);
        $data = transform_link( '558490629646','','mm_126370153_41252811_190696425');
        echo json_encode($data);

    }

    public function dataoke_data_api($type='total', $page=1, $id=0)
    {
        
        $urls = [];
        $appkey = config('dataoke_key');
        //total  page-50
        $urls['total'] = 'http://api.dataoke.com/index.php?r=Port/index&type=total&appkey='.$appkey.'&v=2&page='.$page;
        //Top100 -100
        $urls['top100'] = 'http://api.dataoke.com/index.php?r=Port/index&type=top100&appkey='.$appkey.'&v=2';
        //paoliang -100
        $urls['paoliang'] = 'http://api.dataoke.com/index.php?r=Port/index&type=paoliang&appkey='.$appkey.'&v=2';
        //detail
        $urls['detail'] = 'http://api.dataoke.com/index.php?r=port/index&appkey='.$appkey.'&v=2&id='.$id;
        
        // $ret = file_get_contents($urls[$type]);
        $ret = Http::get($urls[$type]);
        $ret = json_decode($ret, true);
        if ($ret['result']){
            return $ret;
        }
        return null;
    }

    public function tkjd_data_api($type='www_lingquan', $page=1, $id=1)
    {
        $urls = [];
        $tkjd_key = config('tkjd_key');
        $url = 'http://api.tkjidi.com/getGoodsLink?appkey='.$tkjd_key.'&type='.$type.'&page='.$page;
        if ($type == 'classify'){
            $url = 'http://api.tkjidi.com/getGoodsLink?appkey='.$tkjd_key.'&type='.$type.'&cid='.$id.'&page='.$page;
        }else if($type == 'detail'){
            $url = 'http://api.tkjidi.com/getGoodInfo?appkey='.$tkjd_key.'&id='.$id;
        }else if ($type == 'search'){
            $url = 'http://api.tkjidi.com/checkWhole?appkey='.$tkjd_key.'&k='.$id;
        }
        // $ret = file_get_contents($url);
        $ret = Http::get($url);
        $ret = json_decode($ret, true);
        if ($ret['status'] == '200'){
            return $ret;
        }
        return null;
    }

    public function haodanku_data_api($type='2', $min_id=1, $id=1)
    {
        //type=1是今日上新，type=2是9.9包邮，type=3是30元封顶，type=4是聚划算，type=5是淘抢购，type=6是0点过夜单，type=7是预告单，type=8是品牌单，type=9是天猫商品，type=10是视频单
        $url = 'http://v2.api.haodanku.com/column/apikey/hiluo/type/'.$type.'/back/1000/min_id/'.$min_id.'/sale_min/2000';
        if($type == 'hot'){
            //100个热词
            $url = 'http://v2.api.haodanku.com/hot_key/apikey/hiluo';
        }else if ($type == 'shouye')
        {
            //nav（1实时跑单商品，2爆单榜商品，3全部商品，4纯视频单）
            //sort  0.综合（最新），1.券后价(低到高)，2.券后价（高到低），3.券面额，4.销量，5.佣金比例
            $url = 'http://v2.api.haodanku.com/itemlist/apikey/hiluo/nav/2/cid/0/back/1000/min_id/'.$min_id.'/sort/4/sale_min/2000/coupon_min/10';
        }

        // $ret = file_get_contents($url);
        $ret = Http::get($url);
        $ret = json_decode($ret, true);
        if ($ret['code'] == 1){
            return $ret;
        }
        return null;
    }

    public function update_goods_data1()
    {
        //type 0=>轮播图 1=>大牌券 2=>9k9 3=>top100 4=>聚划算 5=>首页商品 6=>好货精选  50 + =>商品分类
        //更新轮播图
        $this->update_lunbotu_data(0);
        //更新大牌券
        $this->update_dapaiquan_data(1);
        //更新9k9
        $this->update_9k9_data(2);
        //更新人气榜
        $this->update_top100_data(3);
        //更新聚划算
        $this->update_jhs_data(4);

        return json(['code'=>200, 'msg'=>'success']);
    }

    public function update_goods_data2()
    {
        //更新商品分类1-4
        $this->update_goodsClass_data1(50);
        //更新商品分类4-8
        $this->update_goodsClass_data2(50);
        
    }

    public function update_goods_data3()
    {
        //更新首页
        $this->update_shouye_data(5);
        
    }

    public function update_goods_data4()
    {
        //更新好货精选
        $this->update_superme_data(6);
        //更新商品分类8-12
        $this->update_goodsClass_data3(50);
    }


    public function async_goods_data()
    {
        $prefix = config('async_url');
        $url1 = $prefix.'public/index.php/api/agent/update_goods_data1';
        $url2 = $prefix.'public/index.php/api/agent/update_goods_data2';
        $url3 = $prefix.'public/index.php/api/agent/update_goods_data3';
        $url4 = $prefix.'public/index.php/api/agent/update_goods_data4';
        Http::sendAsyncRequest($url1, [], 'GET');
        Http::sendAsyncRequest($url2, [], 'GET');
        Http::sendAsyncRequest($url3, [], 'GET');
        Http::sendAsyncRequest($url4, [], 'GET');
        return json(['code'=>200, 'msg'=>'success']);
    }

    public function truncate_goods()
    {
        $sql = 'truncate agent_goods;';
        $ret = Db::execute($sql);
        return json(['code'=>200, 'msg'=>'success']);
    }


    public function update_goodsClass_data1($type=50)
    {
        for ($c_id=1; $c_id <= 4; $c_id++){
            for ($i=1; $i<=4; $i++)
            {
                $data = $this->tkjd_data_api('classify', $i, $c_id);
                $this->save_tkjd_data($data, $type + $c_id);
            }
        }
    }

    public function update_goodsClass_data2($type=50)
    {
        for ($c_id=4; $c_id <= 8; $c_id++){
            for ($i=1; $i<=4; $i++)
            {
                $data = $this->tkjd_data_api('classify', $i, $c_id);
                $this->save_tkjd_data($data, $type + $c_id);
            }
        }
    }

    public function update_goodsClass_data3($type=50)
    {
        for ($c_id=8; $c_id <= 12; $c_id++){
            for ($i=1; $i<=4; $i++)
            {
                $data = $this->tkjd_data_api('classify', $i, $c_id);
                $this->save_tkjd_data($data, $type + $c_id);
            }
        }
    }

    public function update_superme_data($type=6)
    {
/*        for ($i=1; $i<=40; $i++)
        {
            $data = $this->dataoke_data_api('total', $i);
            $this->save_dtk_data($data, $type);
        }*/
        // paoliang
        $data = $this->dataoke_data_api('paoliang', 1);
        $this->save_dtk_data($data, $type);
        
    }

    public function save_dtk_data($data, $save_type)
    {
        $ret = $data;
        if($ret['result']){
            $tmplist = $ret['result'];
            $save_data = [];
            foreach($tmplist as $tmp){
                $edata = json_encode($tmp, JSON_UNESCAPED_UNICODE);
                $pic = check_pic_url($tmp['Pic']);
                $save_data[] = ['iid'=>$tmp['GoodsID'], 'name'=>$tmp['Title'], 'type'=>$save_type, 'pic'=>$pic, 'price'=>$tmp['Price'], 'sales'=>$tmp['Sales_num'], 'rate'=>$tmp['Commission'], 'page'=>1, 'coupon_price'=>$tmp['Quan_price'], 'coupon_link'=>$tmp['Quan_link'], 'is_tmall'=>$tmp['IsTmall'], 'cid'=>$tmp['Cid'], 'cname'=>'', 'content'=>$tmp['Introduce'], 'edata'=>$edata];
                
            }
            $this->save_goods_data($save_data);
            return true;
        }
    }

    public function update_lunbotu_data($type=0)
    {
        $swiper_list = spider_swiper();
        if (!$swiper_list){
            return false;
        }
        $dataList = [];
        $goodsModel = new AgentGoods();
        foreach( $swiper_list as $row){
            $data = $this->get_swiper_data($row['id'], $row['pic'], $type);
            if ($data){
                $dataList[] = $data;
            }
        }
        $this->save_goods_data($dataList);
    }

    public function update_dapaiquan_data($type)
    {
        for ($i=1; $i<=10; $i++)
        {
            $data = $this->tkjd_data_api('dapai', $i);
            $this->save_tkjd_data($data, $type);
        }
    }

    public function save_tkjd_data($data, $save_type)
    {
        if ($data['status'] == 200){
            $tmplist = $data['data'];
            $classModel = new AgentClasslist();
            $save_data = [];
            foreach($tmplist as $tmp){
                $edata = json_encode($tmp, JSON_UNESCAPED_UNICODE);
                $res = $classModel->get($tmp['cate_id']);
                $cname = $res ? $res->c_name : '';
                $cid = $tmp['cate_id'];
                $pic = check_pic_url($tmp['pic']);
                $save_data[] = ['iid'=>$tmp['goods_id'], 'name'=>$tmp['goods_name'], 'type'=>$save_type, 'pic'=>$pic, 'price'=>$tmp['price_after_coupons'], 'sales'=>$tmp['sales'], 'rate'=>$tmp['rate'], 'page'=>1, 'coupon_price'=>$tmp['price_coupons'], 'coupon_link'=>$tmp['quan_link'], 'content'=>$tmp['quan_guid_content'], 'is_tmall'=>$tmp['src'], 'cid'=>$tmp['cate_id'], 'cname'=>$cname, 'edata'=>$edata];
            }
            $this->save_goods_data($save_data);
            return true;
        }
    }

    public function update_9k9_data($type)
    {
        $min_id = 1;
        for ($i=0; $i<2; $i++)
        {
            $data = $this->haodanku_data_api('2', $min_id);
            $min_id = $data['min_id'];
            $this->save_haodanku_data($data, $type);
        }
        
    }

    public function save_haodanku_data($data, $save_type)
    {
        if ($data['code'] == 1){
            $tmplist = $data['data'];
            $save_data = [];
            foreach($tmplist as $tmp){
                $edata = json_encode($tmp, JSON_UNESCAPED_UNICODE);
                $is_tmall = $tmp['shoptype'] == 'B' ? 1 : 0;
                $cid = 0;
                $pic = check_pic_url($tmp['itempic']);
                $save_data[] = ['iid'=>$tmp['itemid'], 'name'=>$tmp['itemtitle'], 'type'=>$save_type, 'pic'=>$pic, 'price'=>$tmp['itemendprice'], 'sales'=>$tmp['itemsale'], 'rate'=>$tmp['tkrates'], 'page'=>1, 'coupon_price'=>$tmp['couponmoney'], 'coupon_link'=>$tmp['couponurl'], 'is_tmall'=>$is_tmall, 'content'=>$tmp['itemdesc'], 'edata'=>$edata];
            }
            $this->save_goods_data($save_data);
            return true;
        }
    }

    public function update_top100_data($type)
    {
        for ($i=1; $i<=10; $i++)
        {
            $data = $this->tkjd_data_api('top100', $i);
            $this->save_tkjd_data($data, $type);
        }
    }

    public function update_jhs_data($type)
    {
        
        for ($i=1; $i<=10; $i++)
        {
            $data = $this->tkjd_data_api('jhs', $i);
            $this->save_tkjd_data($data, $type);
        }
    }

    public function update_shouye_data($type)
    {
        // $data = $this->tkjd_data_api('bipai', 1);
        // $this->save_tkjd_data($data, $type);
        $min_id = 1;
        for($i=0; $i<4; $i++)
        {
            $data = $this->haodanku_data_api('shouye', $min_id);
            $min_id = $data['min_id'];
            $this->save_haodanku_data($data, $type);
        }
        
    }


    private function check_cache_valid($type, $page)
    {
    	$uphour = config('uphour');
    	$today = mktime($uphour,0,0,date('m'),date('d'),date('Y'));
    	$check_sql = "select count(id) as cnt from agent_goods where type=$type and status=1 and createtime>$today and page=$page;";
    	//return $check_sql;
    	$ret = Db::query($check_sql);
    	if (!$ret) {
    		return false;
    	}

    	if($ret[0]['cnt'] > 0){
    		return true;
    	}else{
    		return false;
    	}
    }



    public function lunbotu()
    {
        $data = [];
        $s_today = mktime(0,0,0,date('m'),date('d'),date('Y'));
        $query = "select id, iid, name, pic, edata from agent_goods where type=0 and status=1;";
        $ret = Db::query($query);
        if ($ret){
            foreach($ret as $row){
                $pics = json_decode($row['edata'], true);
                $pic = $pics['Pic'];
                $data[] = ['id'=> $row['id'], 'iid'=>$row['iid'], 'pic'=>$pic];
            }
        }
    	return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    private function get_swiper_data($id, $pic, $save_type=0)
    {
    	$ret = $this->dataoke_data_api('detail', 1, $id);
    	if ($ret['result']){
    		$tmp = $ret['result'];
    		$save_data = ['iid'=>$tmp['GoodsID'], 'type'=>$save_type, 'name'=>$tmp['Title'],'pic'=>$tmp['Pic'], 'price'=>$tmp['Price'], 'sales'=>$tmp['Sales_num'],'rate'=>$tmp['Commission'], 'coupon_price'=>$tmp['Quan_price'],'coupon_link'=>$tmp['Quan_link'], 'is_tmall'=>$tmp['IsTmall'], 'content'=>$tmp['Introduce']];
            $tmp['Pic'] = $pic;
            $edata = json_encode($tmp, JSON_UNESCAPED_UNICODE);
            $save_data['edata'] = $edata;
    		return $save_data;
    	}
        return null;
    }

    private function save_goods_data($data)
    {
    	$goodsModel = new AgentGoods();
    	$ret = $goodsModel->saveAll($data, false);
    	return $ret;
    }

    public function dapaiquan($page, $sort)
    {
        $limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
    	$data = $this->query_goods_list(1, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function get_sort_str($sort)
    {
        $sortstr = "";
        switch ($sort) {
            case '0':
                $sortstr = "id asc";
                break;
            case '1':
                $sortstr = "price asc";
                break;
            case '2':
                $sortstr = "sales desc";
                break;
            case '3':
                $sortstr = "coupon_price desc";
                break;
            default:
                $sortstr = "id asc";
                break;
        }
        return $sortstr;
    }

    public function query_goods_list($type, $sortstr, $first, $page_limit)
    {
    	$back_rate = config('back_rate');
    	$houma_rate = config('houma_rate');
    	$uphour = config('uphour');
    	$s_today = mktime(0,0,0,date('m'),date('d'),date('Y'));
    	$sql = "select id, iid, name, pic, price, sales, rate, coupon_price, cid, content, is_tmall from agent_goods where type=$type and status=1  order by $sortstr limit $first, $page_limit;";
    	$ret = Db::query($sql);
    	if($ret){
    		$len = count($ret);
    		for($i=0; $i<$len; $i++){
    			$sales = (int)$ret[$i]['sales'];
    			if($sales >= 10000){
    				$ret[$i]['sales'] = round($sales/10000, 2) . '万';
    			}
    			$price = (float)$ret[$i]['price'];
    			$rate = (float)$ret[$i]['rate'] * 0.01;
    			$s_price = $price + (float)$ret[$i]['coupon_price'];
    			$ret[$i]['s_price'] = round($s_price, 2);
    			$commission = $back_rate * $price * $rate * $houma_rate;
    			$ret[$i]['commission'] = round($commission, 2);
    		}
    		return $ret;
    	}else{
    		return [];
    	}
    }


    public function get_tkjd_classlist()
    {
    	$tk_key = config('tkjd_key');
    	$url = 'http://api.tkjidi.com/classList?appkey='.$tk_key;
    	// $ret = file_get_contents($url);
        $ret = Http::get($url);
    	$ret = json_decode($ret, true);
    	if ($ret['status'] == 200){
    		$tmp = $ret['data'];
    		$classModel = new AgentClasslist();
    		foreach($tmp as $row){
    			$ret = $classModel
    				->data(['c_id'=>$row['id'], 'c_name'=>$row['classname']])
    				->isUpdate(false)->save();
    		}
    	}
    }

    public function k99($page, $sort)
    {
    	$limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
        $data = $this->query_goods_list(2, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function top100($page, $sort)
    {
    	$limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
        $data = $this->query_goods_list(3, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function juhuasuan($page, $sort)
    {
    	$limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
        $data = $this->query_goods_list(4, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function main_goods_list($page, $sort='0', $cid=0)
    {
        $limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
        $type = 5;
    	if ($cid != 0){
    		$type = (int)$cid + 50;
    	}
        $data = $this->query_goods_list($type, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function good_coupon_list($page, $sort)
    {
    	$limit = config('page');
        $first = ($page-1)*$limit;
        $sortstr = $this->get_sort_str($sort);
        $data = $this->query_goods_list(6, $sortstr, $first, $limit);
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function get_goods_title($iid)
    {
    	$ret = get_goods_info($iid);
    	$data = [];
    	if($ret){
    		$tmplist = $ret['n_tbk_item'];
    		foreach($tmplist as $tmp)
    		{
    			$data = $tmp['title'];
    		}
    	}
    	return $data;
    }

    public function super_tkjd_search($key)
    {
        $back_rate = config('back_rate');
        $houma_rate = config('houma_rate');
        $data = $this->tkjd_data_api('search', 1, $key);
        $dataList = [];
        if ($data){
            $data = $data['data']['data'];
            $len = count($data);
            $len = $len > 2 ? 2 : $len;
            for($i=0; $i<$len; $i++){
                $row = $data[$i];
                if (array_key_exists('id', $row)){
                    $id = $row['id'];
                    $detail = $this->tkjd_data_api('detail', 1, $id);
                    if ($detail){
                        $detail_row = $detail['data'];
                        $iid = $row['goods_id'];
                        $name = $row['goods_name'];
                        $pic = check_pic_url($row['pic']);
                        $price = (float)$row['price_after_coupons'];
                        $coupon_price = (float)$row['price_coupons'];
                        $s_price = round($price + $coupon_price, 2);
                        $rate = (float)$detail_row['rate'] * 0.01;
                        $commission = $back_rate * $price *  $rate * $houma_rate;
                        $commission = round($commission, 2);
                        $is_tmall = $row['tmall']=='1' ? 1 : 0;
                        $sales = (int)$detail_row['sales'];
                        if ($sales >= 10000){
                            $sales = round($sales/10000, 2) . '万';
                        }
                        $dataList[] = ['iid'=>$iid, 'name'=>$name, 'pic'=>$pic, 'sales'=>$sales, 'rate'=>$rate, 'coupon_price'=>$coupon_price, 'is_tmall'=>$is_tmall, 'cid'=>0, 's_price'=>$s_price, 'commission'=>$commission, 'price'=>$price];
                    }
                    
                }else{
                    break;
                }
            }
        }
        return $dataList;
    }

    public function check_taokouling_test($key='')
    {
        $key = '复制整段信息，打开天猫APP，即可查看此商品:【百逸斗龙战士5变形玩具男孩枪斗龙手环手表号角爆射龙弹龙蛋兽3】(未安装App点这里：http://zmnxbc.com/s/ZOtIb?tm=4621d2 )喵口令';
        // $key = '篮球';
        // $key = '【我剁手都要买的宝贝（浙江台州仙居特产手工红糖馒头芝麻糖糕点发糕网红零食小吃早餐），快来和我一起瓜分红I包】http://www.dwntme.com/h.ZYf4Z09 点击链接，再选择浏览器打开；或复制这条信息￥kigq0NUlzaB￥后打开手淘';
        $name = reslove_kouling($key);
        echo $name;
    }

    public function super_search($key, $page, $sort)
    {
        //检测淘口令
        $kl_res = reslove_kouling($key);
        if ($kl_res){
            $key = $kl_res;
        }
        // trace(date('Y-m-d H:i:s').' super_search key=>'.$key, 'error');
        /*$dataList = [];
        $dataList['hasdata'] = 0;
        $dataList['list'] = [];
        return json(['code'=>200, 'msg'=>'success', 'data'=>$dataList]);*/
    	// $key = 'Hello Kitty凯蒂猫迪士尼儿童拍篮球幼儿园用3号5号皮球橡胶蓝球';
    	//默认0，优惠券1，销量2，价格3
    	$pageSize = 30;
    	$url = 'http://pub.alimama.com/items/search.json';
    	$parms = ['q'=>$key, 'toPage'=>$page, 'perPageSize'=>$pageSize, 'shopTag'=>'yxjh'];
    	if ($sort == 1){
    		$parms['shopTag'] = 'yxjh,dpyhq';
    	}else if ($sort == 2){
    		$parms['queryType'] = 0;
    		$parms['sortType'] = 9;
    	}else if ($sort == 3){
    		$parms['queryType'] = 0;
    		$parms['sortType'] = 4;
    	}
    	$dataList = [];
    	for($i=0; $i<2; $i++){
    		if($i==1 ){
    			if ($sort == 1){
    				$parms['shopTag'] = 'dpyhq';
    				$parms['dpyhq'] = 1;
    			}else{
    				$parms['shopTag'] = '';
    			}
    		}
    		$ret = Http::get($url, $parms);
    		if(!$ret){
    			break;
    		}
    		$dataList['list'] = [];

            if($page == 1 and $sort==0){
                $tkjd_data = $this->super_tkjd_search($key);
                if ($tkjd_data){
                    foreach ($tkjd_data as $row) {
                        $dataList['list'][] = $row;
                    }
                }
            }
    		$dataList['hasdata'] = 0;
    		$ret = json_decode($ret, true);
    		if($ret['data']['head']['status'] == 'OK'){
    			
    			$tmplist = $ret['data']['pageList'];

    			if (count($tmplist) >= $pageSize){
    				$dataList['hasdata'] = 1;
    			}
    			foreach($tmplist as $tmp)
    			{
    				$back_rate = config('back_rate');
			    	$houma_rate = config('houma_rate');
    				$name = $this->get_goods_title($tmp['auctionId']);
    				$pic = check_pic_url($tmp['pictUrl']);
    				$data = ['iid'=>$tmp['auctionId'], 'name'=>$name, 'pic'=>$pic, 'sales'=>$tmp['biz30day'], 'rate'=>$tmp['tkRate'], 'coupon_price'=>$tmp['couponAmount'], 'is_tmall'=>$tmp['userType'], 'cid'=>0];
    				$s_price = (float)$tmp['zkPrice'];
					$rate = (float)$data['rate'] * 0.01;
					$sales = (int)$data['sales'];
					if ($sales >= 10000){
						$data['sales'] = round($sales/10000, 2) . '万';
					}
					$price = $s_price - (float)$data['coupon_price'];
					$commission = $back_rate * $price *  $rate * $houma_rate;
					$data['s_price'] = round($s_price, 2);
					$data['commission'] = round($commission, 2);
                    $data['price'] = round($price, 2); 
					$dataList['list'][] = $data;
    			}
    			break;
    		}
    	}

    	return json(['code'=>200, 'msg'=>'success', 'data'=>$dataList]);
    }

    public function super_search_byid($iid)
    {
    	$back_rate = config('back_rate');
    	$houma_rate = config('houma_rate');
    	$q = 'http://item.taobao.com/item.htm?id='.$iid;
    	$url = 'http://pub.alimama.com/items/search.json';
    	$parms = ['q'=>$q, 'toPage'=>1, 'perPageSize'=>50];
    	$ret = Http::get($url, $parms);
    	if(!$ret) return [];
    	$ret = json_decode($ret, true);
    	if($ret['data']['head']['status'] == 'OK'){
    		$tmplist = $ret['data']['pageList'];
    		$tmp = $tmplist[0];
    		$name = $this->get_goods_title($tmp['auctionId']);
    		$pic = check_pic_url($tmp['pictUrl']);
			$data = ['iid'=>$tmp['auctionId'], 'name'=>$name, 'pic'=>$pic, 'sales'=>$tmp['biz30day'], 'rate'=>$tmp['tkRate'], 'coupon_price'=>$tmp['couponAmount'], 'is_tmall'=>$tmp['userType'], 'cid'=>0];
			$s_price = (float)$tmp['zkPrice'];
			$rate = (float)$data['rate'] * 0.01;
			$sales = (int)$data['sales'];
			if ($sales >= 10000){
				$data['sales'] = round($sales/10000, 2) . '万';
			}
			$price = $s_price - (float)$data['coupon_price'];
			$commission = $back_rate * $price *  $rate * $houma_rate;
            $data['price'] = round($price , 2);
			$data['s_price'] = round($s_price, 2);
			$data['commission'] = round($commission, 2);
            $data['coupon_link'] = '';
			return $data;
    	}
    	return [];
    }

    public function get_cate_list()
    {
    	$classModel = new AgentClasslist();
    	$data = $classModel
    		->where(['status'=>1])
    		->field('c_id, c_name')
    		->select();
    	return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);

    }

    public function share_goods_details($request_code, $id, $type = 0)
    {
        $openid = $this->get_openid_bycode($request_code);
        $data = [];
        if (!$openid){
            return json(['code'=>500, 'msg'=>'error', 'data'=>$data]);
        }
        $this->goods_details($openid, $id, $type);
    }


    public function goods_details($openid='system', $id = -1, $type = 0)
    {
    	$houma_rate = config('houma_rate');
    	$back_rate = config('back_rate');
        if($openid != ''){
    	   $this->mark_click($openid, $id, $type);
        }
    	if ($type == 0){
    		$uphour = config('uphour');
    		$s_today = mktime($uphour,0,0,date('m'),date('d'),date('Y'));
    		$sql = "select id, iid, name, pic, price, sales, rate, coupon_price, coupon_link, content, cid, is_tmall from agent_goods where id=$id and status=1  limit 1;";
    		$ret = Db::query($sql);
    		$data = [];
    		if($ret){
    			$len = count($ret);
	    		for($i=0; $i<$len; $i++){
	    			$sales = (int)$ret[$i]['sales'];
	    			if($sales >= 10000){
	    				$ret[$i]['sales'] = round($sales/10000, 2) . '万';
	    			}
	    			$price = (float)$ret[$i]['price'];
	    			$rate = (float)$ret[$i]['rate'] * 0.01;
	    			$s_price = $price + (float)$ret[$i]['coupon_price'];
	    			$ret[$i]['s_price'] = round($s_price, 2);
	    			$commission = $back_rate * $price * $rate * $houma_rate;
	    			$ret[$i]['commission'] = round($commission, 2);
	    		}
    			$data = $ret[0];
    		}
    	}else{
    		$data = $this->super_search_byid($id);
    	}
    	
    	return json_encode(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function new_goods_details($openid='system', $id = -1, $iid = 0)
    {
        $houma_rate = config('houma_rate');
        $back_rate = config('back_rate');
        if($openid != ''){
           $this->mark_click($openid, $id, $iid);
        }
        if ($id != -1){
            $uphour = config('uphour');
            $s_today = mktime($uphour,0,0,date('m'),date('d'),date('Y'));
            $sql = "select id, iid, name, pic, price, sales, rate, coupon_price, coupon_link, content, cid, is_tmall from agent_goods where id=$id and iid=$iid and status=1 limit 1;";
            $ret = Db::query($sql);
            $data = [];
            if($ret){
                $len = count($ret);
                for($i=0; $i<$len; $i++){
                    $sales = (int)$ret[$i]['sales'];
                    if($sales >= 10000){
                        $ret[$i]['sales'] = round($sales/10000, 2) . '万';
                    }
                    $price = (float)$ret[$i]['price'];
                    $rate = (float)$ret[$i]['rate'] * 0.01;
                    $s_price = $price + (float)$ret[$i]['coupon_price'];
                    $ret[$i]['s_price'] = round($s_price, 2);
                    $commission = $back_rate * $price * $rate * $houma_rate;
                    $ret[$i]['commission'] = round($commission, 2);
                }
                $data = $ret[0];
            }else{
                $data = $this->super_search_byid($iid);
            }
        }else{
            $data = $this->super_search_byid($iid);
        }
        
        return json_encode(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function mark_click($openid, $id, $type)
    {
    	$uid = null;
    	$today = mktime(0,0,0,date('m'),date('d'),date('Y'));
    	$User = new AgentUser();
    	$ret = $User
    		->where(['openid'=>$openid])
    		->field('id, fid, is_agent')
    		->select();
    	if ($ret){
    		if ($ret[0]['is_agent'] != 1){
    			$fid = $ret[0]['fid'];
    			$userRet = $User
    				->where(['openid'=>$fid])
    				->field('id')
    				->select();
    			if ($userRet){
    				$uid = $userRet[0]['id'];
    			}
    		}else{
    			$uid = $ret[0]['id'];
    		}
    		$Click = new AgentClick();
    		$sql = "select id, count, dumps from agent_click where user_id=$uid and `date` >= $today limit 1;";
    		$sqlRet = Db::query($sql);
    		$arr = [];
    		if ($sqlRet){
                $click_id = $sqlRet[0]['id'];
    			$sqlRet[0]['count'] += 1;
    			$data = $sqlRet[0]['dumps'];
    			$arr = json_decode($data, true);
    			$arr[] = ['openid'=>$openid, 'id'=>$id, 'type'=>$type];
    			$arrs = json_encode($arr, JSON_UNESCAPED_UNICODE);
    			$back = $Click
    				->where(['id'=>$click_id])
    				->update(['count'=>$sqlRet[0]['count'], 'dumps'=>$arrs]);
    		}else{
    			$arr[] = ['openid'=>$openid, 'id'=>$id, 'type'=>$type];
    			$arrs = json_encode($arr, JSON_UNESCAPED_UNICODE);
    			$back = $Click
    				->data(['user_id'=>$uid, 'count'=>1, 'date'=>$today+1, 'dumps'=>$arrs])
    				->isUpdate(false)->save();
    		}
    	}
    }

    public function get_pid($openid)
    {
    	$User = new AgentUser();
    	$ret = $User
    		->where(['openid'=>$openid, 'status'=>1])
    		->field('id, pid')->select();
    	if($ret){
    		return $ret[0]['pid'];
    	}
    	return null;
    }

// http://localhost/agent/public/index.php/api/agent/get_tkl?openid=ol09J5OTocMNw5HUzYcH1iD_R2Vw&iid=558490629646&title=123fssfgsdfs&pic=123.jpg
    public function get_tkl($openid, $iid, $title, $pic, $coupon_link='')
    {
        // return json(['code'=>500, 'msg'=>'error', 'data'=>'']);
    	$pid = $this->get_pid($openid);
    	if(!$pid){
    		$pid = $this->get_pid(config('system_openid'));
    	}
        $data = [];
    	$resArr = transform_link($iid, $coupon_link, $pid);
        // dump($resArr);exit;
        if ($resArr['tk_link'] && $resArr['from_site'] != 3){
            $data = transform_tbk_link($resArr['tk_link'], $title, $pic);
            if ($data){
                return json(['code'=>200, 'msg'=>'success=>'.$resArr['from_site'], 'data'=>$data]);
            }
            return json(['code'=>500, 'msg'=> $resArr['from_site'].'链接转换淘口令失败,链接错误', 'data'=>$data]);
        }
    	return json(['code'=>200, 'msg'=>'success=>'.$resArr['from_site'], 'data'=>$resArr['tk_link']]);
    }

    public function get_cookie()
    {
        $Conf = new AgentConfigure();
        $ret = $Conf
            ->where(['status'=>1])
            ->field('id, tkl_cookie')->select();
        if ($ret){
            return $ret[0]['tkl_cookie'];
        }
        return '';
    }

    public function get_openid_bycode($code)
    {
        $User = new AgentUser();
        $ret = $User
            ->where(['is_agent'=>1, 'request_code'=>$code])
            ->field('openid')->select();
        if ($ret){
            if (count($ret) == 1){
                return $ret[0]['openid'];
            }
        }   
        return '';
    }

}