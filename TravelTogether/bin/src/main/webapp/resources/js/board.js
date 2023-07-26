/* 제이쿼리 불러오기 */
function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-3.6.4.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
loadJQuery();

/* boardList */
/* 지역 클릭하면 해당 축제 list select에 뜨게하기 */
let findRegion = document.getElementById('findRegion');
if(findRegion != null){
    findRegion.addEventListener('change', function(event){
        let region = findRegion.value;
        $.ajax({
            async: true,
            type: 'POST',
            data: region,
            url: "getRegionFestivals", //.do
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){
                let findFestivalOption = document.querySelectorAll('.findFestival')
                if(findFestivalOption!=null){
                    for(let i=0;i<findFestivalOption.length;i++){
                        findFestivalOption[i].remove();
                    }
                }
                let findFestivals = document.getElementById('findFestivals');
                for(let i=0; i<Object.keys(data.festivals).length;i++){
                    let option = document.createElement('option');
                    if(data.festivals[i] != 'undefined' && data.festivals[i] != null){
                        option.value = data.festivals[i].festival_name;
                        option.className = 'findFestival';
                        findFestivals.append(option);
                    }
                }
                let findFestival = document.getElementsByClassName('findFestival');
                for(let i=0; i<findFestival.length;i++){
                    if(data.festivals[i] != 'undefined' && data.festivals[i] != null){
                        findFestival[i].append('\u00a0\u00a0\u00a0\u00a0\u00a0'+data.festivals[i].festival_name);
                    }
                }
            },
            error: function(request,status,error){
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    });

    function nullcheck(){
        let findFestivals = document.getElementById('findFestivals');
        if(findRegion.value=='     지역 검색' || findFestivals.value == '     어떤 축제를 찾으시나요?'){
            let hostIndex = location.href.indexOf(location.host) + location.host.length;
            let contextPath = location.href.substring(hostIndex,location.href.indexOf('/', hostIndex+1));
            location.href = contextPath+'/boardList'; //.do
        }else{
            document.findForm.submit();
        }
    }
}

/* 글쓰기 로그인 체크*/
function loginCheck(id){
    if(id==null){
        alert('로그인이 필요한 서비스 입니다.');
    }else{
        let hostIndex = location.href.indexOf(location.host) + location.host.length;
        let contextPath = location.href.substring(hostIndex,location.href.indexOf('/', hostIndex+1));
        location.href = contextPath+'/insertBoard'; //.do
    }
}

let col = document.getElementsByClassName('col');
let middleHover = document.getElementsByClassName('middleHover');
let thumnail = document.getElementsByClassName('thumnail');

for(let i=0;i<col.length;i++){
    col[i].addEventListener('mouseover', function(event){
        middleHover[i].style.display = 'block';
        thumnail[i].style.transform = 'scale(1.2)';
        thumnail[i].style.transition = 'all 0.5s';
        

    })
    col[i].addEventListener("mouseout", function(event){
        middleHover[i].style.display = 'none';
        thumnail[i].style.transform = 'scale(1)';
        thumnail[i].style.transition = 'all 0.5s';

    })
}

/*댓글 수*/
let boardCommentCount = document.getElementsByClassName('boardCommentCount');
if(boardCommentCount != null){
    for(let i=0; i<boardCommentCount.length; i++){
        let count = document.querySelectorAll('.boardCommentCount p');
        if(count[i].innerHTML == ''){
        	count[i].innerHTML = 0;
        }
    }
}


/* 페이징 */
/* 해당 페이지 번호 표시, 클릭한 페이지로 이동 */
let pageButton = document.querySelectorAll('#pageNumbers button');
pageButton.forEach((el)=>{
    if(el.className == 'pageItemActive'){
        el.style.color = 'rgb(192, 228, 255)';
    }
    el.addEventListener('click', function(event){
        document.pageForm.pageNumber.value = el.innerHTML;
        document.pageForm.submit();
    });
});
/*
 chevron 페이지 넘기기 
 */
let firstPage = document.getElementById('firstPage');
if(firstPage != null){
	firstPage.addEventListener('click', function(event){
	 	document.pageForm.pageNumber.value = 1;
	    document.pageForm.submit();
	});
}


let pageItemActive = document.getElementsByClassName('pageItemActive');
let prevPage = document.getElementById('prevPage');
if(pageItemActive != null && prevPage != null){
	if(pageItemActive[0].innerHTML=='1'){
	        prevPage.style.pointerEvents = 'none';
	}else{
	    prevPage.addEventListener('click', function(event){
	        document.pageForm.pageNumber.value = pageItemActive[0].innerHTML - 1;
	        document.pageForm.submit();
	    });
	}
}

let nextPage = document.getElementById('nextPage');
if(pageItemActive != null && nextPage != null){
	if(pageItemActive[0].innerHTML== document.pageForm.endPage.value){
	    nextPage.style.pointerEvents = 'none';
	}else{
	    nextPage.addEventListener('click', function(event){
	        document.pageForm.pageNumber.value = pageItemActive[0].innerHTML + 1;
	        document.pageForm.submit();
	    });
	}
}


let lastPage = document.getElementById('lastPage');
if(pageItemActive != null && lastPage != null){
	 lastPage.addEventListener('click', function(event){
	   document.pageForm.pageNumber.value = document.pageForm.endPage.value;
	   document.pageForm.submit();
	});
}




/* boardWrite */
let seoul = '서울';
$.ajax({
    async: true,
    type: 'POST',
    data: seoul,
    url: "getRegionFestivals", //.do
    dataType: "json", 
    contentType: "application/json; charset=UTF-8",
    success: function(data){
        if(!document.getElementById(seoul+'Festival')){
            let selectFestival = document.getElementById('selectFestivalByRegion');
            let div = document.createElement('div');
            div.id = seoul+'Festival';
            selectFestival.append(div);
            let table = document.createElement('table');
            table.id = 'festivalsByRegion';
            div.append(table);
            for(let i=0;i<Math.ceil(Object.keys(data.festivals).length/4);i++){
                let tr = document.createElement('tr');
                tr.className = 'tr'+seoul;
                table.append(tr); 
            }
            let trs = document.querySelectorAll('.tr'+seoul);
            trs.forEach((el)=>{
                for(let i=0; i<4;i++){
                    let td = document.createElement('td');
                    td.className = 'td'+seoul;
                    el.append(td);
                }
            });
            let tds = document.querySelectorAll('.td'+seoul);
            tds.forEach((el,index)=>{
                if(data.festivals[index] != 'undefined' && data.festivals[index] != null){
                   el.append(data.festivals[index].festival_name);
                }
                
            });
        }
    
    },
    error: function(request,status,error){
        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
});

/* 지역td 선택시 bg/color 바뀌게 */
let regions = document.querySelectorAll('#regions td');
regions.forEach((el)=>{
    el.className='region';
});
//게시글 등록시 넘길 값
let festival_name;
//축제 시작날
let minDate;
//축제 마지막날
let maxDate;
let boardSelectRegion = document.getElementsByClassName('region');
for(let i=0; i<boardSelectRegion.length; i++){
    boardSelectRegion[i].addEventListener('click', function(event){
        for(let j=0; j<boardSelectRegion.length; j++){
            if(boardSelectRegion[j].style.background = 'rgb(192, 228, 255)'){
                boardSelectRegion[j].style.background = 'white';
                boardSelectRegion[j].style.color = 'black';
            }
        };
        boardSelectRegion[i].style.background = 'rgb(192, 228, 255)';
        /* 지역 선택시 해당지역 축제 리스트로 바뀌게*/
        let selectRegion = boardSelectRegion[i].getAttribute('id');
        $.ajax({
            async: true,
            type: 'POST',
            data: selectRegion,
            url: "getRegionFestivals", //.do
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){s
            console.log(data);
            console.log(data.festivals.length);
            console.log(data.festivals.length==0);
            if(data.festivals.length==0){
                if(document.getElementById(selectRegion+'Festival') == null){
                    let selectFestival = document.getElementById('selectFestivalByRegion');
                    let div = document.createElement('div');
                    div.id = selectRegion+'Festival';
                    div.style.textAlign = 'center';
                    div.style.fontSize = '1.25em';
                    div.style.width = '100%'
                    div.innerText = '해당 지역의 축제가 없습니다.';
                    selectFestival.append(div);
                }
            }        
            if(!document.getElementById(selectRegion+'Festival')){ //null인 경우
                let selectFestival = document.getElementById('selectFestivalByRegion');
                let div = document.createElement('div');
                div.id = selectRegion+'Festival';
                selectFestival.append(div);
                let table = document.createElement('table');
                table.id = 'festivalsByRegion';
                div.append(table);
                for(let i=0;i<Math.ceil(Object.keys(data.festivals).length/4);i++){
                    let tr = document.createElement('tr');
                    tr.className = 'tr'+selectRegion;
                    table.append(tr);
                }
                let trs = document.querySelectorAll('.tr'+selectRegion);
                trs.forEach((el)=>{
                    for(let i=0; i<4;i++){
                        let td = document.createElement('td');
                        td.className = 'td'+selectRegion;
                        el.append(td);
                    }
                });
                let tds = document.querySelectorAll('.td'+selectRegion);
                tds.forEach((el,index)=>{
                    if(data.festivals[index] != 'undefined' && data.festivals[index] != null){
                       el.append(data.festivals[index].festival_name);
                    }
                    
                });
            }
            /* 다른 지역 선택시 기존에 선택했던 지역축제div 안보이게하기*/
            let divs = document.getElementsByTagName('div');
            for(let k=0; k<divs.length; k++){
                if(divs[k].id.startsWith(boardSelectRegion[i].id)){
                    divs[k].style.display='block';
                }
                else if(divs[k].id.endsWith('Festival')){
                    divs[k].style.display='none';
                }
                // 지역 전환시 클릭했던 축제 색 초기화 
                let festivals = document.getElementsByClassName('festival');
                for(let j=0; j<festivals.length; j++){
                    festivals[j].style.color = 'black';
                }
            }
            
            
            /* 각 축제td 선택시 글자색 바뀌게 */
            let festivalsByRegion = document.querySelectorAll('#festivalsByRegion td');
            festivalsByRegion.forEach((el)=>{
                el.className='festival';
            });

            let festivals = document.getElementsByClassName('festival');
            for(let i=0; i<festivals.length; i++){
                festivals[i].addEventListener('click', function(event){
                    for(let j=0; j<festivals.length; j++){
                        if(festivals[j].style.color = 'rgb(192, 228, 255)'){
                            festivals[j].style.color = 'black';
                        }
                    }
                    festivals[i].style.color = 'rgb(192, 228, 255)';
                    festival_name = festivals[i].innerHTML;//축제명
                    document.boardForm.festival_name.value = festivals[i].innerHTML;
                    data.festivals.forEach((el,index)=>{
                        if(data.festivals[index] != 'undefined' && data.festivals[index] != null){
                            if(festivals[i].innerHTML==el.festival_name){
                                minDate = el.festival_startdate;
                                maxDate = el.festival_enddate;
                                let start_date = document.getElementById('start_date');
                                start_date.setAttribute('min',minDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
                                start_date.setAttribute('max',maxDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
                                let end_date = document.getElementById('end_date');
                                end_date.setAttribute('min',minDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
                                end_date.setAttribute('max',maxDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
                            }
                        }
                    });
                });
            }
            },
            error: function(request,status,error){
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    })
}


/* 1박 이상 선택시 input date 추가 */
let moreDaysCheckbox = document.getElementById('moreDays');
let lastDayInput = document.getElementById('lastDay');
if(moreDaysCheckbox != null){
	//수정시 end_date가 있으면 보이게 설정
	    if(moreDaysCheckbox.checked){
	        lastDayInput.style.display='block';
	        end_date.required = true;
	    }

    moreDaysCheckbox.addEventListener('click', function(event){
        let end_date = document.getElementById('end_date');
        
        if(moreDaysCheckbox.checked){
            lastDayInput.style.display='block';
            end_date.required = true;
        }
        else{
        	end_date.value = ''
            lastDayInput.style.display='none';
            end_date.required = false;
        }
    });
   
    

}

//이미지
let writeImageInfo = document.getElementsByClassName('writeImageInfo');
let inputImage = document.getElementById('inputImage');
if(writeImageInfo[0] != null){
	writeImageInfo[0].onclick = () =>{
	inputImage.click();
	}
}

if(inputImage != null){
    let handleFiles = (e) => {
        let selectedFile = [...inputImage.files];
        let fileReader = new FileReader();
        fileReader.readAsDataURL(selectedFile[0]);
        fileReader.onload = function () {
            writeImageInfo[0].style.backgroundImage = 'url('+fileReader.result+')';
            writeImageInfo[0].replaceChildren();
        };
    }
    inputImage.addEventListener("change", handleFiles);
}
 

//게시글 작성 limit확인 후 submit
function limitCheck(){
    //아이디랑 축제명 넘기기
    let member_id = $("#inputId").val();
    if(festival_name==null){
    	alert('축제를 선택해주세요.');
    }
    $.ajax({
		async: true,
        type: 'POST',
        data: JSON.stringify({
        		member_id,
        		festival_name
        		}),
        url: "limitCheck", //.do
        dataType: "json", 
        contentType: "application/json; charset=UTF-8",
        success: function(data){
            if(data.limit==3){ /*3회 이상 작성한 경우*/
                alert('해당 축제의 게시글을 3회이상 작성하였습니다. 기존 게시글을 삭제하시고 다시 작성해주세요');
            }
            else{ 
                let board_title = document.getElementById('board_title');
                let board_content = document.getElementById('board_content');

                if(board_title.value == ''){
                    alert('제목을 작성해 주세요.');
                }else if(board_content.value==''){
                    alert('내용을 작성해 주세요.');
                }else{
                    document.boardForm.submit();
                }
            }
        },
        error: function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
		
	});

}



/* board */

if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(success);
    console.log('지원함.');
}else{
    console.log('지원하지 않습니다.');
}
function success(position){ //자동으로 가져옴
    let lat = position.coords.latitude; //위도
    let lon = position.coords.longitude; //경도

    lat = lat.toPrecision(6);
    lon = lon.toPrecision(6);

    let map = document.getElementById('boardMapIframe');
	if(map != null){
		map.src="https://www.openstreetmap.org/export/embed.html?bbox="+
	    (parseFloat(lon)-0.003)+"%2C"+(parseFloat(lat)-0.003)+"%2C"+
	    (parseFloat(lon)+0.003)+"%2C"+(parseFloat(lat)+0.003);
	    //%2C == ,
	    //줌: -0.003, +0.003 숫자 변경으로 가능
	    //정확도가 이상하게 안맞음
	}
    

}

let boardImage = document.getElementById('boardImage');
let boardMap = document.getElementById('boardMap');
if(boardImage != null && boardMap != null){
	boardImage.addEventListener('mouseover', function(event){
	    boardMap.style.display='block';
	});
	boardImage.addEventListener("mouseout", function(event){
	    boardMap.style.display='none';
	});
}

/* 게시글 지우기 */
function deleteBoard(boardNumber){
    //deleteBoard?no=${board.board_number}"
    if(confirm('게시글을 삭제하시겠습니까?')){
        let hostIndex = location.href.indexOf(location.host) + location.host.length;
        let contextPath = location.href.substring(hostIndex,location.href.indexOf('/', hostIndex+1));
        location.href = contextPath+'/deleteBoard?no='+boardNumber;
    }
}

/* 답글달기 누르면 댓글 작성창에 @아이디뜨게 */
let commentWrite = document.querySelector('#commentWrite textarea');
let commentusers;
let recommentbuttons;
let comment_numberInput;
let commentuserNickname = '';
let comment_number = ''; //ajax 전송(답글)
let member_nickname = document.getElementById('member_nickname'); 
let recomments;
if(member_nickname != null){ //ajax 전송(댓글 작성자 로그인한 사람의 닉네임)
    member_nickname = document.getElementById('member_nickname').value; 
}

if(commentWrite != null){
    //댓글 textarea change 이벤트
    commentWrite.addEventListener('change', function(event){
        //@닉네임이 같은게 없으면 comment_nickname 초기화
        commentusers = document.getElementsByClassName('commentUserName');
        for(let i=0; i<commentusers.length; i++){
	        if(!commentWrite.value.startsWith('@'+commentusers[i].innerText)){
                commentuserNickname = ''; //작성된 댓글 작성자의 닉네임
            }else if(commentWrite.value.startsWith('@'+commentusers[i].innerText)){
                commentuserNickname = '@'+commentusers[i].innerText+' '; //작성된 댓글 작성자의 닉네임
                break;
            }
        }
    });

    //답글달기 onClick
    function reComment(commentNumber){
        if(member_nickname == null){
            alert('로그인이 필요한 서비스 입니다.');
        }else{
            commentWrite = document.querySelector('#commentWrite textarea');
            commentusers = document.getElementsByClassName('commentUserName');
            recommentbuttons = document.getElementsByClassName('recommentWrite');
            comment_numberInput = document.getElementsByClassName('comment_number');
            commentuserNickname = '';
            comment_number = ''; //ajax 전송(답글)
            //member_nickname = document.getElementById('member_nickname').value; //ajax 전송(댓글 작성자 로그인한 사람의 닉네임)
            recomments = document.getElementsByClassName('recomment');

            for(let i=0; i<commentusers.length; i++){
                if(commentNumber == comment_numberInput[i].value){
                    commentWrite.value = '';
            commentWrite.value = '@'+commentusers[i].innerText+' ';
            let tmp = document.all.comment_content.value;
            document.all.comment_content.value = '';
            document.all.comment_content.value = tmp;
            document.all.comment_content.focus();
            
            commentuserNickname = '@'+commentusers[i].innerText+' ';
            comment_number = comment_numberInput[i].value;//댓글 번호(PK)
                }
            
            }
        }
    }
}

/* 댓글, 답글 달기 */
let writeComment = document.getElementById('writeComment');
if(writeComment != null){
    writeComment.addEventListener('click', function(event){
        let board_number = document.getElementById('board_number').value; //ajax 전송
        let member_id = document.getElementById('member_id'); //.value;
        let comment_content = document.getElementById('comment_content').value; //ajax 전송
        let context = document.getElementById('context').value;
        if(member_id==null){
            alert('로그인이 필요한 서비스 입니다.');
        }else if(comment_content=='' || comment_content==commentuserNickname){
            alert('댓글을 입력해주세요');
        }
        else{
            //commentuserNickname 댓글 내용에 있는지 없는지 확인
            //있으면 답댓 없으면 댓글로 처리하기
            if(commentuserNickname != '' && comment_content.startsWith('@')){
                if(member_nickname == null){
                    alert('로그인이 필요한 서비스 입니다.');
                }else{ //답글
                        $.ajax({
                            async: true,
                            type: 'POST',
                            data: JSON.stringify({
                                    comment_number,
                                    member_nickname,
                                    board_number,
                                    comment_content
                                    }),
                            url: "insertReComment", //.do
                            dataType: "json", 
                            contentType: "application/json; charset=UTF-8",
                            success: function(data){
                                if(data.success=='success'){
                                    commentWrite.value = '';
                                    let eachComments = document.getElementsByClassName('eachComment');
                                    let comment_numberInput = document.getElementsByClassName('comment_number');
                                    
                                    for(let i=0; i<comment_numberInput.length; i++){
                                        if(data.comment.comment_group == comment_numberInput[i].value){ 
                                            let div = document.createElement('div');
                                            let comment_depth = document.getElementsByClassName('comment_depth');
                                            div.className = 'recomment';
                                            let addComment = 
                                            "<div class='commentUserInfo'>"+
                                                "<div style='display: none;'>"+
                                                    "<input type='hidden' class='comment_number' value='"+data.comment.comment_number+"'>"+
                                                    "<input type='hidden' class='comment_depth' value='"+data.comment.comment_depth+"'>"+
                                                "</div>"+
                                                "<div>"+
                                                    "<img style='height: 50px; width: 50px;' src='"+context+"/resources/image/member/member.png'>"+
                                                "</div>"+
                                                "<div class='commentUserInfoInner'>"+
                                                    "<span class='commentUserName'>"+data.comment.member_nickname+"</span>"+
                                                    "<span>"+data.comment.comment_write_date+"</span>"+
                                                "</div>"+
                                            "</div>"+
                                            "<div class='userComment'>"+
                                                "<span class='commentContent'>"+data.comment.comment_content+"</span>"+
                                            "</div>"+
                                            "<div class='recommentAndDelete'>"+
                                                "<button class='recommentWrite' onclick='reComment("+data.comment.comment_number+")'>답글달기</button>"+
                                                "<span>|</span>"+
                                                "<button class='commentUpdate' onclick='updateComment()>수정하기</button>"+
                                                "<span>|</span>"+
                                                "<button class='commentDelete' onclick='deleteComment("+data.comment.comment_number+")'>삭제하기</button>"+
                                            "</div>";
                                            div.innerHTML = addComment;
                                            if(comment_depth[i].value == 1){ //부모댓글이 답글이라면
                                                let recomment_number = document.querySelectorAll('.recomment .comment_number');
                                                for(let i=0; i< recomment_number.length; i++){
                                                    if(recomment_number[i].value == data.comment.comment_group){
                                                        recomments[i].after(div);
                                                    }
                                                }
                                            }else{//부모댓글이 일반 댓글이라면 comment에서 일치하는 댓글번호 찾기
                                                let comment_number = document.querySelectorAll('.userCommentDiv .comment_number');
                                                for(let j=0; j<comment_number.length; j++){
                                                    if(comment_number[j].value == data.comment.comment_group){
                                                        eachComments[j].append(div);
                                                    }
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                                else{
                                    alert('댓글이 등록되지 않았습니다.\n다시한번 시도하여 주십시오');
                                }
                            },
                            error: function(request,status,error){
                                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                            
                        });
                }
            }else{
                //댓글
                $.ajax({
                    async: true,
                    type: 'POST',
                    data: JSON.stringify({
                            board_number,
                            member_nickname,
                            comment_content
                            }),
                    url: "insertComment", //.do
                    dataType: "json", 
                    contentType: "application/json; charset=UTF-8",
                    success: function(data){
                        if(data.success=='success'){
                            commentWrite.value = '';
                            let commentList = document.getElementById('commentList');
                            let div = document.createElement('div');
                            div.className = 'eachComment';
                            let addComment = 
                                "<div class='userCommentDiv'>"+
                                    "<div style='display: none;'>"+
                                        "<input type='hidden' class='comment_number' value='"+data.comment.comment_number+"'>"+
                                        "<input type='hidden' class='comment_depth' value='"+data.comment.comment_depth+"'>"+
                                    "</div>"+
                                        "<div class='commentUserInfo'>"+
                                            "<div>"+
                                            "<img style='height: 50px; width: 50px;' src='"+context+"/resources/image/member/member.png'>"+
                                            "</div>"+
                                            "<div class='commentUserInfoInner'>"+
                                            "<span class='commentUserName'>"+data.comment.member_nickname+"</span>"+
                                            "<span>"+data.comment.comment_write_date+"</span>"+
                                            "</div>"+
                                        "</div>"+
                                        "<div class='userComment'>"+
                                            "<span class='commentContent'>"+data.comment.comment_content+"</span>"+
                                        "</div>"+
                                        "<div class='recommentAndDelete'>"+
                                            "<button class='recommentWrite' onclick='reComment("+data.comment.comment_number+")'>답글달기</button>"+
                                            "<span>|</span>"+
                                            "<button class='commentUpdate' onclick='updateComment()'>수정하기</button>"+
                                            "<span>|</span>"+
                                            "<button class='commentDelete' onclick='deleteComment("+data.comment.comment_number+")'>삭제하기</button>"+
                                        "</div>"+
                                    "</div>"+
                                "</div>";
                            div.innerHTML = addComment
                            commentList.append(div);
                        }else{
                            alert('댓글이 등록되지 않았습니다.\n다시한번 시도하여 주십시오');
                        }
                    },
                    error: function(request,status,error){
                        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                    
                });
            }
            
        } 
    })
}

/* 댓글 수정 */
function updateComment(commentNumber){
    let updateText = document.getElementById('updateText');
    
    let updateButton = document.querySelectorAll(".commentUpdate")
    let userComment = document.getElementsByClassName('userComment');
    let commentContent = document.getElementsByClassName('commentContent');
    let comment_number = document.getElementsByClassName('comment_number');

    if(updateText != null){
        alert('수정 중인 댓글의 저장하기를 눌러주세요.');
    }else{
        for(let i=0; i<comment_number.length; i++){
            if(comment_number[i].value == commentNumber){
                let gap = 0;
                if(comment_number.length>updateButton.length){
                    gap = comment_number.length-updateButton.length; // -1
                }
                let textarea = document.createElement('textarea');
                textarea.style.height = '2.4375em';
                textarea.style.width = '100%';
                textarea.style.border = '0.1em solid black';
                textarea.style.borderRadius = '0.5em';
                textarea.style.lineHeight = '1.15';
                textarea.style.cursor = 'text';
                textarea.id = 'updateText';
                textarea.value = userComment[i].innerText;
                userComment[i].replaceChild(textarea, commentContent[i]);

                let button = document.createElement('button');
                button.setAttribute('onclick','updateSave('+comment_number[i].value+', '+i+')');
                button.innerText = '저장하기'
                button.id = 'saveButton';
                if(i-gap<0){
                    updateButton[i-gap+1].replaceWith(button);
                }else{
                    updateButton[i-gap].replaceWith(button);
                }
                
            }
        }
    }
    
}

function updateSave(comment_number, index){
    let comment_content = document.getElementById('updateText').value;

    $.ajax({
        async: true,
        type: 'POST',
        data: JSON.stringify({
                comment_number,
                comment_content
                }),
        url: "updateComment",  //.do
        dataType: "json", 
        contentType: "application/json; charset=UTF-8",
        success: function(data){
            if(data.success=='success'){
                let userComment = document.getElementsByClassName('userComment');
                let span = document.createElement('span');
                span.className = 'commentContent';
                span.innerHTML = comment_content;
                let updateText = document.getElementById('updateText');
                userComment[index].replaceChild(span, updateText);

                let saveButton = document.getElementById('saveButton');
                let button = document.createElement('button');
                button.innerText = '수정하기'
                button.className = 'commentUpdate';
                button.setAttribute('onclick','updateComment()');
                saveButton.replaceWith(button);
            }
        },
        error: function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

/* 댓글삭제 */
function deleteComment(comment_number){
    if(confirm('댓글을 삭제하시겠습니까?')){
        $.ajax({
            async: true,
            type: 'POST',
            data: JSON.stringify({
                    comment_number
                    }),
            url: "deleteComment", //.do
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){
            if(data.success == 'haveReComment'){
                let inputCommentNumber = document.getElementsByClassName('comment_number');
                let commentContent = document.getElementsByClassName('commentContent');
                Array.from(inputCommentNumber).forEach((el,index)=>{
                    if(el.value == comment_number){
                        commentContent[index].innerText = '삭제된 댓글입니다.';
                    }
                });
                
            }else if(data.success == 'successDelete'){
                let commentNumbers = document.querySelectorAll('.userCommentDiv .comment_number');
                let reCommentNumbers = document.querySelectorAll('.recomment .comment_number');
                let userCommentDiv = document.getElementsByClassName('userCommentDiv');
                let recomment = document.getElementsByClassName('recomment');
                for(let i=0; i<commentNumbers.length; i++){
                    if(commentNumbers[i].value == comment_number){
                        userCommentDiv[i].remove();
                    }
                };
                for(let j=0; j<reCommentNumbers.length; j++){
                    if(reCommentNumbers[j].value == comment_number){
                        recomment[j].remove();
                    }
                };
            }
            },
            error: function(request,status,error){
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
}