function alertId(){
	var id = $('#id').val();
	$.ajax({
	    url:"<c:url value='/checkId.do'/>", 
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
