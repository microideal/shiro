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
<@leftMenu pageName="system"/>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                详细信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 权限管理</a></li>
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
                        <form id="form" role="form" method="post" action="/backend/role/saveOrUpdate">
                            <input type="hidden" name="id" value="${((entity.id)?c)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label>角色名称</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="name" class="form-control" id="name" placeholder="请输入名称" value="${(entity.name)!}">
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label>角色值</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="value" class="form-control" id="value" placeholder="请输入值" value="${(entity.value)!}">
                                        </div>
                                    </div>
                                </div>
                            </div>

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
            'entity.username': "required"
        },
        messages: {
            'entity.username': "请输入名称"
        }
    });

</script>
</html>