<?php
/**
 * Created by PhpStorm.
 * User: yangqihua
 * Date: 2018/1/15
 * Time: 下午10:28
 */

namespace app\api\controller;

use app\common\controller\Api;
use app\admin\model\AgentUser;
use app\admin\model\AgentApply;
use app\admin\model\AgentOrder;
use app\admin\model\AgentSpread;
use app\admin\model\AgentTixian;
use app\admin\model\AgentPid;
use app\common\model\Config as meConfig;

use fast\Http;
use think\Db;

class Auth extends Api
{

    public function _initialize()
    {
        parent::_initialize();
    }

    public function login()
    {
        $checkout = 1;
        $code = input("code", '');
        $avatarUrl = input('avatarUrl', '');
        $request_code = input('request_code', '');
        $city = input('city', '');
        $province = input('province', '');
        $nick = input('nickName', '');
        $sex = input('gender', '');
        if (!$code) {
            return json(["code" => 500, "data" => "code无效"]);
        }
        $wxConfig = config('wxApp');

        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid=' . $wxConfig['appId'] . '&secret=' . $wxConfig['appSecret'] . '&js_code=' . $code . '&grant_type=authorization_code';

        $result = json_decode(Http::post($url), true);
        $data = [];
        if ($result) {
            $openid = $result['openid'];
            $data['openid'] = $openid;
            $ret = $this->save_user_data($openid, $avatarUrl, $request_code, $city, $province, $nick, $sex);
            $data['is_agent'] = $ret['is_agent'];
            $data['request_code'] = $ret['request_code'];
            $data['checkout'] = $checkout;
            return json(['code' => 200, 'data' => $data]);
        }
        return json(["code" => 500, "data" => "服务器异常"]);
    }


    public function check_agent($openid)
    {
        $checkout = 1;
        $User = new AgentUser();
        $userRet = $User
            ->where(['openid'=>$openid, 'status'=>1])
            ->field('id, is_agent, request_code')
            ->select();
        $data = [];
        $data['is_agent'] = -1;
        $data['request_code'] = '';
        if ($userRet){
            $data['is_agent'] = $userRet[0]['is_agent'];
            $data['request_code'] = $userRet[0]['request_code'];
            $data['checkout'] = $checkout;
            return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
        }
        return json(['code'=>200, 'msg'=>'failure', 'data'=>$data]);
    }


    public function save_user_data($openid, $avatarUrl, $request_code, $city, $province, $nick, $sex)
    {
        $User = new AgentUser();
        $userRet = $User
            ->where(['openid'=>$openid])
            ->field('id, is_agent, request_code')
            ->select();
        if (!$userRet){
            $fid = config('system_openid');
            $uid = $this->get_uid_byOpenid($fid);
            $udata = $this->get_user_field($uid, 'pid, request_code, customer_count');
            $cus_count = $udata['customer_count'] + 1;
            $sys_ret = $this->update_user_field($uid, ['customer_count'], [$cus_count]);
            $pid = $udata['pid'];
            if (!$request_code){
                $request_code =  $udata['request_code'];
            }else{
                $selRet = $User
                    ->where(['request_code'=>$request_code, 'status'=>1, 'is_agent'=>1])
                    ->field('id, openid, fid, pid, request_code, customer_count')
                    ->limit(1)
                    ->select();

                if($selRet){
                    $fid = $selRet[0]['openid'];
                    $f_id = $selRet[0]['id'];
                    $cus_c = $selRet[0]['customer_count'] + 1;
                    $uret = $this->update_user_field($f_id, ['customer_count'], [$cus_c]);
                    $pid = $selRet[0]['pid'];
                }
            }
            
            $ret = $User
                ->data(['openid'=>$openid, 'nick'=>$nick, 'sex'=>$sex, 'province'=>$province, 'city'=>$city, 'fid'=>$fid, 'head_img'=>$avatarUrl, 'pid'=>$pid, 'request_code' => $request_code])
                ->isUpdate(false)->save();
            return ['is_agent'=>0, 'request_code'=>$request_code];
        }
        return $userRet[0];
    }

