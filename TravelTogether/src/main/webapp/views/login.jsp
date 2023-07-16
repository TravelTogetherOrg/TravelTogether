<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css?ss">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
<script src="/js/date-picker.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@1,900&display=swap');
@media (max-width: 768px) {
  .main {
    min-width: auto;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start; /* align-items 값을 flex-start로 변경 */
    height: 100vh;
    overflow-y: auto; /* 세로 스크롤 추가 */
  }

  .login_item.login_item2 {
    width: auto;
    margin: 0 auto;
  }
  
  .login_container {
    width: 60%;
  }
}

@media (max-width: 480px) {
  .login_container {
    width: 90%;
  }
  
  #sns {
    display: none;
  }
}
.navbar__logo{
    font-family: 'Fira Sans', sans-serif;
    font-weight: bolder;
    font-size: 1.6em;
  }
  .navbar__logo span {
    color: orange;
    padding-left: 0;
  }
  a{
    text-decoration: none;
    color: black;
  }
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
				        	 <a href="${path}/main.jsp" ondragstart='return false'>🚆<span>T</span>ravel <span>T</span>ogether</a>
				       </div>
					</div>
					<div class="login_item login_item2">
						<div  style="padding-top:65px; text-align : center; height:465px;">
							<form action="login.do" method="post">
								<table id="table_tr">
									<tr id="table_tr_id">
										
										<td colspan="2"><input type="text" name="member_id"
											id="m_id" class="login_input" placeholder="👥 아이디" required ></td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_pw">
										<td colspan="2"><input type="password"
											name="member_password" id="m_pw" class="login_input"
											placeholder="🔒 비밀번호" required></td>
									</tr>						
									<tr id="table_tr_remember">
									  <td colspan="2">
									    <label style="float:left; font-size:14px;">
										    <br><input type="checkbox" name="chkAll" id="remember_chk" class="chkAll">
										    <span>&nbsp;로그인 상태 유지</span>
										</label>
									  </td>
									</tr>
									<tr id="table_tr_middle">
										<td colspan="3">&nbsp;</td>
									</tr>
									<tr id="table_tr_btn">
										<td></td>
										<td><input type="submit" value="로그인"
											class="middle_input"></td>
										<td>
   											 <input value="회원가입" class="middle_input" 
   											 		style="color:rgb(192, 228, 255); background-color:white; border: 2px solid rgb(192, 228, 255);" 
   											 		onclick="window.location.href='memberAgreement.jsp'">
										</td>									
									</tr>
								</table>
							</form>
							<div class="function">
							    <a href="#">아이디 찾기</a>&nbsp;|&nbsp; 
							    <a href="#">비밀번호 찾기</a>
							   <!--  <span class="spacer"></span>
							    <a href="./memberAgreement.html">회원가입</a> -->     <!-- 버튼 따로 만듦 -->
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