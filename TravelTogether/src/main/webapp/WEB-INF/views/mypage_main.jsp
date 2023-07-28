<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favi/favicon-16x16.png">
<meta charset="UTF-8">
<title>TT_마이페이지</title>
<script src="${path}/resources/js/jquery-3.6.4.js"></script>
<script src="${path}/resources/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage.css?dddd">
<script src="//code.jquery.com/jquery.min.js"></script>
<script> 
/* 사이드바 */
	$(() => {
		
		$('#tabs a').bind('click', function(e) {
			$('#tabs a.current').removeClass('current');
			$('.tab-section:visible').hide();
			$(this.hash).show();
			$(this).addClass('current');
			e.preventDefault();
		}).filter(':first').click();
	});
/* --------유효성--------- */
  window.onload = function() {
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
      alert('회원정보가 수정되었습니다. 상단 프로필을 클릭하여 확인해주세요~!');
    };
  };
  
  function deleteMember() {
	  alert('회원탈퇴가 정상적으로 처리 되었습니다.');
  }
  
  /* --별병 중복체크-- */
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
                       alert("별명을 다시 입력해주세요");
                       $('#nickname').val('');
                       return false;
                   }
               },
               error:function(){
                   alert("에러입니다");
               }
           });
         }; 
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
	<div class="title">
		<h2/>
	</div> 
	<div class="container">
		<div class="sidebar">
			<div class="sidebar-inner">
				<ul id="tabs">
					<li><a href="#description">회원 정보</a></li>
					<li><a href="#memberLike">'좋아요' 목록</a></li>
					<li><a id="memberBoardLink" href="#details">내가 작성한 동행 게시글</a></li>
					<li><a href="#review">내가 작성한 댓글</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
		<form id="form" action="updateMember" method="post" enctype="multipart/form-data">
			<div id="description" class="tab-section">
				<h2>회원 정보</h2>
				<hr style="border-color: #ccc;">
					
				<div class="user_image" style="display: flex; flex-direction: column; align-items: center; ">
					<c:if test="${ empty sessionScope.userProfile}">
						<div class="rounded-image">
							<img id="img" src="${path}/resources/image/member/member.png" height="150" width="150">
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.userProfile}">
						<div class="rounded-image">
							<img id="img2" src="${path}${sessionScope.userProfile}" height="150" width="150">
						</div>
					</c:if>
						<input id="input_img" type="file" name="member_profile_image" accept="image/bmp,image/jpg,image/jpeg,image/png">
				</div>
									
				<script>                  
				// 사진업로드 처리
					$(document).on('change', '#input_img', function(e){
						var reader = new FileReader();
						    reader.onload = function (e) {
						    $('#img').attr('src', e.target.result);
						    $('#img2').attr('src', e.target.result);
					  	}
					  	reader.readAsDataURL(this.files[0]);
					});
				
					// 업로드 확장자 제한
					document.getElementById("input_img").addEventListener("change", function(event) {
					  const fileInput = event.target;
					  const allowedExtensions = ["bmp", "jpg", "jpeg", "png"];
					  
					  if (!fileInput.files || fileInput.files.length === 0) {
					    return;
					  }
					  const selectedFile = fileInput.files[0];
					  const fileExtension = selectedFile.name.split(".").pop().toLowerCase();

					  if (!allowedExtensions.includes(fileExtension)) {
					    alert("이미지 파일의 확장자는 " + allowedExtensions.join(", ") + " 중 하나여야 합니다.");
					    fileInput.value = "";
					  }
					});

				</script>
				<div class="info">
					<table id="info_table">
						<tr>
							<td>
								<h5><font style="font-weight: bold;">아이디<br><input type='text' name='member_id' value='${member.member_id}'size="44" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">이름<br><input type='text' name='member_name' value='${member.member_name}'size="44" readonly="readonly"></font>&nbsp;&nbsp;</h5>

							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">핸드폰 번호<br><input type='tel' name='member_phone_number' value='${member.member_phone_number}'size="44" readonly="readonly"></font>&nbsp;&nbsp;</h5>

							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">별명<br><input type='text' name='member_nickname' id="nickname" oninput="checkNickname()" value='${member.member_nickname}'size="44" required="required"></font>&nbsp;&nbsp;</h5>
								<span class="user_nickname_ok">사용 가능한 별명 입니다.</span>
	            				<span class="user_nickname_already">중복된 별명 입니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">비밀번호<br><input type='password' id="password" name='member_password' value='${member.member_password}'size="44" required="required"> </font>&nbsp;&nbsp;</h5>
								<span class="user_password_ok">사용 가능합니다.</span>
	            				<span class="user_password_already">비밀번호(8~12자, 영문+숫자+특수문자 사용)</span>
	            				<span class="user_password_already2">비밀번호가 일치하지 않습니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">비밀번호 확인<br><input type='password' id="password2" value='${member.member_password}'size="44" required="required"> </font>&nbsp;&nbsp;</h5>

							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">생년월일<br><input type='text' name='member_birthday' value='${member.member_birthday}'size="44" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">성별 <br><input type='text' name='member_gender' value='${member.member_gender}'size="44" readonly="readonly"></font>&nbsp;&nbsp;</h5>
							</td>
						</tr>
						<tr>
							<td>
								<h5><font style="font-weight: bold;">가입일시<br><div class="create_date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${member.member_create_date}"/></div></font>&nbsp;&nbsp;</h5>
								<%-- <input type='text' name='member_create_date' value="${member.member_create_date}" size="44" readonly="readonly"> --%>
							</td>
						</tr>
					</table>
				</div>
				<div id="btn">
					<input type="submit" id="modifyBtn" value="수정하기" class="btn btn-default">&nbsp;&nbsp;
					<a href="${path}/deleteMember?member_id=${member.member_id}" id="modifyBtn" onclick="deleteMember()" class="btn btn-default">탈퇴하기</a>
				</div>
			</div>
		</form>
			<!-- 동행신청정보 탭 -->
	<div id="companioninfo" class="tab-section">
		<div id="writedlist">
				<h2>좋아요</h2>
				<hr style="border-color: black;">
				<p>??</p>
		</div>	
	</div> 
	
		<div id="details" class="tab-section" text-aligin="center">
		<h2>${member.member_nickname}의 동행 게시글 목록</h2>
		<hr style="border-color: black;">
		<c:if test="${!empty memberBoardList}">
			<table class="list" border="1" cellpadding="0" cellspacing="0" width="850">
				<tr>
					<th width="252">축제 이름</th>
					<th width="189">게시글 제목</th>
					<th width="110">동행시작일</th>
					<th width="110">동행종료일</th>
					<th width="110">작성일</th>
					<th width="110">수정일</th>
				</tr>
				<c:forEach items="${memberBoardList}" var="board">
				<tr>
					<td><a href="${path}/getFestival.do?festival_name=${board.festival_name}">${board.festival_name}</a></td>				
					<td><a href="${path}/board.do?no=${board.board_number}">${board.board_title}</a></td>
					<td>${board.board_start_date}</td>
					<td>${board.board_end_date}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_write_date}"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.board_update_date}"/></td>
				</tr>			
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${empty memberBoardList}">
				<h4>동행게시글을 작성하여 모두와 축제 동행을 해보세요.</h4>
			</c:if>
		</div>
		<div id="review" class="tab-section">
			<h2>${member.member_nickname}의 댓글 목록</h2>
			<hr style="border-color: black;">
			<c:if test="${!empty memberCommentList}">
			<table class="list" border="1" cellpadding="0" cellspacing="0" width="850">
				<tr>
					<th width="100">번호</th>
					<th width="100">게시판 번호</th>
					<th width="395">내용</th>
					<th width="120">작성일</th>
					<th width="120">수정일</th>
				</tr>
				<c:forEach items="${memberCommentList}" var="comment">
				<tr>
					<td>${comment.comment_number}</td>
					<td><a href="${path}/board.do?no=${comment.board_number}">${comment.board_number}</a></td>				
					<td><a href="${path}/board.do?no=${comment.board_number}">${comment.comment_content}</a></td> <%-- ${path}/comment?no=${comment.comment_number} --%>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.comment_write_date}"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.comment_update_date}"/></td>
				</tr>			
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${empty memberCommentList}">
				<h4>작성된 댓글이 없습니다.</h4>
			</c:if>
		</div>
		      <!-- 내가 추가 -->
      <div id="memberLike" class="tab-section">
         <h2>${member.member_nickname}의 좋아요 목록</h2>
         <hr style="border-color: black;">
         <c:if test="${!empty memberLikeList}">
            <div class="row">
               <c:forEach items="${memberLikeList}" var="memberLike">
                  <div id="likeList" class="col-md-4 col-sm-6 col-12 mb-3" style="margin-top: 30px;">
                     <div style="height: 280px; border: 3px solid rgb(192, 228, 255); border-radius: 15px; overflow: hidden">
                        <div style="height: 230px; border-top-left-radius: 15px; border-top-right-radius: 15px; position: relative;">
                           <a href="${path}/getFestival.do?festival_name=${memberLike.festival_name}">
                           <c:set var="imagePath" value="${path}/resources/image/festival/${memberLike.festival_name}/${memberLike.festival_name}_1_공공3유형" />
                              <img style="position: absolute; width: 100%; height: 100%; object-fit: cover;" 
                                 src="${imagePath}.png" onerror="this.onerror=null; this.src='${imagePath}.jpg'" />
                           </a>
                        </div>
                        <div>
                           <h4 style="font-weight: bolder;">&nbsp;${memberLike.festival_name}</h4>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div> 
            </c:if>
            <c:if test="${empty memberLikeList}">
				<h4>축제정보를 확인하고 좋아요 버튼을 눌러주세요!</h4>
			</c:if>     
      </div>
	</div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${path}/resources/js/mypage.js"></script>	
</body>
</html>