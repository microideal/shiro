<html>
<head>
    <title>Banner列表</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
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
                <i class="fa  fa-search"></i>管理员列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 管理员管理</a></li>
                <li class="active">管理员列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <@shiro.hasPermission name="/backend/admin/add">
                            <div class="form-group  col-sm-12 ">
                                <a href="/backend/admin/view"><button class="btn pull-left btn-primary"><i class="fa fa-plus "></i>新增</button></a>
                            </div>
                            </@shiro.hasPermission>

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th>账号名称</th>
                                        <#--<th>角色</th>-->
                                        <th>状态</th>
                                        <th>创建时间</th>
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

    <div class="modal fade bs-example-modal-sm"  id="selectRole" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="selectRoleLabel">分配角色</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm" >

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" onclick="saveUserRoles();" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
<#include "../common/footer.ftl">
</div>
</body>
<script>
    var option = {
        url : "/backend/admin/list/ajax",
        columns : [
            {"data": "username"},
            /*{"data": "roleId"},*/
            {"data": "status"},
            {"data": "createTime"},
            {"data": "id"}
        ],
        columnDefs : [
            /*{
                "aTargets":[1],
                "data": "roleId",
                "render":function(data,type,full){

                    if(data == 1){

                        return "超级管理员";
                    }else if(data == 2){

                        return "运营专员";
                    }
                    return "";
                }
            },*/
            {
                "aTargets":[1],
                "data": "status",
                "render":function(data,type,full){

                    if(data == 1){

                        return "启用";
                    }
                    return "";
                }
            },
            {
                "aTargets":[3],
                "data": "id",
                "render":function(data,type,full){
                    var addRole = '';
                    <@shiro.hasPermission name="/backend/admin/addRole">
                        addRole = '<a onclick="allotRole('+data+')" class="btn btn-danger btn-xs m-l-10">角色分配</a>';
                    </@shiro.hasPermission>

                    var edit = '';
                    <@shiro.hasPermission name="/backend/admin/edit">
                        edit = '<a href="/backend/admin/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>';
                    </@shiro.hasPermission>

                    var deleteAdmin = '';
                    <@shiro.hasPermission name="/backend/admin/delete">
                        deleteAdmin = '<a href="/backend/admin/delete/'+data+'" class="btn btn-danger btn-xs m-l-10">删除</a>'
                    </@shiro.hasPermission>
                    return addRole + edit + deleteAdmin;
                }
            }
        ]
    };

    //弹出选择角色的框
    function allotRole(userId){
        /*var id = $(".checkchild:checked").val();
        if ($(".checkchild:checked").length < 1)
        {
            layer.msg('请选择一条数据');
            return;
        }
        if ($(".checkchild:checked").length > 1)
        {
            layer.msg('一次只能修改一条数据');
            return;
        }*/
        var param = {};
        param.userId = userId;
        $.ajax({
            async:false,
            type : "GET",
            data:param,
            url: '/backend/role/queryUserRoleWithSelected',
            dataType:'json',
            success: function(result){
                $("#boxRoleForm").empty();
                var htm = "<input type='hidden' id='checkedUserId' name='checkedUserId' value='"+userId+"'>";
                for(var i=0;i<result.data.length;i++){
                    htm += "<div class='checkbox'><label><input type='checkbox' name='roleId' value='"+result.data[i].id+"'";
                    if(result.data[i].selected==1){
                        htm += " checked='checked'";
                    }
                    htm +="/>"+result.data[i].name+"</label></div>";
                }
                $("#boxRoleForm").append(htm);
            }
        });

        $('#selectRole').modal();
    }

    //保存角色的选择
    function saveUserRoles() {
        //alert($('#boxRoleForm').serialize());
        var roleIds = [];//定义一个空数组
        $("input[name='roleId']:checked").each(function(i){//把所有被选中的复选框的值存入数组
            roleIds[i] = $(this).val();
        });
        var userId = $("#checkedUserId").val();

        $.ajax({
            cache: true,
            headers: {'Content-Type': 'application/json'},
            type: "POST",
            url:'/backend/role/addUserRole',
            data:JSON.stringify({userId:userId,roleIds:roleIds}),// 你的formid
            async: false,
            dataType:'json',
            success: function(result) {
                if(result.status=="SUCCESS"){
                    layer.msg('保存成功');
                    $('#selectRole').modal('hide');
                }else{
                    layer.msg('保存失败');
                    $('#selectRole').modal('hide');
                }
            }
        })
    }

    var dataTable = ajaxDataTable($("#data-list"),option);

    $("#search").click(function () {
        dataTable.ajax.reload();
    });
</script>
</html>

