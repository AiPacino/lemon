define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'agent/order/index',
                    add_url: 'agent/order/add',
                    edit_url: 'agent/order/edit',
                    del_url: 'agent/order/del',
                    multi_url: 'agent/order/multi',
                    table: 'agent_order',
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
                        {field: 'user_id', title: __('User_id')},
                        {field: 'iid', title: __('Iid')},
                        {field: 'name', title: __('Name')},
                        {field: 'pic', title: __('Pic')},
                        {field: 'shop', title: __('Shop')},
                        {field: 'pay_money', title: __('Pay_money')},
                        {field: 'income', title: __('Income')},
                        {field: 'order_time', title: __('Order_time'), formatter: Table.api.formatter.datetime},
                        {field: 'adzone_id', title: __('Adzone_id')},
                        {field: 'rate', title: __('Rate')},
                        {field: 'order_num', title: __('Order_num')},
                        {field: 'goods_num', title: __('Goods_num')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
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