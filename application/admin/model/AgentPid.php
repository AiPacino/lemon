<?php

namespace app\admin\model;

use think\Model;

class AgentPid extends Model
{
    // 表名
    protected $table = 'agent_pid';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [
        'use_time_text'
    ];
    

    



    public function getUseTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['use_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setUseTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
