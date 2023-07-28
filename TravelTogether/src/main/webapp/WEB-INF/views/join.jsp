<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favi/favicon-16x16.png">
<meta charset="UTF-8">
<title>TT_회원가입</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/join.css?s">
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" 
		integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" 
		crossorigin="anonymous" 
		referrerpolicy="no-referrer">
</script>
<script type="text/javascript">
/*  ---유효성--- */
  window.onload = function() {
	  var dateInput = document.getElementById('birth');

	  dateInput.onchange = function() {
	    var selectedDate = new Date(this.value);
	    var currentDate = new Date();
	    currentDate.setFullYear(currentDate.getFullYear() - 19);
	 
	    if (selectedDate > currentDate) {
	      alert('19세 이상만 가입할 수 있습니다.');
	      this.value = '';
	    } else if (
	      selectedDate.getFullYear() === currentDate.getFullYear() &&
	      selectedDate.getMonth() === currentDate.getMonth() &&
	      selectedDate.getDate() > currentDate.getDate()
	    ) {
	      alert('19세 이상만 가입할 수 있습니다.');
	      this.value = '';
	    } 
	  };
	  
	   var passwordInput = document.getElementById('password');
	   var passwordConfirmInput = document.getElementById('password2');
	   var form = document.getElementById('form');


	    function validatePassword() {
	      var password = passwordInput.value;
	      var passwordConfirm = passwordConfirmInput.value;

	 
	      var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;

	      if (!passwordPattern.test(password)) {
	        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자(@$!%*#?&)를 포함해야 합니다.');
	        $('.user_password_already').css("display","inline-block");
	        $('.user_password_already2').css("display","none");
	        return false;
	        
	      } else if (password !== passwordConfirm) {
	        alert('비밀번호가 일치하지 않습니다.');
	        $('.user_password_already').css("display","none");
	        $('.user_password_already2').css("display","inline-block");
	        return false;
	      }
	      $('.user_password_already').css("display","none");
	      $('.user_password_already2').css("display","none");
	      $('.user_password_ok').css("display","inline-block");
	      return true;
	    }
	    form.onsubmit = function() {
	      if (!validatePassword()) {
	        return false; 
	      }
	    };
	  };

 function checkId(id){
	
        var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:"<c:url value='/checkId'/>", //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{'member_id':id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.user_id_ok').css("display","inline-block");
               		$('.user_id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.user_id_already').css("display","inline-block");
                    $('.user_id_ok').css("display", "none");
                    alert("이메일이 중복되었습니다. 다시 확인해 주세요.");
                    $('#id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
      };
        
 function checkTel(tel){
	
        var tel = $('#tel').val(); 
        $.ajax({
            url:"<c:url value='/checkPhoneNumber'/>", 
            type:'post', 
            data:{'member_phone_number':tel},
            success:function(cnt){ 
                if(cnt == 0){ 
                    $('.user_tel_ok').css("display","inline-block");
               		$('.user_tel_already').css("display", "none");
                } else { 
                    $('.user_tel_already').css("display","inline-block");
                    $('.user_tel_ok').css("display", "none");
                    alert("중복된 핸드폰 번호입니다. 다시 확인해 주세요.");
                    $('#tel').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
     };
        
        function checkNickname(){
            var nickname = $('#nickname').val(); 
            $.ajax({
                url:"<c:url value='/checkNickname'/>", 
                type:'post', 
                data:{'member_nickname':nickname},
                success:function(cnt){ 
                    if(cnt == 0){ 
                        $('.user_nickname_ok').css("display","inline-block"); 
                        $('.user_nickname_already').css("display", "none");
                   
                    } else { 
                        $('.user_nickname_already').css("display","inline-block");
                        $('.user_nickname_ok').css("display", "none");
                        alert("별명이 중복되었습니다. 다시 확인해 주세요.");
                        $('#nickname').val('');
                    }
                },
                error:function(){
                    alert("에러입니다");
                }
            });
          };    
</script>
<body>
	<div class="member">
        <div class="navbar__logo" align="center">
       	 	<a href="${path}/main" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
		</div>
		<div class="join" align="center">
       	 	<h4 style="font-family:'GmarketSansMedium'">회원가입</h4>
		</div>
        <h4>입력사항 <span style="color:orange;">(필수)</span></h4>
        <form id="form" action="insertMember" method="post">
	      <div id="container">
	        <div class="input_control">
	            <span class="placehold-text"><input id="id" type="email" placeholder="이메일 주소" name="member_id" oninput="checkId()" required></span>
	            <span class="user_id_ok">사용 가능한 아이디 입니다.</span>
	            <span class="user_id_already">중복된 아이디 입니다.</span>
	        </div>
	        <div class="input_control">
	            <input id="password" class="userpw" type="password" name="member_password" placeholder="비밀번호(8~12자, 영문+숫자+특수문자 사용)" required>
	            <span class="user_password_ok">사용 가능합니다.</span>
	            <span class="user_password_already">비밀번호(8~12자, 영문+숫자+특수문자 사용)</span>
	            <span class="user_password_already2">비밀번호가 일치하지 않습니다.</span>
	        </div>
	        <div class="input_control">
	            <input id="password2" class="userpw-confirm" type="password" placeholder="비밀번호 재확인" required>
	            <div class="user_password2"></div>
	        </div>
	        <div class="input_control">
	            <input id="name" type="text" placeholder="이름" name="member_name" required>
	            <div class="user_name"></div>
	        </div>
	        <div class="input_control">
	            <input id="tel" type="tel" placeholder="핸드폰번호( ' - '없이 입력 )" name="member_phone_number" oninput="checkTel(); 
	            																						this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
	            <span class="user_tel_ok">사용 가능합니다.</span>
	            <span class="user_tel_already">중복 되었습니다.</span>
	        </div>
	        <div class="input_control birth">
	            <input id="birth" type="date" name="member_birthday" required>
	        </div>
	        <div class="input_control gender">
	             <select id="gender" name="member_gender" required="required">
	             	<option value="" disabled selected>성별</option>
	     			<option value="남">남</option>
	       			<option value="여">여</option>
	   			 </select>
	   			 <div class="user_gender"></div>
	        </div>
	        <div class="input_control">
	            <span class="placehold-text"><input id="nickname" type="text" name="member_nickname" placeholder="닉네임" oninput="checkNickname()" required></span>
	            <span class="user_nickname_ok">사용 가능한 별명 입니다.</span>
	            <span class="user_nickname_already">중복된 별명 입니다.</span>
	        </div>
	         <input type="submit" value="가입하기" style="font-size:20px;">
	 	 </div>
  	</form>
  </div>
</body>
</html>