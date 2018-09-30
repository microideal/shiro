<html>
<head>
    <title>管理系统 - 登陆</title>
    <#include "./common/resource.ftl">
</head>
<body class="hold-transition login-page wc-bg">
<div class="login">
    <div class="login-box">
        <div class="login-logo" style="color: #FFFFFF;">
            <b></b>管理系统
        </div><!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form action="${request.contextPath}/backend/admin/loginAction" method="post">
                <div class="form-group has-feedback">
                    <input type="text" name="username" class="form-control" placeholder="Uesrname">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" name="password" class="form-control" placeholder="Password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    ${error!''}
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
            </form>
        </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
</div><!-- /.login -->
<!-- jQuery 2.1.4 -->
<script src="${request.contextPath}/static/AdminLTE-2.3.0/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="${request.contextPath}/static/AdminLTE-2.3.0/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
