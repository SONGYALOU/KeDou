<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<link rel="stylesheet" href="${ctx }/css/zui.min.css">
<script src="${ctx }/js/jquery.zui.js"></script>
<script src="${ctx }/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/css/bgstyle.css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/js/menu.js"></script>
<script type="text/javascript">
	function searchUser(str){
		var account=document.getElementById("inputSearchExample3").value;
		var temp=document.getElementById("userName").value;
		var xmlhttp;
		 if(window.XMLHttpRequest) {
			 xmlhttp = new XMLHttpRequest();
		 }else {
			 xmlhttp = new ActiveXObjec("Microsoft.XMLHTTP");
		 }
		 xmlhttp.onreadystatechange = function() {
			 if(xmlhttp.readyState==4&&xmlhttp.status==200) {
 				var obj = xmlhttp.responseText;
 				var user =eval('(' + obj + ')');//由JSON字符串转换为JSON对象
 				

 				$('#userName').val(user.userName);
 				$('#userId').val(user.userId);
 				$('#userEmail').val(user.userEmail);
 				$('#userPwd').val(user.userPwd);
 				$('#userTel').val(user.userTel);
 				$('#userAdd').val(user.address);
 				$('#userIdNum').val(user.userIdNum);
 				
		 	}
		 }
		 xmlhttp.open("GET","${ctx }/bg_admin/bgSearchUser?account="+account,true);
		 xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		 xmlhttp.send();
	}
	function checkEmail(){
		var str=document.getElementById("userEmail").value;
		var reg=new RegExp(/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
		if(reg.test(str)){
			document.getElementById("alertEmail").innerHTML="<font color='red'></font>";
		}else{
			document.getElementById("alertEmail").innerHTML="<font color='red'>邮箱格式不符</font>";
		}
	}
	
	function checkTel(){
		var tel = document.getElementById("userTel").value;  
		var reg=/^[1][3,4,5,6,7,8,9][0-9]{9}$/;
		if(reg.test(tel)){
			document.getElementById("alertTel").innerHTML="<font color='red'></font>";
			
		}else{
			document.getElementById("alertTel").innerHTML="<font color='red'>电话格式不符</font>";
		}
	}
	
	function checkIdNum(){
		var Id = document.getElementById("userIdNum").value;  
		// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
		if(!reg.test(Id)){
			document.getElementById("alertNum").innerHTML="<font color='red'>身份证格式不符</font>";
		}else{
			document.getElementById("alertNum").innerHTML="<font color='red'></font>";
		}
	}
	
	function endsubmit(){
		var account=0;
		if((document.getElementById("userName").value)==""){
			document.getElementById("alertName").innerHTML="<font color='red'>姓名不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertName").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("userId").value)==""){
			document.getElementById("alertId").innerHTML="<font color='red'>ID不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertId").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("userTel").value)==""){
			document.getElementById("alertTel").innerHTML="<font color='red'>电话不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertTel").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("userEmail").value)==""){
			document.getElementById("alertEmail").innerHTML="<font color='red'>邮箱不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertEmail").innerHTML="<font color='red'></font>";
		}
		if((document.getElementById("userIdNum").value)==""){
			document.getElementById("alertNum").innerHTML="<font color='red'>身份证号不能为空</font>";
			account=account+1;
		}else{
			document.getElementById("alertNum").innerHTML="<font color='red'></font>";
		}
		
		if(account!=0){
			return false;
			
		}else{
			return true;
		}
	}	
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
								<li><a href="#">修改用户详情</a></li>
						</ul>
			</div>
			<div class="main">
        	<form action="${ctx}/bg_admin/searchUser" method="get" >
              <div class="input-group">
            <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
              <input id="inputSearchExample3" onkeyup="searchUser()" type="search" class="form-control search-input" placeholder="搜索">
                <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
            </div>
            <span class="input-group-btn">
              <button class="btn btn-primary" type="button" >搜索</button>
            </span>
            </form>
          </div>			  
			<form action="${ctx}/bg_admin/bgEditUser" method="post" onsubmit="return endsubmit()">
          <table class="table table-hover">
        <thead>
           <tr>
             <th></th>
             <th></th>
           </tr>
        </thead>
			
        <tbody>
          <tr>
            <td>用户名</td>
            <td>
              <input type="text" name="userName" id="userName" class="form-control"  placeholder="用户名">
              <span id="alertName"></span>
             </td>
          </tr>
          <tr>
            <td>用户ID</td>
            <td>
              <input type="text" name="userId" id="userId" class="form-control" placeholder="用户ID">
               <span id="alertId"></span>
             </td>
          </tr>
          <tr>
            <td>邮箱</td>
            <td>
              <input type="text" onblur="checkEmail()" name="userEmail" id="userEmail" class="form-control" placeholder="用户邮箱">
              <span id="alertEmail"></span>
             </td>
          </tr>
          <tr>
            <td>联系电话</td>
            <td>
              <input type="text" onblur="checkTel()" name="userTel" id="userTel" class="form-control" placeholder="联系电话">
              <span id="alertTel"></span>
             </td>
          </tr>
          <tr>
            <td>地址</td>
            <td>
              <input type="text" name="userAdd" id="userAdd" class="form-control" placeholder="地址">
             </td>
          </tr>
          <tr>
            <td>身份证号</td>
            <td>
              <input type="text" onblur="checkIdNum()" name="userIdNum" id="userIdNum" class="form-control" placeholder="身份证号">
              <span id="alertNum"></span>
             </td>
          </tr>
      </tbody>
		
      <tfoot>
        <tr  style="text-align:right">
          <td></td>
           <td>
              <input id="submit" class="btn btn-primary btn6 mr10" value="修改" type="submit">
              <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
           </td>
        </tr>
      </tfoot>
    </table>
    </form>




			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©</p></div>
</body>
</html>