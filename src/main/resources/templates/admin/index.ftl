<html>
<head>
    <title>管理系统</title>
    <link href="${request.contextPath}/static/common.css" rel="stylesheet" type="text/css"/>
    <#include "./common/resource.ftl">
</head>
<body class="sidebar-mini wysihtml5-supported skin-blue">
    <div class="wrapper">
        <#include "./common/top.ftl">
        <#include "./common/left.ftl">
        <@leftMenu pageName=""/>
        <div class="content-wrapper" style="min-height: 916px;">
            <section class="content-header">
                <h1>
                    <i class="fa  fa-search"></i>欢迎
                </h1>
            </section>
        </div>
        <#include "./common/footer.ftl">
    </div>
</body>
</html>

