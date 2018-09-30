/**
 * Created by wtf on 16/9/21.
 */
function ajaxDataTable(ele,option){

    return ele.DataTable({
        "scrollX": true,
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "bPaginate": true,
        "bServerSide" : true,
        "responsive": true,
        "bLengthChange": false, //改变每页显示数据数量
        "bProcessing": true,
        "sAjaxSource" : option.url,
        "columns": option.columns,
        "columnDefs": option.columnDefs,
        "fnServerParams": option.searchParams,
        "bJQueryUI" : true,
        pagingType: "full_numbers",
        bFilter: false,
        language: {
            sEmptyTable:     "<b>符合条件的数据为空</b>",
            sInfo:           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            sInfoEmpty:      "显示第 0 至 0 项结果，共 0 项",
            sInfoFiltered:   "(filtered from _MAX_ total entries)",
            sInfoThousands:  ",",
            sLengthMenu:     "显示 _MENU_ 项",
            sLoadingRecords: "数据加载中，请稍后...",
            sProcessing:     "加载中...",
            sSearch:         "搜索:",
            sZeroRecords:    "未找到匹配的元素",
            errMode:function( settings, tn, msg) {
                console.log(msg)
            },
            oPaginate: {
                sFirst:      "首页",
                sLast:       "尾页",
                sNext:       "下页",
                sPrevious:   "上页"
            },
            oAria: {
                sSortAscending:  ": 以升序排列此列",
                sSortDescending: ": 以降序排列此列"
            }
        }
    });
}

function ajaxDataTableNoPage(ele,option){

    return ele.DataTable({
        "scrollX": true,
        "paging": false,
        "lengthChange": false,
        "searching": false,
        "ordering": false,
        "info": true,
        "bPaginate": true,
        "bServerSide" : true,
        "responsive": true,
        "bLengthChange": false, //改变每页显示数据数量
        "bProcessing": true,
        "sAjaxSource" : option.url,
        "columns": option.columns,
        "columnDefs": option.columnDefs,
        "fnServerParams": option.searchParams,
        "bJQueryUI" : true,
        pagingType: "full_numbers",
        bFilter: false,
        language: {
            sEmptyTable:     "<b>符合条件的数据为空</b>",
            sInfo:           "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            sInfoEmpty:      "显示第 0 至 0 项结果，共 0 项",
            sInfoFiltered:   "(filtered from _MAX_ total entries)",
            sInfoThousands:  ",",
            sLengthMenu:     "显示 _MENU_ 项",
            sLoadingRecords: "数据加载中，请稍后...",
            sProcessing:     "加载中...",
            sSearch:         "搜索:",
            sZeroRecords:    "未找到匹配的元素",
            errMode:function( settings, tn, msg) {
                console.log(msg)
            }
        }
    });
}

(function($){
    var baseUrl = "/backend"
    $.extend({
        baseAjax: function (url, data, type, success, error){
            $.ajax({
                url: baseUrl+url,
                data:data,
                type: type,
                dataType:'json',
                success:function(res){
                    success(res);
                },
                error:function(res){
                    error(res)
                }
            });
        },
        lifestylePost: function(url, data, success){
            $.baseAjax(url, data, "POST", success, function(res){console.log(res)});
        },
        lifestyleGet: function(url, data, success){
            $.baseAjax(url, data, "GET", success, function(res){console.log(res)});
        }
    });
})($)

;(function($){
    $.extend({
        product: {
            classification: function(data, success) {
                $.lifestyleGet("/product/findByClassificationId", data, success);
            }
        }
    });
})($)