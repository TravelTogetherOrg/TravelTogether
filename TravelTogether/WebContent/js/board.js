/* boardList */
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


/* boardWrite */
/* 지역td 선택시 bg/color 바뀌게 */
let regions = document.querySelectorAll('#regions td');
regions.forEach((el)=>{
    el.className='region';
});
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
        /*boardSelectRegion[i].style.color = 'white';*/

        /* 지역 선택시 해당지역 축제 리스트로 바뀌게*/
        let divs = document.getElementsByTagName('div');
        for(let k=0; k<divs.length; k++){
            if(divs[k].id.startsWith(boardSelectRegion[i].id)){
                divs[k].style.display='block';
            }
            else if(divs[k].id.endsWith('Festival')){
                divs[k].style.display='none';
            }
            /* 지역 전환시 클릭했던 축제 색 초기화 */
            for(let j=0; j<festivals.length; j++){
                festivals[j].style.color = 'black';
            }
        }
    })
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
    });
}

/* 1박 이상 선택시 input date 추가 */
let moreDaysCheckbox = document.getElementById('moreDays');
let lastDayInput = document.getElementById('lastDay');
if(moreDaysCheckbox != null){
    moreDaysCheckbox.addEventListener('click', function(event){
        if(moreDaysCheckbox.checked){
            lastDayInput.style.display='block';
        }
        else{
            lastDayInput.style.display='none';
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

    map.src="https://www.openstreetmap.org/export/embed.html?bbox="+
    (parseFloat(lon)-0.003)+"%2C"+(parseFloat(lat)-0.003)+"%2C"+
    (parseFloat(lon)+0.003)+"%2C"+(parseFloat(lat)+0.003);
    //%2C == ,
    //줌: -0.003, +0.003 숫자 변경으로 가능
    //정확도가 이상하게 안맞음

}

let boardImage = document.getElementById('boardImage');
let boardMap = document.getElementById('boardMap');
boardImage.addEventListener('mouseover', function(event){
    boardMap.style.display='block';
});
boardImage.addEventListener("mouseout", function(event){
    boardMap.style.display='none';
});