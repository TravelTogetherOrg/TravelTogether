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
            if(boardSelectRegion[j].style.background = 'cornflowerblue'){
                boardSelectRegion[j].style.background = 'white';
                boardSelectRegion[j].style.color = 'black';
            }
        };
        boardSelectRegion[i].style.background = 'cornflowerblue';
        boardSelectRegion[i].style.color = 'white';

        /* 지역 선택시 해당지역 축제 리스트로 바뀌게*/
        let divs = document.getElementsByTagName('div');
        for(let k=0; k<divs.length; k++){
            if(divs[k].id.startsWith(boardSelectRegion[i].id)){
                divs[k].style.display='block';
            }
            else if(divs[k].id.endsWith('Festival')){
                divs[k].style.display='none';
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
            if(festivals[j].style.color = 'cornflowerblue'){
                festivals[j].style.color = 'black';
            }
        }
        festivals[i].style.color = 'cornflowerblue';
    });
}

<<<<<<< HEAD
/* 1박 이상 선택시 input date 추가 */
let moreDaysCheckbox = document.getElementById('moreDays');
let lastDayInput = document.getElementById('lastDay');
moreDaysCheckbox.addEventListener('click', function(event){
    if(moreDaysCheckbox.checked){
        lastDayInput.style.display='block';
    }
    else{
        lastDayInput.style.display='none';
    }
});
=======
>>>>>>> 3506a521a2798a0399b8455e5d50d997475e05f6

