<?php

namespace app\admin\model;

use think\Model;

class AgentApply extends Model
{
    // 表名
    protected $table = 'agent_apply';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    
    // 追加属性
    protected $append = [

    ];
    

    







}
