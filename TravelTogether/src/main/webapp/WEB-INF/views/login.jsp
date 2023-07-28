<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favi/favicon-16x16.png">
<meta charset="UTF-8">
<title>TT_로그인</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css?fe">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" 
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" 
		crossorigin="anonymous" 
		referrerpolicy="no-referrer">
</script>
<script type="text/javascript">
function checkPassword(){
    var password = $('#password').val(); 
    $.ajax({
        url:"<c:url value='/checkPassword'/>", 
        type:'post',
        data:{'member_password':password},
        success:function(cnt){ 
            if(cnt == 0){ 
                $('.user_id_already').css("display","inline-block");
                /* alert("아이디와 비밀번호를 확인해주세요"); */
                return false;

            } else { 
            	$('.user_id_already').css("display","none");
            	return false;
            }
        },
        error:function(){
            alert("에러입니다.");
        }
    });  
};  

function checkId(){
var id = $('#id').val();
$.ajax({
    url:"<c:url value='/checkId'/>", 
    type:'post',
    data:{'member_id':id},
    success:function(cnt){ 
        if(cnt == 0){ 
            $('.user_id_already').css("display","inline-block");
            /* alert("아이디와 비밀번호를 확인해주세요"); */
            return false;
        } else { 
        	$('.user_id_already').css("display","none");
        	return false;
        }
    },
    error:function(){
    	alert("에러입니다.");
    }
});    
}; 

function alertId(){
	var id = $('#id').val();
	$.ajax({
	    url:"<c:url value='/checkId'/>", 
	    type:'post',
	    data:{'member_id':id},
	    success:function(cnt){ 
	        if(cnt == 0){ 
	            alert("아이디와 비밀번호를 확인해주세요");
	            return false;
	        }
	    },
	    error:function(){
	    	alert("에러입니다.");
	    }
	});    
	}; 

	function alertPassword(){
	    var password = $('#password').val(); 
	    $.ajax({
	        url:"<c:url value='/checkPassword'/>", 
	        type:'post',
	        data:{'member_password':password},
	        success:function(cnt){ 
	            if(cnt == 0){ 
	            	alert("아이디와 비밀번호를 확인해주세요");
	                return false;
	            } 
	        },
	        error:function(){
	            alert("에러입니다.");
	        }
	    });  
	};  
	

</script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
</style>
</head>
<body>
	<div class="main" align="center">
		<div class="wrap">
			<div id = "common" style="width : 1000px; padding : 60px 0px ;">  <!-- 로고 상하 위치 조정 -->
				<div class = "content_container">
		           <div class = "content_container_div2">
		               <div class="login_container">
						<div class="login_item login_item1">
							<div class="navbar__logo">
					        	 <a href="${path}/main" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
					       </div>
						</div>
						<div class="login_item login_item2">
							<div  style="padding-top:65px; text-align : center; height:465px;">
								<form action="login" id="form" method="post">
									<table id="table_tr">
										<tr id="table_tr_id">
											<td colspan="2">
												<input type="text" name="member_id" id="id" class="login_input" oninput="checkId()" placeholder="👥 아이디" required >
											</td>
										</tr>
										<tr id="table_tr_middle">
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr id="table_tr_pw">
											<td colspan="2">
												<input type="password" name="member_password" id="password" class="login_input" oninput="checkPassword()" placeholder="🔒 비밀번호" required>
											</td>
										</tr>					
										<tr id="table_tr_remember">
										  <td colspan="2">
										    <label style="float:left; font-size:14px;">
											    <br><input type="checkbox" name="chkAll" id="remember_chk" class="chkAll">
											    <span>로그인 상태 유지</span>
											</label>
										  </td>
										</tr>
										<tr id="table_tr_middle">
											<td colspan="3">&nbsp;
												<div class="user_id_already">아이디와 비밀번호를 다시 확인해주세요.</div>
											</td>
										</tr>
										<tr id="table_tr_btn">
											<td></td>
											<td>
												<input type="submit" id="loginBtn" value="로그인" onclick="alertId(); alertPassword()" class="middle_input">
											</td>
											<td>
												<input type="button" value="회원가입" class="middle_input" style="color:rgb(192, 228, 255); background-color:white; border: 2px solid rgb(192, 228, 255);" onclick="window.location.href='memberAgreement.do'">
											</td>									
										</tr>
									</table>
								</form>
								<div class="function" align="center">
								   <a href="${path}/findId">아이디 찾기&nbsp;·&nbsp;</a><a href="${path}/findPassword">비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</div>
		        </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>