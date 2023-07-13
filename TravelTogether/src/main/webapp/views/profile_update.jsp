<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}../resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profileupdate.css?ver=22">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
* {
	padding: 0;
	margin: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
	outline: none; /*focus 했을때 테두리 나오게 */
}
html{
	height : 100%;
}
body{
	font-size:14px;
    line-height: 1.5em;
    color : #222;
    margin: 0;
    
}
.wrap{
	margin: auto;
	min-height:100%;
	position : relative;
	padding: 0 20px;
	margin-top: 50px;

}
.wrap .register{
	margin :5px 0;
}


#profileform{
	width: 600px;
    border: 1px solid #BDBDBD;
    margin: auto; /*중앙 정렬*/
    margin-bottom: 20px;
    padding: 10px;
  
    
}
.register input[type="password"] {
  width: 100%; /* 너비를 100%로 설정하여 가운데 정렬됨 */
  height: 40px;
}

.register input{
	border: 1px solid #ccc;
	border-radius: 3px;
}

.register input:focus {
  border-color: #0AC5A8; 
}

.wrap input:focus,
.wrap select:focus {
    border-color: #0AC5A8 !important;
    outline: none;
    border : 1px solid;  
}

.wrap input[type=button],
.wrap input[type=submit]{
	background-color: #0AC5A8;
	color:#fff;
	
}

</style>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
$(document).ready(function() {
	$('#m_intro').on('keyup', function() {
		if ($(this).val().length > 100) {
			$(this).val($(this).val().substring(0, 100));
		}
	});
	$("#m_pw2").on("input", function() {

		if ($("#m_pw").val() != $("#m_pw2").val()) {
			$("#pwchkmsg").css("display", "none");
			$("#pwchkmsg1").css("display", "inline-block");
			$("#pwchkmsg2").css("display", "none");
		} else {
			$("#pwchkmsg").css("display", "none");
			$("#pwchkmsg1").css("display", "none");
			$("#pwchkmsg2").css("display", "inline-block");
		}

	});
});
</script>

</head>
<body>
	<div class="wrap" align="center">
	 <!-- 1. 로고 넣을자리 -->
        <img class="logo" src="#">
        
		<h2 align="center" style="font-size:30px">회&nbsp;원&nbsp;정&nbsp;보</h2>
		<div id="profileform">
				<form action="ProfileUpdate.do" method="post" name="form1" enctype="multipart/form-data" onsubmit="return check()">
					<fieldset style="border: 0; border-bottom: 1px solid gray;">
						
						<table id="profiletable">
							<tbody>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">이메일</td>
									<td><input type="email" id="m_email" name="m_email" readonly value="test@test.com" required style="border:none;">   <%-- ${member.m_email} --%>
										
										<!-- <input type="button" class="btn btn-default" value="중복체크" onclick="emailDupCheck()" readonly style="display:none;"> -->
										<!--  <input type="button" class="btn btn-default" id="emailDupCheckBtn" value="중복체크" onclick="checkEmailDuplication()">   중복체크 기능 버튼 -->
										</td>  <!-- 버튼 체크를 위해 임시로 사용 -->
								
								</tr>
																							
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">비밀번호</td>
									<td><input style="width:255px; height:40px;" type="password" name="m_pw" id="m_pw" value="${member.m_pw}" placeholder=" 8~12자, 영문+숫자+특수문자 " required >&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">비밀번호 확인</td>
									<td><input style="width:255px; height:40px;" type="password" name="m_pw2" id="m_pw2" placeholder=" 비밀번호를 입력해주세요" required>&nbsp;
									<b id="pwchkmsg1" style="display: none;">* 비밀번호를 확인해주세요.</b>
									<b id="pwchkmsg2" style="display: none;">* 확인 되었습니다.</b></td>
								</tr>
								
								<!-- 휴대전화 수정 -->
								<%-- <tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">휴대전화</td>
									<td><input type="text" id="m_phone" name="m_phone"
										value="${member.m_phone}" required></td>
								</tr> --%>
								
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">이 름</td>
									<td><input type="text" id="m_name" name="m_name" readonly required value="이름값" style="border:none;"></td>
									<td></td>
								</tr>
								
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">생년월일</td>
									<td><input style="width:255px; height:40px;" type="date" id="m_birth" name="m_birth"
										 value="${member.m_birth}" required></td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
							
							
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">성별</td>
									<td>
									<select style="width:255px; height:40px;">
						      			<option value="">성별</option>
						     			<option value="남">남</option>
						       			<option value="여">여</option>
						   			 </select>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
																	
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="30%">닉네임</td>
									<td><input type="text" id="m_nick" name="m_nick" readonly value="닉네임~" required style="border:none;">
									<input type="button" class="btn btn-default" value="중복확인" onclick="enableNicknameEdit()"></td>
									
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<div id="formbtn">
						<br>
						<input type="submit" id="btnSubmit" class="btn btn-default" value="수정완료"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="btnback" class="btn btn-default"  onclick="location.href='MyPage.do'">취소</button>
					</div>
				</form>
			</div>
		
		
		
	</div>
	
	
	
	<script>
	/* $(function(){
		if("${member.m_gender}"=='M'){
			$('#man').prop("checked", true);
		}else if("${member.m_gender}"=='F'){
			$('#woman').prop("checked", true);
		}
	}) */
	
	function emailDupCheck(){
		$.ajax({
			url:"${pageContext.request.contextPath}/EmailCheck.do",
			type:"post",
			data:{
				"m_email" : "${member.m_email}"
			},
			async:false,
			dataType:"json",
			success:function(data){
				if(data.bool==true){
					alert("사용 가능한 이메일 입니다.");
				}else if(data.bool==false){
					alert("사용 불가능한 이메일 입니다. 다른 이메일을 입력하세요.");
				}
			},
			error:function(){
				alert("중복 체크 중 오류가 발생했습니다.")
			}
		})
	}
	</script>
