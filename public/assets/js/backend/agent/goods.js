define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'agent/goods/index',
                    add_url: 'agent/goods/add',
                    edit_url: 'agent/goods/edit',
                    del_url: 'agent/goods/del',
                    multi_url: 'agent/goods/multi',
                    table: 'agent_goods',
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
                        {field: 'iid', title: __('Iid')},
                        {field: 'type', title: __('Type')},
                        {field: 'name', title: __('Name')},
                        {field: 'pic', title: __('Pic')},
                        {field: 'price', title: __('Price')},
                        {field: 'sales', title: __('Sales')},
                        {field: 'rate', title: __('Rate')},
                        {field: 'page', title: __('Page')},
                        {field: 'coupon_price', title: __('Coupon_price')},
                        {field: 'coupon_link', title: __('Coupon_link')},
                        {field: 'is_tmall', title: __('Is_tmall')},
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