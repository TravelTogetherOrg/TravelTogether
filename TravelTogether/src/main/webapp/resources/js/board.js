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
        console.log(findRegion.value);
        let region = findRegion.value;
        $.ajax({
            async: true,
            type: 'POST',
            data: region,
            url: "getRegionFestivals.do",
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){
                console.log(data);
                console.log(data.festivals[0].festival_name);
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
                
                findFestivals.addEventListener('change', function(event){
                    console.log(findFestivals.value);
                });
                
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
            location.href = contextPath+'/boardList.do';
        }else{
            document.findForm.submit();
        }
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
/* 페이징 */
/* 해당 페이지 번호 표시, 클릭한 페이지로 이동 */
let pageButton = document.querySelectorAll('#pageNumbers button');
pageButton.forEach((el)=>{
    if(el.className == 'pageItemActive'){
        el.style.color = 'rgb(192, 228, 255)';
    }
    el.addEventListener('click', function(event){
        console.log(el.innerHTML);
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
        console.log(boardSelectRegion[i].getAttribute('id'));
        let selectRegion = boardSelectRegion[i].getAttribute('id');
        $.ajax({
            async: true,
            type: 'POST',
            data: selectRegion,
            url: "getRegionFestivals.do",
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){
            console.log(data);
            console.log(Object.keys(data.festivals).length);
            //console.log(Object.keys(data.festivals)[1].festival_name);
            console.log(data.festivals[0].festival_name);
            console.log('축제div '+document.getElementById(selectRegion+'Festival'));
            console.log('축제div '+ !document.getElementById(selectRegion+'Festival'));
            
            if(!document.getElementById(selectRegion+'Festival')){ //null인 경우
                let selectFestival = document.getElementById('selectFestivalByRegion');
                console.log(selectFestival);  
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
                console.log(document.getElementsByClassName('tr'+selectRegion));
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
            //else{
                /* 다른 지역 선택시 기존에 선택했던 지역축제div 안보이게하기*/
                let divs = document.getElementsByTagName('div');
                console.log(divs.length);
                for(let k=0; k<divs.length; k++){
                    //selectRegion+'Festival'
                    
                    console.log(divs[k].id+': '+divs[k]);
                    console.log(boardSelectRegion[i].id+': '+boardSelectRegion[i]);
                    if(divs[k].id.startsWith(boardSelectRegion[i].id)){
                        divs[k].style.display='block';
                    }
                    else if(divs[k].id.endsWith('Festival')){
                    console.log(divs[k].id+' else: '+divs[k]);
                        divs[k].style.display='none';
                    }
                    // 지역 전환시 클릭했던 축제 색 초기화 
                    let festivals = document.getElementsByClassName('festival');
                    for(let j=0; j<festivals.length; j++){
                        festivals[j].style.color = 'black';
                    }
                    
                }
            //}
            
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
                    console.log(festivals[i].innerHTML); //축제명
                    festival_name = festivals[i].innerHTML;
                    document.boardForm.festival_name.value = festivals[i].innerHTML;
                    data.festivals.forEach((el,index)=>{
                        if(data.festivals[index] != 'undefined' && data.festivals[index] != null){
                            if(festivals[i].innerHTML==el.festival_name){
                                console.log(el.festival_startdate);
                                console.log(el.festival_enddate);
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

/* 축제 선택시  */
/* 1박 이상 선택시 input date 추가 */
let moreDaysCheckbox = document.getElementById('moreDays');
let lastDayInput = document.getElementById('lastDay');
if(moreDaysCheckbox != null){
	console.log(moreDaysCheckbox.checked);
	//수정시 end_date가 있으면 보이게 설정
	    if(moreDaysCheckbox.checked){
	        lastDayInput.style.display='block';
	        end_date.setAttribute('required',true);
	    }

    moreDaysCheckbox.addEventListener('click', function(event){
        let end_date = document.getElementById('end_date');
        
        if(moreDaysCheckbox.checked){
            lastDayInput.style.display='block';
            end_date.setAttribute('required',true);
        }
        else{
        	//console.log(end_date.value);
        	//end_date.value = '2023-07-18';
        	//console.log(end_date.value);
        	end_date.value = ''
            lastDayInput.style.display='none';
            end_date.setAttribute('required',false);
            
            
        }
        console.log(end_date.required); // 수정시 1박이상을 해제해도 계속 required 상태,,왜?
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
        //inputImage.files[0];
        let fileReader = new FileReader();
        fileReader.readAsDataURL(selectedFile[0]);
        fileReader.onload = function () {
            //document.getElementById("previewImg").src = fileReader.result;
            writeImageInfo[0].style.backgroundImage = 'url('+fileReader.result+')';
        };
    }
    inputImage.addEventListener("change", handleFiles);
}
 

//게시글 작성 limit확인
function limitCheck(){
    //아이디랑 축제명 넘기기
    let member_id = $("#inputId").val();
    console.log(member_id);
    console.log(festival_name);
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
        url: "limitCheck.do",
        dataType: "json", 
        contentType: "application/json; charset=UTF-8",
        success: function(data){
        console.log(data);
            if(data.limit==3){ /*3회 이상 작성한 경우*/
                alert('해당 축제의 게시글을 3회이상 작성하였습니다. 기존 게시글을 삭제하시고 다시 작성해주세요');
            }
            else{ 
                document.boardForm.submit();
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
    /*alert('지원하지 않습니다.');*/

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

            console.log('댓글개수 확인'+commentusers.length);
            console.log('댓글개수 확인'+recommentbuttons.length);
            console.log('댓글개수 확인'+comment_numberInput.length);
            console.log('댓글개수 확인'+recomments.length);

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
                }else{
                    //member_nickname = document.getElementById('member_nickname').value;
                    console.log('답글');
                        $.ajax({
                            async: true,
                            type: 'POST',
                            data: JSON.stringify({
                                    comment_number,
                                    member_nickname,
                                    board_number,
                                    comment_content
                                    }),
                            url: "insertReComment.do",
                            dataType: "json", 
                            contentType: "application/json; charset=UTF-8",
                            success: function(data){
                                console.log(data);
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
                                            }else{//부모댓글이 일반 댓글이라면
                                                eachComments[i].append(div);
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
                console.log('댓글');
                $.ajax({
                    async: true,
                    type: 'POST',
                    data: JSON.stringify({
                            board_number,
                            member_nickname,
                            comment_content
                            }),
                    url: "insertComment.do",
                    dataType: "json", 
                    contentType: "application/json; charset=UTF-8",
                    success: function(data){
                        console.log(data);
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
let updateButton = document.getElementsByClassName('commentUpdate');
//if(updateButton != null){
function updateComment(){
    updateButton = document.getElementsByClassName('commentUpdate'); //수정하고 버튼이 저장 -> 수정으로 바뀌고 다시 조회?하기
    let userComment = document.getElementsByClassName('userComment');
    let commentContent = document.getElementsByClassName('commentContent');
    let comment_number = document.getElementsByClassName('comment_number');
    for(let i=0; i<updateButton.length; i++){
        updateButton[i].addEventListener('click', function(){
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
            updateButton[i].replaceWith(button);
        })
    }
}
    
//}

function updateSave(comment_number, index){
    let comment_content = document.getElementById('updateText').value;

    $.ajax({
        async: true,
        type: 'POST',
        data: JSON.stringify({
                comment_number,
                comment_content
                }),
        url: "updateComment.do",
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
            url: "deleteComment.do",
            dataType: "json", 
            contentType: "application/json; charset=UTF-8",
            success: function(data){
                console.log(data.success);
            if(data.success == 'haveReComment'){
                let inputCommentNumber = document.getElementsByClassName('comment_number');
                let commentContent = document.getElementsByClassName('commentContent');
                Array.from(inputCommentNumber).forEach((el,index)=>{
                    if(el.value == comment_number){
                        commentContent[index].innerText = '삭제된 댓글입니다.';
                    }
                });
                
            }else if(data.success == 'successDelete'){
                //let inputCommentNumber = document.getElementsByClassName('userCommentDiv');
                let commentNumbers = document.querySelectorAll('.userCommentDiv .comment_number');
                let reCommentNumbers = document.querySelectorAll('.recomment .comment_number');
                let userCommentDiv = document.getElementsByClassName('userCommentDiv');
                let recomment = document.getElementsByClassName('recomment');
                console.log(comment_number);
                console.log(commentNumbers);
                console.log(reCommentNumbers);
                for(let i=0; i<commentNumbers.length; i++){
                    //댓글번호가 같은 div를 지워야함,, 
                    console.log('댓글: '+commentNumbers[i].value);
                    if(commentNumbers[i].value == comment_number){
                        console.log('댓글일치');
                        userCommentDiv[i].remove();
                    }
                };
                for(let j=0; j<reCommentNumbers.length; j++){
                    console.log('대댓글: '+reCommentNumbers[j].value);
                    if(reCommentNumbers[j].value == comment_number){
                        console.log('대댓글일치');
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