<%--
  Created by IntelliJ IDEA.
  User: HO1050
  Date: 2019/2/15
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>fw</title>
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/style.css" rel="stylesheet">
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!--引入头部-->
<%@ include file ="header.jsp"%>

<!-- 搭建显示页面 -->
<div class="container">
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8" style="margin-bottom: 5px;">
            <button class="btn btn-primary margin-right-50" id="add_modal_btn">新增</button>
            <button class="btn btn-danger b" id="delete_all_btn">清空</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="rules_table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th style="display: none">规则链</th>
                    <th>源地址</th>
                    <th>目的地址</th>
                    <th>源端口</th>
                    <th>目的端口</th>
                    <th>协议</th>
                    <th>动作</th>
                    <th>网卡</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- 规则修改的模态框 -->
<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">规则修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group" style="display: none">
                        <label class="col-sm-2 control-label">id</label>
                        <div class="col-sm-8">
                            <input type="text" name="rid" class="form-control" id="rid">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">源地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="source" class="form-control" id="source">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">目的地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="dest" class="form-control" id="dest">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">源端口</label>
                        <div class="col-sm-8">
                            <input type="text" name="sport" class="form-control" id="sport">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">目的端口</label>
                        <div class="col-sm-8">
                            <input type="text" name="dport" class="form-control" id="dport">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">协议</label>
                        <div class="col-sm-8">
                            <input type="text" name="protocol" class="form-control" id="protocol">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">动作</label>
                        <div class="col-sm-8">
                            <input type="text" name="action" class="form-control" id="action">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">网卡</label>
                        <div class="col-sm-8">
                            <input type="text" name="ifname" class="form-control" id="ifname">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<!-- 规则添加的模态框 -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">规则添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">源地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="addsource" value="0.0.0.0" class="form-control" id="addsource">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">目的地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="adddest" value="0.0.0.0" class="form-control" id="adddest">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">源端口</label>
                        <div class="col-sm-8">
                            <input type="text" name="addsport" value="0" class="form-control" id="addsport">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">目的端口</label>
                        <div class="col-sm-8">
                            <input type="text" name="adddport" value="0" class="form-control" id="adddport">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">协议</label>
                        <div class="col-sm-8">
                            <input type="text" name="addprotocol" class="form-control" id="addprotocol">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">动作</label>
                        <div class="col-sm-8">
                            <input type="text" name="addaction" value="" class="form-control" id="addaction">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0">
                        <label class="col-sm-2 control-label">网卡</label>
                        <div class="col-sm-8">
                            <input type="text" name="addifname" class="form-control" id="addifname">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<!-- 配置模态框 -->
<div class="modal fade" id="cfModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">配置</h4>
            </div>
            <div class="modal-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div id="configpath"></div>
                    </li>
                    <li class="list-group-item">
                        <div id="rulepath"></div>
                    </li>
                    <li class="list-group-item">
                        <div style="display: inline">
                            <span class="margin-R">默认动作:</span>
                            <label class="el-switch el-switch-sm">
                                <input type="checkbox" name="defaction" id="defaction">
                                <span class="el-switch-style" id="defaction_style"></span>
                            </label>
                            <span class="margin-R" id="defactionswitch"></span>
                        </div>

                    </li>
                    <li class="list-group-item">
                        <div style="display: inline">
                            <span class="margin-R">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;志:</span>
                            <label class="el-switch el-switch-sm">
                                <input type="checkbox" name="logpause" id="logpause">
                                <span class="el-switch-style" id="logpause_style"></span>
                            </label>
                            <span class="margin-R" id="logpauseswitch"></span>
                        </div>

                    </li>
                    <li class="list-group-item">
                        <span class="margin-R">防&nbsp;&nbsp;火&nbsp;&nbsp;墙:</span>
                        <label class="el-switch el-switch-sm">
                            <input type="checkbox" name="invalid" id="invalid">
                            <span class="el-switch-style" id="invalid_style"></span>
                        </label>
                        <span class="margin-R" id="invalidswitch"></span>
                    </li>
                </ul>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${APP_PATH }/static/js/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/jquerysession.js"></script>
