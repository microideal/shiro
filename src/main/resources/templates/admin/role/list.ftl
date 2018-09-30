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
                <i class="fa  fa-search"></i>角色列表
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 角色管理</a></li>
                <li class="active">角色列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-info">
                        <div class="box-header with-border form-horizontal">
                            <@shiro.hasPermission name="/backend/role/add">
                            <div class="form-group  col-sm-12 ">
                                <a href="/backend/role/view"><button class="btn pull-left btn-primary"><i class="fa fa-plus "></i>新增</button></a>
                            </div>
                            </@shiro.hasPermission>

                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <table id="data-list" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th>角色名</th>
                                        <th>角色值</th>
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
                        <div style="width:280px; height:400px; overflow:auto;"><#--滚动条-->
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
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
        url : "/backend/role/queryListPage",
        columns : [
            {"data": "name"},
            {"data": "value"},
            {"data": "id"}
        ],
        columnDefs : [
            {
                "aTargets":[2],
                "data": "id",
                "render":function(data,type,full){
                    var addAuthority = '';
                    <@shiro.hasPermission name="/backend/role/addAuthority">
                         addAuthority = '<a class="btn btn-danger btn-xs m-l-10" onclick="addRoleAuthorities('+data+');">权限分配</a>';
                    </@shiro.hasPermission>

                    var edit = '';
                    <@shiro.hasPermission name="/backend/role/edit">
                         edit = '<a href="/backend/role/view?id='+data+'" class="btn btn-info btn-xs">编辑</a>';
                    </@shiro.hasPermission>

                    var deleteRole = '';
                    <@shiro.hasPermission name="/backend/role/delete">
                         deleteRole = '<a onclick="delById('+data+');" class="btn btn-info btn-xs">删除</a>';
                    </@shiro.hasPermission>
                    return addAuthority + edit + deleteRole;
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
        layer.confirm('您确定要删除该角色吗？', {
            btn: ['确认','取消'] //按钮
        }, function(){
            $.ajax({
                cache: true,
                type: "DELETE",
                url:'/backend/role/' + id,
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

