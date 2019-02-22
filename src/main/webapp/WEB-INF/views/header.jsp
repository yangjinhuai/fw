<%--
  Created by IntelliJ IDEA.
  User: HO1050
  Date: 2019/2/15
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h2 class="fl">FIREWALL</h2>
            <h4 class="fr" id="config">配置</h4>
        </div>
    </div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="javacript:void(0);" onclick ="showChain(0)">入站规则</a></li>
                    <li><a href="javacript:void(0);" onclick ="showChain(1)">出站规则</a></li>
                    <li><a href="javacript:void(0);" onclick ="showChain(2)">转发规则</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<script type="text/javascript">

    /*要显示的链*/
    function showChain(value){
        switch (value) {
            case 0:to_page(0);break;
            case 1:to_page(1);break;
            case 2:to_page(2);break;
        }
    }

    /*导航栏样式切换*/
    $(".nav li").click(function () {
        var lis=$(this).parent().find('li');
        var n=0;
        for(var i=0;i<lis.length;i++){
            $(lis[i]).removeClass('active');
        }
        $(this).addClass('active');

        /*保存当前选中导航*/
        if($(this).find('a').text()=='入站规则'){
            $.session.set('currentNav','0');
        }
        else if($(this).find('a').text()=='出站规则'){
            $.session.set('currentNav','1');
        }
        else if($(this).find('a').text()=='转发规则'){
            $.session.set('currentNav','2');
        }
        //console.log($.session.get('currentNav'));
        $("#rules_table tbody").empty();
    })


</script>