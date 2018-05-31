<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>       
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>



<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="${ctx }/css/zui.min.css">

<!-- ZUI Javascript 依赖 jQuery -->
<script src="${ctx }/js/jquery.zui.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="${ctx }/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/css/bgstyle.css" />
<script type="text/javascript" src="${ctx }/js/menu.js"></script>




<link href="${ctx }/zuilib/datetimepicker/datetimepicker.min.css" rel="stylesheet">
<script src="${ctx }/zuilib/datetimepicker/datetimepicker.min.js"></script>

<script type="text/javascript">
	function searchStore(){
		var account=document.getElementById("inputSearchExample3").value;
		var xmlhttp;
		 if(window.XMLHttpRequest) {
			 xmlhttp = new XMLHttpRequest();
		 }else {
			 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
		 }
		 xmlhttp.onreadystatechange = function() {
			 if(xmlhttp.readyState==4&&xmlhttp.status==200) {
 				var obj = xmlhttp.responseText;
 				var bus =eval('(' + obj + ')');//由JSON字符串转换为JSON对象

 				$('#busName').val(bus.busName);
				$('#busId').val(bus.busId);
				$('#busContact').val(bus.busContact);
				$('#busTel').val(bus.busTel);
				$('#busLicense').val(bus.busLicense);
				$('#busAddress').val(bus.busAddress);
				$('#busCorporate').val(bus.busCorporate);
				$('#state').val(bus.state);
				$('#busAccount').val(bus.busAccount);
				$('#busEmail').val(bus.busEmail);
				
				
				document.getElementById("alertEmail").innerHTML="<font color='red'></font>";
				document.getElementById("alertTel").innerHTML="<font color='red'></font>";
				document.getElementById("alertId").innerHTML="<font color='red'></font>";
				document.getElementById("alertName").innerHTML="<font color='red'></font>";
		 	}
		 }
		 xmlhttp.open("GET","${ctx }/bg_store/bgSearchBus?account="+account,true);
		 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		 xmlhttp.send();
	}
	
	function checkEmail(){
		var str=document.getElementById("busEmail").value;
		var reg=new RegExp(/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
		if(reg.test(str)){
			document.getElementById("alertEmail").innerHTML="<font color='red'></font>";
		}else{
			document.getElementById("alertEmail").innerHTML="<font color='red'>邮箱格式不符</font>";
		}
	}
	function checkTel(){
		var tel = document.getElementById("busTel").value;  
		var reg=/^[1][3,4,5,6,7,8,9][0-9]{9}$/;
		if(reg.test(tel)){
			document.getElementById("alertTel").innerHTML="<font color='red'></font>";
			
		}else{
			document.getElementById("alertTel").innerHTML="<font color='red'>电话格式不符</font>";
		}
	}
	function endsubmit(){
		var account=0;
		var str=document.getElementById("busEmail").value;
		var reg=new RegExp(/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
		var tel = document.getElementById("busTel").value;  
		var reg=/^[1][3,4,5,6,7,8,9][0-9]{9}$/;
		if((document.getElementById("busName").value)==""){
			document.getElementById("alertName").innerHTML="<font color='red'>姓名不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertName").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("busId").value)==""){
			document.getElementById("alertId").innerHTML="<font color='red'>ID不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertId").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("busTel").value)==""){
			document.getElementById("alertTel").innerHTML="<font color='red'>电话不能为空</font>";
			account=account+1;
		}else{
			if(reg.test(tel)){
				document.getElementById("alertTel").innerHTML="<font color='red'></font>";
				
			}else{
				document.getElementById("alertTel").innerHTML="<font color='red'>电话格式不符</font>";
				account=account+1;
			}
		if((document.getElementById("busEmail").value)==""){
			document.getElementById("alertEmail").innerHTML="<font color='red'>邮箱不能为空</font>";
			account=account+1;
		}else{
			if(reg.test(str)){
				document.getElementById("alertEmail").innerHTML="<font color='red'></font>";
			}else{
				document.getElementById("alertEmail").innerHTML="<font color='red'>邮箱格式不符</font>";
				account=account+1;
			}
		}
		
		if(account!=0){
			return false;
			
		}else{
			return true;
		}
	}	
</script>


<script type="text/javascript">
$(document).ready(function(){
  $(".form-date").datetimepicker(
{
    language:  "zh-CN",
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: 2,
    forceParse: 0,
    format: "yyyy-mm-dd"
});
});

</script>

