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