<script type="text/javascript">
    to_page(0);
    $.session.set('currentNav','0');

    /*获取规则的方法*/
    function to_page(pn){
        //清空table表格
        $("#rules_table tbody").empty();
        $.ajax({
            url:'${APP_PATH}/Rule/getRules',
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //1、解析并显示规则数据
                if(result.code==200)
                build_table(result);
            }
        });
    }

    /*执行规则命令方法*/
    function executeRuleCommands(cmd) {
        $.ajax({
            url:'${APP_PATH}/Rule/executeRuleCommands',
            data:"cmd="+cmd,
            type:"POST",
            success:function(result){
                //console.log($.session.get('currentNav'));
                if(result.code==200) {

                    layer.alert("操作成功");
                    to_page($.session.get('currentNav'));
                }else
                    layer.alert("系统错误");
            }
        });
    }


    /*获取规则*/
    function  build_table(result) {

        //清空table表格
        $("#rules_table tbody").empty();
        var rules = result.extend.rules;
        var i = 1;
        $.each(rules, function (index, item) {

            var idTd = $("<td></td>").append(i++);
            var chainTd = $("<td style='display: none'></td>").append(item.chain);
            var sourceTd = $("<td></td>").append(item.source);
            var destTd = $("<td></td>").append(item.dest);
            var sportTd = $("<td></td>").append(item.sport);
            var dportTd = $("<td></td>").append(item.dport);
            var protocolTd = $("<td></td>").append(item.protocol);
            var actionTd = $("<td></td>").append(item.action);
            var ifnameTd = $("<td></td>").append(item.ifname);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

            var btnTd = $("<td></td>").append(editBtn).append("  ").append(delBtn);


            $("<tr></tr>")
                .append(idTd)
                .append(chainTd)
                .append(sourceTd)
                .append(destTd)
                .append(sportTd)
                .append(dportTd)
                .append(protocolTd)
                .append(actionTd)
                .append(ifnameTd)
                .append(btnTd)

                .appendTo("#rules_table tbody");
        });

    }

    /*处理规则的方法*/
    function dealConfig(value) {
        var config=value.extend.config;
        //console.log(config);
        $("#configpath").text("日志路径:"+config.logfile);
        $("#rulepath").text("规则路径:"+config.rulesFile);
        if(config.logpause==0){
            $("#logpauseswitch").text("已开启");
            $("#logpause").attr("checked","checked");
        }
        else
        {
            $("#logpauseswitch").text("已关闭");
            $("#logpause").attr("checked",false);
        }
        if(config.invalid==0){
            $("#invalidswitch").text("已开启");
            $("#invalid").attr("checked","checked");
        }
        else
        {
            $("#invalidswitch").text("已关闭");
            $("#invalid").attr("checked",false);
        }
        if(config.defaultAction=="DROP"){
            $("#defactionswitch").text("DROP");
            $("#defaction").attr("checked","checked");
        }
        else {
            $("#defactionswitch").text("ACCEPT");
            $("#defaction").attr("checked",false);
        }

    }
    /*获取配置方法*/
    function getConfig() {
        $.ajax({
            url:'${APP_PATH}/Config/getConfig',
            type:"get",
            success:function(result){
               // console.log(result);
                if(result.code==200) {
                    dealConfig(result);

                }else
                    layer.alert("系统错误");
            }
        });
    }


    /*点击配置*/
    $("#config").click(function () {

        $("#cfModal").modal({
            backdrop:"static"
        });
        getConfig();
    })

    /*点击默认动作开关*/
    $("#invalid_style").click(function () {
        //console.log(111111);
        var pn;
        if($("#invalid_style").text()=='DROP')
            pn=1;
        else
            pn=0;
        $.ajax({
            url:'${APP_PATH}/Config/defaultActionSwitch',
            type:"get",
            data:"pn="+pn,
            success:function(result){
                // console.log(result);
                if(result.code==200) {
                    getConfig();

                }else
                    layer.alert("系统错误");
            }
        });
    })
    /*点击日志开关*/
    $("#logpause_style").click(function () {
       //console.log(111111);
        var pn;
        if($("#invalidswitch").text()=='已开启')
            pn=1;
        else
            pn=0;
        $.ajax({
            url:'${APP_PATH}/Config/logPauseSwitch',
            type:"get",
            data:"pn="+pn,
            success:function(result){
                // console.log(result);
                if(result.code==200) {
                    getConfig();

                }else
                    layer.alert("系统错误");
            }
        });
    })

    /*点击防火墙开关*/
    $("#invalid_style").click(function () {
        //console.log(111111);
        var pn;
        if($("#invalidswitch").text()=='已开启')
            pn=1;
        else
            pn=0;
        $.ajax({
            url:'${APP_PATH}/Config/invalidSwitch',
            type:"get",
            data:"pn="+pn,
            success:function(result){
                // console.log(result);
                if(result.code==200) {
                    getConfig();

                }else
                    layer.alert("系统错误");
            }
        });
    })


        //更新校验表单数据
    function update_validate_form(){

            var source=$('#source').val();
            if(isValidIP(source)==false){
                show_validate_msg('#source', "error", "ip地址不合法");
                return false;
            }
            else
                show_validate_msg('#source', "success", "");

            var dest=$('#dest').val();
            if(isValidIP(dest)==false){
                show_validate_msg('#dest', "error", "ip地址不合法");
                return false;
            }
            else
                show_validate_msg('#dest', "success", "");

            var sport=$('#sport').val();
            if(isPort( sport)==false){
                show_validate_msg('#sport', "error", "端口号不合法");
                return false;
            }
            else
                show_validate_msg('#sport', "success", "");


            var dport=$('#dport').val();
            if(isPort(dport)==false){
                show_validate_msg('#dport', "error", "端口号不合法");
                return false;
            }
            else
                show_validate_msg('#dport', "success", "");

            var protocol=$('#protocol').val();
            if(isProtocol(protocol)==false){
                show_validate_msg('#protocol', "error", "协议不合法");
                return false;
            }
            else
                show_validate_msg('#protocol', "success", "");

            var action=$('#action').val();
            if(isAction(action)==false){
                show_validate_msg('#action', "error", "动作不合法");
                return false;
            }
            else
                show_validate_msg('#action', "success", "");

            return true;
    }

        //添加校验表单数据
    function add_validate_form(){

            var source=$('#addsource').val();
            if(isValidIP(source)==false){
                show_validate_msg('#addsource', "error", "ip地址不合法");
                return false;
            }
            else
                show_validate_msg('#addsource', "success", "");

            var dest=$('#adddest').val();
            if(isValidIP(dest)==false){
                show_validate_msg('#adddest', "error", "ip地址不合法");
                return false;
            }
            else
                show_validate_msg('#adddest', "success", "");

            var sport=$('#addsport').val();
            if(isPort( sport)==false){
                show_validate_msg('#addsport', "error", "端口号不合法");
                return false;
            }
            else
                show_validate_msg('#addsport', "success", "");


            var dport=$('#adddport').val();
            if(isPort(dport)==false){
                show_validate_msg('#adddport', "error", "端口号不合法");
                return false;
            }
            else
                show_validate_msg('#adddport', "success", "");

            var protocol=$('#addprotocol').val();
            if(isProtocol(protocol)==false){
                show_validate_msg('#addprotocol', "error", "协议不合法");
                return false;
            }
            else
                show_validate_msg('#addprotocol', "success", "");

            var action=$('#addaction').val();
            if(isAction(action)==false){
                show_validate_msg('#addaction', "error", "动作不合法");
                return false;
            }
            else
                show_validate_msg('#addaction', "success", "");

            var ifname=$('#addifname').val();
            if(isIfname(ifname)==false){
                show_validate_msg('#addifname', "error", "网卡不存在");
                return false;
            }
            else
                show_validate_msg('#addifname', "success", "");


            return true;
    }

        /*ip地址校验*/
    function isValidIP(ip) {
            if (ip != '') {
                var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
                return reg.test(ip);
            }else
                return true;
    }

        /*端口号校验*/
    function isPort(str) {
            if(str!=''){
                var parten=/^(\d)+$/g;
                if(parten.test(str)&&parseInt(str)<=65535&&parseInt(str)>=0){
                    return true;
                }else{
                    return false;
                }
            }
            else
                return true;
    }

        /*协议校验*/
    function isProtocol(str)
    {
            if(str!=''){
                if(str=='tcp'||str=='udp'||str=='icmp'||str=='igmp'){
                    return true;
                }else{
                    return false;
                }
            }
            else
                return true;

    }
        /*动作校验*/
    function isAction(str)
    {
            if(str=='ACCEPT'||str=='DROP'||str==''){
                return true;
            }else{
                return false;
            }
    }

        /*网卡校验*/
    function isIfname(str)
    {
            var flag=true;
            if(str!=''){
                var cmd='../user/fw -W'+str;
                $.ajax({
                    url:'${APP_PATH}/Rule/executeRuleCommands',
                    data:"cmd="+cmd,
                    type:"POST",
                    async:false,
                    success:function(result){
                        //console.log(result);
                        if(result.code==200) {
                            flag=true;
                        }else
                            flag=false;
                    }
                });
                return flag;
            }
            else
                return flag;
    }

        //显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
    }

        /*点击编辑*/
    $(document).on('click','.edit_btn',function(){
            var tds=$(this).parent().parent().find('td');

            $("#UpdateModal").modal({
                backdrop:"static"
            });
            $('#rid').val($(tds[0]).text());
            $('#source').val($(tds[2]).text());
            $('#dest').val($(tds[3]).text());
            $('#sport').val($(tds[4]).text());
            $('#dport').val($(tds[5]).text());
            $('#protocol').val($(tds[6]).text()=='-'?'':$(tds[6]).text());
            $('#action').val($(tds[7]).text());
            $('#ifname').val(($(tds[8]).text())=='-'?'':$(tds[7]).text());

            //console.log(cmd);

    });

        /*点击编辑的更新*/
    $(document).on('click','#update_btn',function(){

            /*表单校验*/
            if(update_validate_form()==false)
                return;

            var id=$('#rid').val();
            var chain='';
            var c=$.session.get('currentNav');
            switch (c) {
                case '0':chain='INPUT';break;
                case '1':chain='OUTPUT';break;
                case '2':chain='FORWARD';break;
            }
            var source=$('#source').val();
            var dest=$('#dest').val();
            var sport=$('#sport').val();
            var dport=$('#dport').val();
            var protocol=$('#protocol').val();
            var action=$('#action').val();
            var ifname=$("#ifname").val();

            var cmd='../user/fw -R';

            cmd=cmd+' '+chain;
            if(source!='')
                cmd=cmd+' -s '+source;
            if(dest!='')
                cmd=cmd+' -d '+dest;
            if(sport!='')
                cmd=cmd+' --sport '+sport;
            if(dport!='')
                cmd=cmd+' --dport '+dport;
            if(protocol!='')
                cmd=cmd+' -p '+protocol;

            cmd=cmd+' -j '+action;

            if(ifname!='')
                cmd=cmd+' -i '+ifname;
            cmd=cmd+' -u '+id;
            executeRuleCommands(cmd);
            console.log(cmd);
            $("#UpdateModal").modal('hide');

    });


    /*点击新增*/
    $(document).on('click','#add_modal_btn',function(){

        $("#AddModal").modal({
            backdrop:"static"
        });


    });

    /*点击新增的保存*/
    $(document).on('click','#save_btn',function(){

        /*表单校验*/
        if(add_validate_form()==false)
            return;

        var chain='';
        var c=$.session.get('currentNav');
        switch (c) {
            case '0':chain='INPUT';break;
            case '1':chain='OUTPUT';break;
            case '2':chain='FORWARD';break;
        }
        var source=$('#addsource').val();
        var dest=$('#adddest').val();
        var sport=$('#addsport').val();
        var dport=$('#adddport').val();
        var protocol=$('#addprotocol').val();
        var action=$('#addaction').val();
        var ifname=$('#addifname').val();

        var cmd='../user/fw -A';

        cmd=cmd+' '+chain;
        if(source!='')
            cmd=cmd+' -s '+source;
        if(dest!='')
            cmd=cmd+' -d '+dest;
        if(sport!='')
            cmd=cmd+' --sport '+sport;
        if(dport!='')
            cmd=cmd+' --dport '+dport;
        if(protocol!='')
            cmd=cmd+' -p '+protocol;

        if (action!='')
            cmd=cmd+' -j '+action;

        if(ifname!='')
            cmd=cmd+' -i '+ifname;
        console.log(cmd);
        executeRuleCommands(cmd);
        //1、关闭模态框#UpdateModal
        $("#AddModal").modal('hide');

    });

    /*点击删除所有规则*/
    $('#delete_all_btn').click(function(){

        var tds=$('#rules_table tbody>tr:first-child>td');
        var chain=$(tds[1]).text();
        if(chain=='')
            return;
        layer.confirm("是否清空?",{icon:3},function(index){
            executeRuleCommands('../user/fw -F '+chain);

        });

    });

    /*点击删除某个规则*/
    $(document).on('click','.delete_btn',function(){
        var tds=$(this).parent().parent().find('td');
        var cmd='../user/fw -D';

        cmd=cmd+' '+$(tds[1]).text();
        cmd=cmd+' -u '+$(tds[0]).text();

        var tmp=$(tds[0]).text();
        layer.confirm("是否删除第 "+tmp+" 行规则?",{icon:3},function(index){
            executeRuleCommands(cmd);

        });
        console.log(cmd);

    });

</script>


</body>
</html>