</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">课兜后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">Tony</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><i class="icon icon-user">&nbsp;&nbsp;</i>用户管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoAddAdmin'>添加管理员</a>
            <a href='${ctx}/bg_common/bggoEditUser'>修改用户信息</a>
            <a href='${ctx}/bg_common/bggoSearchUser'>查看用户列表</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><i class="icon icon-shopping-cart">&nbsp;&nbsp;</i>机构管理</h4>
          <div class="list-item none">
            <a href="${ctx}/bg_common/bggoEditStore">修改机构</a>
            <a href="${ctx}/bg_common/bggoSearchStore">查看机构列表</a>         
           </div>
        </li>
        <li>
          <h4 class="M3"><i class="icon icon-time">&nbsp;&nbsp;</i>预约管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoSearchReservation'>预约检索</a>
          </div>
        </li>
        <li>
          <h4 class="M5"><i class="icon icon-book">&nbsp;&nbsp;</i>课程管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoSearchCourse'>查看课程列表</a>
          </div>
        </li>
    <!-- 
        <li>
          <h4  class="M6"><i class="icon icon-newspaper-o">&nbsp;&nbsp;</i>公告管理</h4>
          <div class="list-item none">
            <a href='${ctx}/bg_common/bggoAddBulltein'>添加公告</a>
            <a href='bg_searchBulletin.html'>公告操作</a>
            <a href='bg_editBulletin.html'>修改公告</a>
          </div>
        </li>     
         -->  				
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="bg_index.html">首页</a></li>
								<li>></li>
								<li><a href="#">修改课程</a></li>
						</ul>
			</div>
			<div class="main">
				  
              <div class="input-group">
            <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
              <input id="inputSearchExample3" onblur="searchStore()" type="search" class="form-control search-input" placeholder="搜索">
                <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
            </div>
            <span class="input-group-btn">
              <button class="btn btn-primary" type="button">搜索</button>
            </span>
          </div>
          
			<form action="${ctx}/bg_store/bgEditStore" method="post" onsubmit="return endsubmit()">
          <table class="table table-hover">
        <thead>
           <tr>
             <th></th>
             <th></th>
           </tr>
        </thead>
        <tbody>
          <tr>
            <td>商家ID</td>
            <td>
              <input type="text" name="busId" id="busId" class="form-control" placeholder="商家ID">
              <span id="alertId"></span>
             </td>
          </tr>
          <tr>
            <td>商家名称</td>
            <td>
              <input type="text" name="busName" id="busName" class="form-control" placeholder="商家名称">
              <span id="alertName"></span>
             </td>
          </tr>
          <tr>
            <td>联系人</td>
            <td>
              <input type="text" name="busContact" id="busContact" class="form-control" placeholder="联系人">
              <span id="alertContact"></span>
             </td>
          </tr>
          <tr>
            <td>电话</td>
            <td>
              <input type="text" onblur="checkTel()" name="busTel" id="busTel" class="form-control" placeholder="电话">
              <span id="alertTel"></span>
             </td>
          </tr>
          <tr>
            <td>营业执照号</td>
            <td>
              <input type="text" name="busLicense" id="busLicense" class="form-control" placeholder="营业执照号">
              <span id="alertLicense"></span>
             </td>
          </tr>
          <tr>
            <td>公司地址</td>
            <td>
              <textarea name="busAddress" id="busAddress" class="form-control" name="busAddress" rows="3" placeholder="公司地址"></textarea>
              <span id="alertAddress"></span>
          </tr>
          <tr>
            <td>公司法人</td>
            <td>
              <input type="text" name="busCorporate" id="busCorporate" class="form-control" placeholder="公司法人">
              <span id="alertCorporate"></span>
             </td>
          </tr>
          <tr>
            <td>商家状态</td>
            <td>
              <input type="text" name="state" id="state" class="form-control" placeholder="商家状态">
              <span id="alertState"></span>
             </td>
          </tr>
          <tr>
            <td>商家账号</td>
            <td>
              <input type="text" name="busAccount" id="busAccount" class="form-control" placeholder="商家账号">
              <span id="alertAccount"></span>
             </td>
          </tr>
          <tr>
            <td>邮箱</td>
            <td>
              <input type="text" onblur="checkEmail()" name="busEmail" id="busEmail" class="form-control" placeholder="邮箱">
              <span id="alertEmail"></span>
             </td>
          </tr>
      </tbody>
      <tfoot>
        <tr  style="text-align:right">
          <td></td>
           <td>
              <input class="btn btn-primary btn6 mr10" value="修改" type="submit">
              <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
           </td>
        </tr>
        <tr>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
        </tr>
      </tfoot>
    </table>
</form>



			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©</p></div>
<script>navList(12);</script>
</body>
</html>