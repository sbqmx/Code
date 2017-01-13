function msg(m){
	document.getElementById("stoor").innerHTML=m;
}

function getD(){
	document.getElementById("date").innerHTML=new Date();
}

function showImgAlt(element){
	document.getElementById("img-alt").innerHTML=element.alt;
	changeBG(element.src);
}

function changeBG(uri){
	document.body.style.backgroundImage="url("+uri+")";
}

function recover(){
	document.getElementById("img-alt").innerHTML="鼠标悬停在图片上时此处显示图片说明，且页面背景更换为该图";
}