    public function init_super_agent()
    {
        $openid = config('system_openid');
        $nick = '总代理';
        $pid = config('super_pid');
        $fid = 'system';
        $request_code = config('default_code');
        $User = new AgentUser();
        $ret = $User
            ->data(['openid'=>$openid, 'nick'=>$nick, 'fid'=>$fid, 'pid'=>$pid, 'request_code' => $request_code])
            ->isUpdate(false)->save();
        return json(['code'=>200, 'data'=>$ret]);
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

    private function get_fid_byOpenid($openid)
    {
        $User = new AgentUser();
        $ret = $User
            ->where(['openid'=>$openid])
            ->field('id, fid')->select();
        if ($ret){
            $fret = $User
                ->where(['openid'=>$ret[0]['fid']])
                ->field('id')->select();
            if($fret){
                return $fret[0]['id'];
            }
        }
        dump('用户不存在');exit;
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

    public function apply_agent($openid, $real_name='', $iphone='', $wx_token='', $zhifubao='', $reason='')
    {
        $Apply = new AgentApply();
        $ret = $Apply
            ->data(['openid'=>$openid, 'real_name'=>$real_name, 'iphone'=>$iphone, 'wx_token'=>$wx_token, 'zhifubao'=>$zhifubao, 'reason'=>$reason, 'status'=>0])
            ->isUpdate(false)->save();
        // dump($Apply->id);exit;
        $Spread = new AgentSpread();
        $f_id =  $this->get_fid_byOpenid($openid);
        $uid = $this->get_uid_byOpenid($openid);
        $uret = $this->update_user_field($uid, ['is_agent'], [2]);
        $reward = config('agent_reward');
        $sret = $Spread
            ->data(['from_user_id'=>$f_id, 'to_user_id'=>$uid, 'reward'=>$reward, 'status'=>0])
            ->isUpdate(false)->save();

        //自动通过审核。。。
        $this->permit_agent($Apply->id);
        return json(['code'=>200, 'data'=>'审核通过']);
    }

    public function add_new_pid($pid) 
    {
        $PidM = new AgentPid();
        $select_ret = $PidM
            ->where(['pid'=>$pid])
            ->field('id, pid')
            ->select();
        if (!$select_ret){
            $ret = $PidM
                ->data(['pid'=>$pid])
                ->isUpdate(false)->save();
            if ($ret){
                return json(['code'=>200, 'msg'=>'success', 'data'=>'ok']);
            }
        }
        return json(['code'=>500, 'msg'=>'success', 'data'=>'pid数据已经存在']);
    }

    public function get_new_pid($uid, $openid)
    {
        $userdata = $this->get_user_field($uid, 'nick');
        $PidM = new AgentPid();
        $find_ret = $PidM
            ->where(['status'=>0])
            ->field('id, pid')
            ->limit(1)->select();
        if (!$find_ret){
            return null;
        }
        $id = $find_ret[0]['id'];
        $pid = $find_ret[0]['pid'];
        $nick = $userdata ? $userdata['nick'] : '';
        $ret = $PidM
            ->where(['id'=>$id])
            ->update(['user_id'=>$uid, 'nick'=>$nick, 'openid'=>$openid, 'use_time'=>time(), 'status'=>1]);
        if ($ret > 0){
            return $pid;
        }
        return null;
    }

    public function permit_agent($apply_id)
    {
        $openid = null;
        //将apply status =>1
        $Apply = new AgentApply();
        //获取openid
        $ap_ret = $Apply
            ->where(['id'=>$apply_id, 'status'=>0])
            ->field('openid')->select();
        if ($ap_ret){
            $openid = $ap_ret[0]['openid'];
        }else{
            dump('permit_agent error');exit;
        }

        //获取uid  pid
        $uid = $this->get_uid_byOpenid($openid);
        $pid = $this->get_new_pid($uid, $openid);
        if (!$pid){
            return json(['code'=>500, 'msg'=>'获取pid失败']);
        }

        $u_ap_ret = $Apply
            ->where(['id'=>$apply_id])
            ->update(['status'=>1]);
        
        
        //更新该用户的信息
        $code = $this->generate_request_code($openid);
        $User = new AgentUser();
        $ret = $User
            ->where(['openid'=>$openid])
            ->update(['is_agent'=>1, 'request_code'=>$code, 'pid'=>$pid, 'agent_time'=>time()]);

        
        $f_id = $this->get_fid_byOpenid($openid);
        $reward = config('agent_reward');
        //更新spread表
        $Spread = new AgentSpread();
        $sret = $Spread
            ->where(['from_user_id'=>$f_id,'to_user_id'=>$uid, 'status'=>0])
            ->update(['status'=>1]);
        //查出reward
        $sret = $Spread
            ->where(['from_user_id'=>$f_id, 'status'=>1, 'to_user_id'=>$uid])
            ->field('id, reward')->select();
        if ($sret){
            $reward = $sret[0]['reward'];
        }

        //获取fathter 的字段信息并且更新
        $user_field = $this->get_user_field($f_id, 'openid, money, spread_count, spread_money, customer_count');
        $spread_count = $user_field['spread_count'] + 1;
        $spread_money = $user_field['spread_money'] + $reward;
        $customer_count = $user_field['customer_count'] - 1;
        $money = $user_field['money'] + $reward;
        $fret = $User
            ->where(['id'=>$f_id])
            ->update(['spread_count'=>$spread_count, 'spread_money'=>$spread_money, 'customer_count'=>$customer_count, 'money'=>$money]);

        $data['request_code'] = $code;
        // return json(['code'=>200, 'msg'=>'success', 'data' => $data]);
    }

    public function generate_request_code($openid)
    {
        while (true) {
            $openid = $openid . time();
            $str = md5($openid);  
            $code = substr($str, 26, 6);
            $User = new AgentUser();
            $ret = $User
                ->where(['request_code'=>$code])
                ->field('id')
                ->select();
            if(!$ret){
                break;
            }
        }
        return $code;
    }

    public function user_profile($openid)
    {
        $User = new AgentUser();
        $data = [];
        $userRet = $User
            ->where(['openid'=>$openid])
            ->field('id, openid, is_agent, money, tixian, customer_count, spread_money, request_code')
            ->select();
        $uid = null;
        if($userRet){
            $data = ['money'=>round($userRet[0]['money'], 2), 'customer_count'=>$userRet[0]['customer_count'], 'tixian'=>round($userRet[0]['tixian'], 2), 'spread_money'=>round($userRet[0]['spread_money'], 2), 'request_code'=>$userRet[0]['request_code']];
            $uid = $userRet[0]['id'];
        }
        $lastM = get_time_begin_end('lastmonth');
        $month = get_time_begin_end('month');
        $week = get_time_begin_end('week');
        $day = get_time_begin_end('day');
        
        $data['total_lastm'] = 0.0;
        $data['total_m'] = 0.0;
        $data['notice'] = $this->get_configure('notice');
        $lastM_money = $this->calc_income($uid, $lastM[0], $lastM[1]);
        if ($lastM_money){
            $data['total_lastm'] = round($lastM_money['incomes'], 2);
        }
        $M_money = $this->calc_income($uid, $month[0], $month[1]);
        if ($M_money){
            $data['total_m'] = round($M_money['incomes'], 2);
        }
        $day_click = $this->calc_clicks($uid, $day[0], $day[1]);
        $week_click = $this->calc_clicks($uid, $week[0], $week[1]);
        $totak_click = $this->calc_clicks($uid, 0, $day[1]);
        $data['day_detail'] = ['click'=>$day_click, 'order_num'=>0.0, 'incomes'=>0.0];
        $data['week_detail'] = ['click'=>$week_click, 'order_num'=>0.0, 'incomes'=>0.0];
        $data['total_detail'] = ['click'=>$totak_click, 'order_num'=>0.0, 'incomes'=>0.0];
        $day_detail = $this->calc_income($uid, $day[0], $day[1]);
        if ($day_detail){
            $data['day_detail']['order_num'] = $day_detail['order_num'];
            $data['day_detail']['incomes'] = round($day_detail['incomes'], 2);
        }
        $week_detail = $this->calc_income($uid, $week[0], $week[1]);
        if ($week_detail){
            $data['week_detail']['order_num'] = $week_detail['order_num'];
            $data['week_detail']['incomes'] = round($week_detail['incomes'], 2);
        }
        $total_detail = $this->calc_income($uid, 0, $day[1]);
        if ($total_detail){
            $data['total_detail']['order_num'] = $total_detail['order_num'];
            $data['total_detail']['incomes'] = round($total_detail['incomes'], 2);
        }

        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function get_configure($key)
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

    public function calc_income($uid=1, $begintime=0, $endtime=0)
    {
        $sql = "select count(id) as cnt, sum(income) as sums from agent_order where user_id=$uid and order_time>=$begintime and order_time<$endtime and (status=1 or status=2 or status=4);";
        $ret = Db::query($sql);
        $data = [];
        if($ret[0]['cnt']){
            $data = ['order_num'=>$ret[0]['cnt'], 'incomes'=>$ret[0]['sums']];
        }
        return $data;
    }

    public function calc_clicks($uid=1, $begintime=0, $endtime=0)
    {
        $sql = "select user_id, sum(count) as cnt from agent_click where user_id=$uid and date>$begintime and date<$endtime and status=1;";
        $ret = Db::query($sql);
        if ($ret[0]['user_id']){
            return $ret[0]['cnt'];
        }
        return 0;
    }

    public function update_user_field($uid, $fields, $values)
    {
        $data = [];
        $len = count($fields);
        for ($i=0; $i<$len; $i++) {
            $row = $fields[$i];
            $data[$row] = $values[$i];
        }
        $User = new AgentUser();
        $ret = $User
            ->where(['id'=>$uid])
            ->update($data);
        if ($ret > 0)
            return true;
        else
            return false;
    }

    public function request_tixian_data($openid)
    {
        $min_tixian = config('min_tixian');
        $tixian_notice = $this->get_configure('tixian_notice');
        $Apply = new AgentApply();
        $uid = $this->get_uid_byOpenid($openid);
        $userRet = $this->get_user_field($uid, 'money, tixian');
        $ret = $Apply
            ->where(['openid'=>$openid, 'status'=>1])
            ->field('real_name, wx_token, zhifubao')->select();
        if ($ret && $userRet){
            $money = round($userRet['money'], 2);
            $data = ['openid'=>$openid, 'money'=>$money, 'wx_token'=>$ret[0]['wx_token'], 'zhifubao'=>$ret[0]['zhifubao'], 'min_tixian'=>$min_tixian, 'notice'=>$tixian_notice];
            return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
        }
        return json(['code'=>500, 'msg'=>'error', 'data'=>[]]);
    }

    public function submit_tixian($openid, $tx_money, $type, $token)
    {
        if (!is_numeric($tx_money)){
            return json(['code'=>500, 'msg'=>'非法输入', 'data'=>'异常访问']);
        }
        $min_tixian = config('min_tixian');
        $uid = $this->get_uid_byOpenid($openid);
        $userRet = $this->get_user_field($uid, 'money, tixian');
        if($userRet){  
            $money = $userRet['money'];
            if ( round($money, 2) < $tx_money || $tx_money < $min_tixian){
                return json(['code'=>500, 'msg'=>'余额不足', 'data'=>'异常访问']);
            }
            
            $f_money = $money - $tx_money;
            $tixian = $userRet['tixian'] + $tx_money;
            $this->update_user_field($uid, ['money', 'tixian'], [$f_money, $tixian]);
            $Tixian = new AgentTixian();
            $ret = $Tixian
                ->data(['user_id'=>$uid, 'money'=>$tx_money, 'type'=>$type, 'token'=>$token, 'status'=>0])
                ->isUpdate(false)->save();
            return json(['code'=>200, 'msg'=>'success', 'data'=>'审核中']);
        }
        return json(['code'=>500, 'msg'=>'failure', 'data'=>[]]);
    }

    public function permit_tixian($tixian_id)
    {   
        $Tixian = new AgentTixian();
        $ret = $Tixian
            ->where(['status'=>0, 'id'=>$tixian_id])
            ->field('user_id, money')->select();
        $data = [];
        $code = 500;
        if ($ret){
            $uid = $ret[0]['user_id'];
            $updateRet = $Tixian
                ->where(['id'=>$tixian_id])
                ->update(['status'=>1]);
            $code = 200;
        }
        return json(['code'=>$code, 'msg'=>'success', 'data'=>$data]);
    }

    public function tixian_details($openid, $page=1)
    {
        $page_limit = input('limit', config('msg_page'));
        $first = ($page-1)*$page_limit;
        $uid = $this->get_uid_byOpenid($openid);
        $Tixian = new AgentTixian();
        $ret = $Tixian
            ->where(['user_id'=>$uid])
            ->field('id, money, type, token, status, createtime')
            ->order('createtime desc')
            ->limit($first, $page_limit)
            ->select();
        $data = [];
        $data['list'] = [];
        $data['hasdata'] = 0;
        if($ret){
            $len = count($ret);
            if ($len >= $page_limit){
                $data['hasdata'] = 1;
            }
            foreach($ret as $row){
                $tm = date('Y-m-d H:i:s', $row['createtime']);
                $type = $row['type'];   
                $status = $row['status'] == 0 ? '审核中' : '已结账';
                $data['list'][] = ['money'=>round($row['money'], 2), 'type'=>$type, 'token'=>$row['token'], 'time'=>$tm, 'status'=>$status];
            }
            return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
        }
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function customer_details($openid, $page=1)
    {
        $page_limit = input('limit', config('msg_page'));
        $first = ($page-1)*$page_limit;
        $sql = "select openid, nick, head_img, request_code, city, province, createtime as time from agent_user where openid != '" .$openid. "' and request_code in (select request_code from agent_user where openid='".$openid."' and status=1) order by createtime desc limit $first, $page_limit;";
        $ret = Db::query($sql);
        $data = [];
        
        $data['count'] = 0;
        $data['list'] = [];
        $data['hasdata'] = 0;
        if ($ret){
            $User = new AgentUser();
            $retC = $User
                ->where(['openid'=>$openid])
                ->field('customer_count')->select();
            $cnt = $retC[0]['customer_count'];
            $data['count'] = $cnt;
            $len = count($ret);
            if($len >= $page_limit){
                $data['hasdata'] = 1;
            }
            foreach ($ret as $row) {
                $row['time'] = date('Y-m-d H:i:s', $row['time']);
                $data['list'][] = $row;
            }
        }
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function spread_details($openid, $page=1)
    {
        $page_limit = input('limit', config('msg_page'));
        $first = ($page-1)*$page_limit;
        $uid = $this->get_uid_byOpenid($openid);
        $Spread = new AgentSpread();
        $ret = $Spread
            ->where(['from_user_id'=>$uid, 'status'=>1])
            ->field('to_user_id, reward, createtime')
            ->order('createtime desc')
            ->limit($first, $page_limit)
            ->select();
        $data = [];
        $data['hasdata'] = 0;
        $data['list'] = [];
        if ($ret){
            $len = count($ret);
            if($len >= $page_limit){
                $data['hasdata'] = 1;
            }
            foreach($ret as $row){
                $c_id = $row['to_user_id'];
                $tm = date('Y-m-d H:i:s', $row['createtime']);
                $userRet = $this->get_user_field($c_id, 'nick, head_img');
                $data['list'][] = ['nick'=>$userRet['nick'], 'head_img'=>$userRet['head_img'], 'reward'=>$row['reward'], 'time'=>$tm];  
            }
        }
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function order_details($openid, $page=1, $type=0) 
    {
        $back_rate = config('back_rate');
        $houma_rate = config('houma_rate');
        if ($type>2){
            dump('type 异常');exit;
        }
        $page_limit = config('msg_page');
        $first = ($page-1)*$page_limit;
        $index = ['day', 'week', 'month', 'lastmonth'];
        $times[$index[$type]] = get_time_begin_end($index[$type]);
        $dates = $times[$index[$type]];
        if($type == 2){
            $dates[0] = 0;
            $dates[1] = strtotime(date('Y-m-d') . '+1 day') - 1;
        }
        $uid = $this->get_uid_byOpenid($openid);
        $data = [];
        $sql = 'select id, iid, name, pic, shop, pay_money, income, order_time, rate, order_num, goods_num, is_tmall from agent_order where (status=1 or status=2 or status=4) and user_id='.$uid.' and order_time >='.$dates[0].' and order_time <'.$dates[1]." 
         order by order_time desc limit $first, $page_limit;";
        $ret = Db::query($sql);
        $data['hasdata'] = 0;
        $data['list'] = [];
        if ($ret){
            $len = count($ret);
            if ($len >= $page_limit){
                $data['hasdata'] = 1;
            }
            foreach($ret as $row){
                $rate_precent = round($row['rate'], 2);
                $commission = round($row['income'], 2);
                $pay_money = round($row['pay_money'], 2);
                $tm = date('Y-m-d H:i:s', $row['order_time']);
                $data['list'][] = ['iid'=>$row['iid'], 'name'=>$row['name'], 'pic'=>$row['pic'], 'shop'=>$row['shop'], 'pay_money'=>$pay_money, 'commission'=>$commission, 'rate_precent'=>$rate_precent, 'order_num'=>$row['order_num'], 'goods_num'=>$row['goods_num'], 'order_time'=>$tm, 'is_tmall'=>$row['is_tmall']];
            }
        }
        return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
    }

    public function modify_user_code($openid, $request_code)
    {   
        if (!$request_code){
            return json(['code'=>500, 'msg'=>'error', 'data'=>'fail']);
        }
        $uid = $this->get_uid_byOpenid($openid);
        $User = new AgentUser();
        $ret = $User
            ->where(['is_agent'=>1, 'request_code'=>$request_code])
            ->field('id, openid, pid, customer_count')->select();
        if ($ret){
            $f_id = $ret[0]['id'];
            $bf_id = $this->get_fid_byOpenid($openid);
            if ($f_id == $bf_id){
                return json(['code'=>200, 'msg'=>'success', 'data'=>'ok']);
            }
            $fid = $ret[0]['openid'];
            $pid = $ret[0]['pid'];
            $this->update_user_step($bf_id, 'customer_count', -1);
            $this->update_user_step($f_id, 'customer_count', 1);
            $data = [$fid, $pid, $request_code];
            $this->update_user_field($uid, ['fid', 'pid', 'request_code'], $data);
            return json(['code'=>200, 'msg'=>'success', 'data'=>'ok']);
        }
        return json(['code'=>500, 'msg'=>'error', 'data'=>'fail']);
    }

    private function update_user_step($uid, $field='', $step=0)
    {
        $User = new AgentUser();
        $val = $User
            ->where(['id'=>$uid])
            ->value($field);
        $ret = $User
            ->where(['id'=>$uid])
            ->update([$field=>($val+$step)]);
        return true;
    }

    public function normal_user_info($openid)
    {
        $uid = $this->get_uid_byOpenid($openid);
        $ret = $this->get_user_field($uid, 'request_code');
        $notice = $this->get_configure('normal_notice');
        $data = [];
        if ($ret){
            $data = ['code'=>$ret['request_code'], 'notice'=>$notice];
            return json(['code'=>200, 'msg'=>'success', 'data'=>$data]);
        }
        return json(['code'=>500, 'msg'=>'success', 'data'=>$data]);
    }

    public function calc_lastm_total() 
    {
        $lastM = get_time_begin_end('lastmonth');
        $start = $lastM[0];
        $end = $lastM[1];
        $sql = "select user_id, sum(income) as sums from agent_order where (status=2 or status=1) and order_time >= $start and order_time <= $end group by user_id";
        $ret = Db::query($sql);
        
        if ($ret){
            foreach( $ret as $row ){
                $index = $row['user_id'];
                $reward = $this->calc_spread_reward($index, $start, $end);
                $tmoney = $row['sums'] + $reward;
                $uret = AgentUser::get($index);
                $uret->money += $tmoney;
                $uret->save();
            }
            $sql = "update agent_order set status=4 where (status=2 or status=1) and order_time >= $start and order_time <= $end;";
            $updateRet = Db::execute($sql); 
            return json(['code'=>200, 'msg'=>'success', 'data'=>[]]);
        }
        return json(['code'=>500, 'msg'=>'用户不存在', 'data'=>[]]);

    }

    private function calc_spread_reward($u_id, $start, $end)
    {
        $sql = "select id, reward from agent_spread where from_user_id=$u_id and status=1 and createtime >= $start and createtime <= $end";
        $ret = Db::query($sql);
        $reward = 0;
        if ($ret){
            foreach ($ret as $row){
                $reward += (float)$row['reward'];
            }
        }
        return $reward;
    }

}