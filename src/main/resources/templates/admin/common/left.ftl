<#macro leftMenu pageName>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height: auto;">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <#list userLeftMenu as menu>
            <li class="treeview <#if pageName=='${menu.value}'>active</#if>">
                <a href="#">
                    <i class="fa fa-support"></i> <span>${menu.name}</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <#list menu.authorityList as authority>
                    <li class="active"><a href="${authority.value}"><i class="fa fa-bookmark-o"></i>${authority.name}</a></li>
                    </#list>
                    <#--<li class="active"><a href="/backend/activity/list"><i class="fa fa-bookmark-o"></i>活动管理</a></li>
                    <li class="active"><a href="/backend/messageRecord/list"><i class="fa fa-bookmark-o"></i>推送管理</a></li>-->
                </ul>
            </li>
            </#list>
            <#--<li class="treeview <#if pageName=='operation'>active</#if>">
                <a href="#">
                    <i class="fa fa-support"></i> <span>运营管理</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    &lt;#&ndash;<#if CURRENT_ADMIN.roleId == 1>&ndash;&gt;
                        <li class="active"><a href="/backend/customer/list"><i class="fa fa-users"></i>客户管理</a></li>
                    &lt;#&ndash;</#if>&ndash;&gt;
                    <li class="active"><a href="/backend/loan/list"><i class="fa fa-tag"></i>贷款产品管理</a></li>
                    <li class="active"><a href="/backend/creditCard/list"><i class="fa fa-tag"></i>信用卡产品管理</a></li>
                    <!--
                    <li class="active"><a href="/backend/news/list"><i class="fa fa-tag"></i>新闻管理</a></li>
                    &ndash;&gt;
                </ul>
            </li>
            <li class="treeview <#if pageName=='data'>active</#if>">
                <a href="#">
                    <i class="fa fa-cloud"></i> <span>数据分析</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/backend/loan/statistics"><i class="fa fa-tag"></i>贷款数据统计</a></li>
                    <li class="active"><a href="/backend/creditCard/statistics"><i class="fa fa-tag"></i>信用卡数据统计</a></li>
                    <li class="active"><a href="/backend/feedback/list"><i class="fa fa-users"></i>用户反馈</a></li>
                </ul>
            </li>
            <li class="treeview <#if pageName=='system'>active</#if>">
                <a href="#">
                    <i class="fa fa-cloud"></i> <span>系统设置</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/backend/dictionary/loan/category/list"><i class="fa fa-tag"></i>贷款分类管理</a></li>
                    <li class="active"><a href="/backend/dictionary/creditCard/category/list"><i class="fa fa-tag"></i>信用卡分类管理</a></li>
                    <!--
                    <li class="active"><a href="/backend/dictionary/news/category/list"><i class="fa fa-tag"></i>新闻分类管理</a></li>
                    &ndash;&gt;
                    <li class="active"><a href="/backend/dictionary/tag/list"><i class="fa fa-tag"></i>标签管理</a></li>
                    <li class="active"><a href="/backend/dictionary/own/list"><i class="fa fa-tag"></i>适应人群管理</a></li>

                    &lt;#&ndash;<#if CURRENT_ADMIN.roleId == 1>&ndash;&gt;
                    <li class="active"><a href="/backend/supplier/list"><i class="fa fa-truck"></i>供应商管理</a></li>
                    <li class="active"><a href="/backend/dictionary/channel/list"><i class="fa fa-truck"></i>投放渠道号管理</a></li>
                    <li class="active"><a href="/backend/systemConfig/view"><i class="fa fa-truck"></i>系统配置</a></li>
                    <li class="active"><a href="/backend/admin/list"><i class="fa fa-truck"></i>账号管理</a></li>
                    &lt;#&ndash;</#if>&ndash;&gt;
                </ul>
            </li>-->

            <#--<@shiro.hasPermission name="authority">-->
            <#--<li class="treeview <#if pageName=='authority'>active</#if>">
                <a href="#">
                    <i class="fa fa-cloud"></i> <span>权限管理</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/backend/admin/list"><i class="fa fa-tag"></i>用户管理</a></li>
                    <li class="active"><a href="/backend/role/list"><i class="fa fa-tag"></i>角色管理</a></li>
                    <li class="active"><a href="/backend/authority/list"><i class="fa fa-tag"></i>权限管理</a></li>

                </ul>
            </li>-->
            <#--</@shiro.hasPermission>-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
</#macro>