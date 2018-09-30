<html>
<head>
    <title>角色列表</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${request.contextPath}/static/matrix-style.css">
    <link rel="stylesheet" href="${request.contextPath}/static/metroStyle.css">
    <link rel="stylesheet" href="${request.contextPath}/static/matrix-media.css">
<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
<#include "../common/top.ftl">
<#include "../common/left.ftl">
<@leftMenu pageName="authority"/>
    <div class="content-wrapper" style="min-height: 916px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa  fa-search"></i>权限列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 权限管理</a></li>
                <li class="active">权限列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <@shiro.hasPermission name="/backend/authority/add">
                            <div class="form-group  col-sm-12 ">
                                <a href="/backend/authority/view"><button class="btn pull-left btn-primary"><i class="fa fa-plus "></i>新增</button></a>
                            </div>
                            </@shiro.hasPermission>

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th>权限id</th>
                                        <th>权限名</th>
                                        <th>权限值</th>
                                        <th>父级权限id</th>
                                        <th>排序值</th>
                                        <th>权限类型</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                </table>
                            </div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section>
    </div>

    <#--权限弹窗-->
    <div class="modal fade bs-example-modal-sm"  id="selectResources" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
        <div class="modal-dialog modal-sm" role="document" style="height: 600px; "  >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="selectRoleLabel">分配权限</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm" >
                        <ul id="treeDemo" class="ztree"></ul>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" onclick="saveRoleResources();" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
<#include "../common/footer.ftl">
</div>
</body>
<script>
    var option = {
        url : "/backend/authority/queryListPage",
        columns : [
            {"data": "id"},
            {"data": "name"},
            {"data": "value"},
            {"data": "parentId"},
            {"data": "sort"},
            {"data": "type"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets":[5],
                "data": "status",
                "render":function(data,type,full){
                    if(data == 0){
                        return "一级菜单";
                    }
                    if(data == 1){
                        return "二级菜单";
                    }
                    if(data == 2){
                        return "页面按钮";
                    }
                    return "";
                }
            },
            {
                "aTargets":[6],
                "data": "id",
                "render":function(data,type,full){
                    var edit = '';
                    <@shiro.hasPermission name="/backend/authority/edit">
                        edit = '<a href="/backend/authority/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>';
                    </@shiro.hasPermission>

                    var deleteAuthority = '';
                    <@shiro.hasPermission name="/backend/authority/edit">
                        deleteAuthority = '<a onclick="delById('+data+');" class="btn btn-danger btn-xs m-l-10">删除</a>';
                    </@shiro.hasPermission>
                    return edit + deleteAuthority;
                }
            }
        ]
    }

    var dataTable = ajaxDataTable($("#data-list"),option);

    var roleId;//下面保存的时候要用
    function addRoleAuthorities(rid){
        var setting = {
            check: {
                enable: true,
                chkboxType:  { "Y" : "p", "N" : "s" }
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "parentId"
                }
            }
        };

        roleId = rid;
        var param = {};
        param.roleId = rid;
        $.ajax({
            async:false,
            type : "GET",
            //data:{rid:rid},
            data: param,
            url: "/backend/authority/queryRoleAuthorityWithSelectedByRoleId",
            dataType:'json',
            success: function(result){
                $.fn.zTree.init($("#treeDemo"), setting, result.data);
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.expandAll(true);
                $('#selectResources').modal();
            }
        });

    }

    //保存权限的选择
    function saveRoleResources() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                checkNode= zTree.getCheckedNodes(true);
        var ids = new Array();
        for(var i=0;i<checkNode.length;i++){
            ids.push(checkNode[i].id);
        }

        $.ajax({
            async:false,
            headers: {'Content-Type': 'application/json'},
            type : "POST",
            data:JSON.stringify({roleId:roleId,authorityIds:ids}),
            url: "/backend/role/addRoleAuthority",
            success: function(result){
                if(result.status=="SUCCESS"){
                    layer.msg('保存成功');
                    $('#selectResources').modal('hide');
                }else{
                    layer.msg('保存失败');
                    $('#selectResources').modal('hide');
                }
            }
        });
    }

    function delById(id) {
        layer.confirm('您确定要删除该权限吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                cache: true,
                type: "DELETE",
                url:'/backend/authority/' + id,
                //data:{id:id},
                async: false,
                success: function(result) {
                    if(result.status=="SUCCESS"){
                        layer.msg('删除成功');
                        dataTable.ajax.reload();
                    }else if(result.status=="FAILURE"){
                        layer.msg(result.error);
                    }else{
                        layer.msg('删除失败');
                    }
                }
            });
        });


    }

    $("#search").click(function () {
        dataTable.ajax.reload();
    });
</script>
</html>

