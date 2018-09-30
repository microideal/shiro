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
                        <form id="form" role="form" method="post" action="/backend/authority/saveOrUpdate">
                            <input type="hidden" name="id" value="${((entity.id)?c)!}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label>权限名</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="name" class="form-control" id="name" placeholder="请输入名称" value="${(entity.name)!}">
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label>权限值</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="value" class="form-control" id="value" placeholder="请输入值" value="${(entity.value)!}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>父级权限id</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="parentId" class="form-control" id="parentId" placeholder="请输入值" value="${(entity.parentId)!}">
                                        </div>
                                        ${parentIdError!''}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>权限类型</label>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <select name="type" class="form-control">
                                            <option value="0" <#if (((entity.type)!0) == 0)>selected</#if>>一级菜单</option>
                                            <option value="1" <#if (((entity.type)!0) == 1)>selected</#if>>二级菜单</option>
                                            <option value="2" <#if (((entity.type)!0) == 2)>selected</#if>>页面按钮</option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>排序号</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <input type="text"  name="sort" class="form-control" id="sort" placeholder="请输入值" value="${(entity.sort)!}">
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
            'name': "required",
            'value': "required",
            'parentId': "required",
            'type': "required",
            'sort': "required"
        },
        messages: {
            'name': "请输入权限名",
            'value': "请输入权限值",
            'parentId': "请输入父级权限id",
            'type': "请选择菜单类型",
            'sort': "请输入排序号"
        }
    });

</script>
</html>