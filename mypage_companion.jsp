<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<style>
* {
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
}
html{
	height : 100%;
}
body{
	height : 100%;
}
.wrap{
	min-height:100%;
	position : relative;
	padding-bottom : 200px;
}
table{
    text-align: center;
}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>


</head>
<style>
#writedlist{
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}
.btn-default2{
	width: 49%;
}
#cominfoBtn_G{
	background: #2C3C5B;
	color: white;
}
#companioninfo_t, #msg2{
	display: none;
}
#endBtn{
	padding: 1px 3px 1px 3px;
}
a{
	text-decoration: none;
}
.textDiv{
	margin-top: 30px;
}
</style>
<body>
	<div class="wrap">
		<%-- <jsp:include page="header.jsp"/> --%>
		
		<div id="writedlist">
			<h3 style="margin-bottom: 50px;">동행 신청 내역</h3>
			<button id="cominfoBtn_G" class="btn btn-default btn-default2">보낸 동행신청 내역</button>
			<button id="cominfoBtn_T" class="btn btn-default btn-default2">받은 동행신청 내역</button><br><br>
			
			
			
			<!-- 보낸 동행 신청 -->
			<c:if test="${not empty companioninfo_g}">
			<table id="companioninfo_g" class="table">
				<tr style="background: #dfd9f7;">
					<td>글번호</td>
					<td>동행글 제목</td>
					<td>작성자</td>
					<td>수락여부</td>
				</tr>
				<c:forEach items="${companioninfo_g}" var="companioninfo_g">
				<tr>
					<td>${companioninfo_g.c_id}</td>
					<td>${companioninfo_g.c_name}</td>
					<td>${companioninfo_g.m_id2}</td>
					<td>${companioninfo_g.c_yn}</td>
				</tr>
				</c:forEach>
			</table> 
			</c:if>
			<div id="msg1">
				<c:if test="${empty companioninfo_g}">
				<div class="textDiv">동행 신청내역이 없습니다.<br><a style="text-decoration: none;" href="companion_list.do">동행신청 하러가기</a>
				</div>
				</c:if>
			</div>
			
			<!-- 받은 동행 신청 -->
			<c:if test="${not empty companioninfo_t}">
			<table id="companioninfo_t" class="table">
				<tr style="background: #dfd9f7;">
					<td>글번호</td>
					<td>동행글 제목</td>
					<td>신청자</td>
					<td>수락여부</td>
					<td>채팅</td>
				</tr>
				<c:forEach items="${companioninfo_t}" var="companioninfo_t">
				<tr>
					<td>${companioninfo_t.c_id}</td>
					<td>${companioninfo_t.c_name}</td>
					<td>${companioninfo_t.m_id}</td>
					<td>
					<c:if test="${companioninfo_t.c_yn eq 'N'}">
						<button class="OkBtn btn btn-default">수락하기</button>
					</c:if>
					<c:if test="${companioninfo_t.c_yn eq 'Y'}">
					${companioninfo_t.c_yn}&nbsp;&nbsp;&nbsp;
					</c:if>
					</td>
					<td id="inviteBtnTd">
					<c:if test="${companioninfo_t.ch_inout eq 'I'}">
						<font style="color:blue;" color="blue">초대완료</font>
					</c:if>
					<c:if test="${companioninfo_t.ch_inout ne 'I'}">
						<button class="ChattingBtn btn btn-default">채팅초대하기</button>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</table> 
			</c:if>
			<div id="msg2">
			<c:if test="${empty companioninfo_t}">
			<div class="textDiv">받은 동행 신청내역이 없습니다.
			</div>
			</c:if>
			</div>
		</div>

		<%-- <jsp:include page="footer.jsp"/> --%>
	</div>
	


<script>
$(function() {
	if("${listView}"=="t"){
		cominfoBtn_T.click();
	}
});
</script>
<script>
$('#cominfoBtn_G').on('click',function(){
	$('#cominfoBtn_G').css('background','#2C3C5B');
	$('#cominfoBtn_G').css('color','white');
	$('#cominfoBtn_T').css('background','white');
	$('#cominfoBtn_T').css('color','#333');
	$('#companioninfo_g').css('display','table');
	$('#companioninfo_t').css('display','none');
	$('#msg1').css('display','block');
	$('#msg2').css('display','none');
})
$('#cominfoBtn_T').on('click',function(){
	$('#cominfoBtn_G').css('background','white');
	$('#cominfoBtn_G').css('color','#333');
	$('#cominfoBtn_T').css('background','#2C3C5B');
	$('#cominfoBtn_T').css('color','white');
	$('#companioninfo_g').css('display','none');
	$('#companioninfo_t').css('display','table');
	$('#msg1').css('display','none');
	$('#msg2').css('display','block');
})

$('.OkBtn').on('click',function(e){
	var bool = confirm("동행 신청을 수락하겠습니까?\n※수락 후 취소가 불가합니다.※");
	if(bool){
		var tdArr = new Array();    // 배열 선언
	    var checkBtn = $(this);
		
	    var tr = checkBtn.parent().parent();
	    var td = tr.children();
	    
	    var c_id = td.eq(0).text().trim();
	    var m_id = td.eq(2).text().trim();
	    window.location="updateCompanionOk.do?c_id="+c_id+"&m_id="+m_id;
	}else if(bool==false){
		return false;
	}
});

$('.ChattingBtn').on('click',function(e){
	var tdArr = new Array();    // 배열 선언
    var checkBtn = $(this);
	
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
    var c_id = td.eq(0).text().trim();
    var m_id2 = td.eq(2).text().trim();	//신청자
	
	var bool = confirm("[" + m_id2 + "]를 [" + c_id + "번글 채팅방]에 초대하겠습니까?");
	if(bool){
		
	 	// 채팅방 개설(본인 insert)
	 	// 신청자 초대(상대방 insert)
	 	$.ajax({
	 		url : "inviteChat.do?c_id=" + c_id + "&m_id2=" + m_id2,
	 		success : function(){
				alert("초대가 완료되었습니다. \n [ 마이페이지 → 채팅방 ] 에서 확인하세요!");
				window.location = "CompanionStatus2.do?m_id=${sessionScope.userID}";
	 		},
	 		error : function(){
				alert("초대에 실패했습니다. 관리자에게 문의하세요!");	 			
	 		}
	 	});
	}else if(bool==false){
		return false;
	}
});
</script>

</body>
</html>
