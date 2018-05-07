define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'agent/user/index',
                    add_url: 'agent/user/add',
                    edit_url: 'agent/user/edit',
                    del_url: 'agent/user/del',
                    multi_url: 'agent/user/multi',
                    table: 'agent_user',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'openid', title: __('Openid')},
                        {field: 'nick', title: __('Nick')},
                        {field: 'sex', title: __('Sex')},
                        {field: 'province', title: __('Province')},
                        {field: 'city', title: __('City')},
                        {field: 'fid', title: __('Fid')},
                        {field: 'head_img', title: __('Head_img')},
                        {field: 'is_agent', title: __('Is_agent')},
                        {field: 'money', title: __('Money')},
                        {field: 'pid', title: __('Pid')},
                        {field: 'customer_count', title: __('Customer_count')},
                        {field: 'order_count', title: __('Order_count')},
                        {field: 'total_commission', title: __('Total_commission')},
                        {field: 'request_code', title: __('Request_code')},
                        {field: 'tixian', title: __('Tixian')},
                        {field: 'spread_count', title: __('Spread_count')},
                        {field: 'spread_money', title: __('Spread_money')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
                        {field: 'agent_time', title: __('Agent_time'), formatter: Table.api.formatter.datetime},
                        {field: 'createtime', title: __('Createtime'), formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});