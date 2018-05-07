<?php

namespace app\admin\controller\agent;

use app\admin\model\AgentTixian;
use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 提现记录管理
 *
 * @icon fa fa-circle-o
 */
class Tixian extends Backend
{
    
    /**
     * AgentTixian模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('AgentTixian');

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个方法
     * 因此在当前控制器中可不用编写增删改查的代码,如果需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    public function commit(){
        $id = input("id", "0");
        $item = AgentTixian::get($id);
        $data = [];
        if($item){
            $id = $item['id'];
        }
        $this->view->assign("id", $id);
        return $this->view->fetch();
    }
    

}
