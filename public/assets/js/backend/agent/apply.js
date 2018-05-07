define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'agent/apply/index',
                    add_url: 'agent/apply/add',
                    edit_url: 'agent/apply/edit',
                    del_url: 'agent/apply/del',
                    multi_url: 'agent/apply/multi',
                    table: 'agent_apply',
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
                        {field: 'real_name', title: __('Real_name')},
                        {field: 'iphone', title: __('Iphone')},
                        {field: 'wx_token', title: __('Wx_token')},
                        {field: 'zhifubao', title: __('Zhifubao')},
                        {field: 'reason', title: __('Reason')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
                        {field: 'createtime', title: __('Createtime'), formatter: Table.api.formatter.datetime},
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            formatter: Table.api.formatter.datetime,
                            visible: false,
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate,
                            visible: false,
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            $(document).on("click", ".btn-apply", function (e) {
                e.preventDefault();
                var ids = Table.api.selectedids(table);
                if(ids.length!==1){
                    alert('只能选择一个');
                }
                //循环弹出多个编辑框
                $.each(ids, function (i, id) {
                    Fast.api.open('agent/apply/commit' + "?id=" + id, "用户信息");
                });
            });
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