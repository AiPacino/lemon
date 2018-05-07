<?php

namespace app\admin\controller\agent;

use app\admin\model\AgentApply;
use app\admin\model\AgentUser;
use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 申请代理管理
 *
 * @icon fa fa-circle-o
 */
class Apply extends Backend
{
    
    /**
     * AgentApply模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('AgentApply');

    }
    
    public function commit(){
        $id = input("id", "0");
        $item = AgentApply::get($id);
        $data = [];
        if($item){
            $openId = $item['openid'];
            $userModel = new AgentUser();
            $user = $userModel->where('openid',$openId)->find();
            if($user){
                $data['id'] = $id;
                $data['nick'] = $user['nick'];
                $data['head_img'] = $user['head_img'];
                $data['openid'] = $openId;
                $data['create_time'] = datetime($user['createtime']);

                $data['real_name'] = $item['real_name'];
                $data['phone'] = $item['iphone'];
                $data['wx_token'] = $item['wx_token'];
                $data['zhifubao'] = $item['zhifubao'];
                $data['reason'] = $item['reason'];
                $data['apply_time'] = datetime($item['createtime']);
            }
        }
        $this->view->assign("data", $data);
        return $this->view->fetch();
    }

}
