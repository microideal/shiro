<html>
<head>
    <title>详细信息</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
<#include "../common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
<div class="wrapper">
<#include "../common/top.ftl">
<#include "../common/left.ftl">
<@leftMenu pageName="authority"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                详细信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 运营管理</a></li>
                <li class="active">详细信息</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">

                    <div class="box box-info">
                        <div class="box-header with-border">
                        </div><!-- /.box-header -->
                        <!-- form start -->
                        <form id="form" role="form" method="post" action="/backend/admin/save" enctype="multipart/form-data">
                            <input type="hidden" name="entity.id" value="${((entity.id)?c)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label>账号</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="entity.username" class="form-control" id="entity.username" placeholder="请输入账号" value="${(entity.username)!}">
                                        </div>
                                    </div>
                                </div>
                                <#--<div class="form-group">
                                    <label>角色</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <select name="entity.roleId" class="form-control">
                                                <option value="2" <#if (((entity.roleId)!0) == 2)>selected</#if>>运营专员</option>
                                                <option value="1" <#if (((entity.roleId)!0) == 1)>selected</#if>>超级管理员</option>
                                            </select>
                                         </div>
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <label>密码</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" name="entity.password" placeholder="请输入密码" value="">
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<#include "../common/footer.ftl">
</div>
</body>
<script>
    $("#form").validate({
        rules: {
            'entity.username': "required",
            'entity.password': "required"
        },
        messages: {
            'entity.username': "请输入名称",
            'entity.password': "请输入密码"
        }
    });

</script>
</html>