<script>

function passwordSameCheck() {
	var pwd1 = $("#m_pw").val().trim();

	var pwd2 = $("#m_pw2").val().trim();
	if (pwd1 != pwd2) {
		$("#passwordSpan").text("비밀번호가 다릅니다.");
		$("#passwordSpan").css('display', 'inline-block');
		$("#passwordSpan").css('color', 'red');
	} else {
		$("#passwordSpan").text("비밀번호가 일치합니다.");
		$("#passwordSpan").css('display', 'inline-block');
		$("#passwordSpan").css('color', 'green');
	}
}
</script>
<script>
function check() {

	var pwd1 = $("#m_pw").val().trim();
	var reg1 = /^[A-Z][A-Za-z0-9_]{5,11}$/;
	var reg2 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}$/;
	/* ?= 있는지 .*길이에 상관없이 임의의 문자열 숫자 */

	if (pwd1 != "") {
		if (!reg1.test(pwd1)) {
			alert("조건에 맞게 입력해주세요. [비밀번호 첫글자는 대문자, 8글자이상, 12글자 이하, 숫자, 영문자까지 입력이 가능.]");
			$("#userpwd").val("");
			return false;
		} else if (!reg2.test(pwd1)) {
			alert("조건에 맞게 입력해주세요. [비밀번호는 대문자, 소문자, 숫자가 반드시 1개이상 입력되어야 한다.]");
			$("#userpwd").val("");
			return false;
		}
	}

	var pwd2 = $("#m_pw2").val().trim();
	if (pwd1 != pwd2) {
		alert('비밀번호가 일치하지 않습니다.');
		$("#m_pw2").val("");
		$("#m_pw2").focus();
		return false;
	}

/* 	var a = $("#m_phone").val().trim();
	var regVal = /[0][0-9]{1,2}-[0-9]{3,4}-[0-9]{4,4}/;
	if (!regVal.test(a)) {
		alert("전화번호 형식에 맞춰 작성해 주세요.(010-0000-0000)");
		$("#m_phone").val('').focus();

		return false;
	} */

	var rcheck = $("input[name='m_gender']").length;

	if (rcheck == 0) {

		alert("성별을 선택하세요");

		return false;

	}
	return true;
}
</script>
</body>
</html>