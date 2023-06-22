let col = document.getElementsByClassName("coL");
let middleHover = document.getElementsByClassName("middleHover");

for(let i=0;i<col.length;i++){
    col[i].addEventListener("mouseover", function(event){
        middleHover[i].style.display = 'block';
    })
    col[i].addEventListener("mouseout", function(event){
        middleHover[i].style.display = 'none';
    })
}