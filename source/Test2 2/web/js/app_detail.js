window.addEventListener('load',()=>{
	imgLocation('movie-pic-box');
	setFilterPic();
	//var floatButton = document.getElementById("float-button");
	//floatButton.onclick = showMusic;
	
});

window.addEventListener('resize',()=>{
	imgLocation('movie-pic-box');
});

var picParent = document.getElementById("movie-pic-waterfall");

const imgLocation = (child) =>{
	const picContent = getChilds(child);
	const imgWidth = picContent[0].offsetWidth;
	const num = ~~(picParent.clientWidth / imgWidth);
	
	

	const lineHeightArr = [];
	[].map.call(picContent,(current,index) =>{
		if(index < num){
			lineHeightArr.push(	current.offsetHeight);
		}else{
			const minHeight = Math.min(...lineHeightArr);
			const minHeightIndex = getMinHeightIndex(minHeight,lineHeightArr);
			current.style.position = 'absolute';
			current.style.top = minHeight + 5 + 'px';
			current.style.left = picContent[minHeightIndex].offsetLeft  + 'px';
			lineHeightArr[minHeightIndex] += (current.offsetHeight + 5);
		}
	});

	picParent.style.cssText = 'height:' +  Math.max(...lineHeightArr) + 'px; ';
}
const getChilds = (child) =>{
	const childArr = [];
	const tgasAll = picParent.getElementsByTagName('*');
	[].map.call(tgasAll,(current)=>{
		if(current.className == child){
			childArr.push(current);
		}
	});
	return childArr;
}
const getMinHeightIndex = (minHeight,lineHeightArr) =>{
	for(var i in lineHeightArr){
		if(lineHeightArr[i] == minHeight){
			return i;
		}
	}
}
const showMusic = () =>{
	var musicLayout = document.getElementById("movie-music");
	var fade = document.getElementById("fade");
	musicLayout.style.display = 'block';
	fade.style.display = 'block';
}
const changeZanPic =(img) =>{
	console.log();
	if(img.src.indexOf("zan.png")!= -1){
		img.src = 'img/imgLYK/zaned.png';
	}else{
		img.src = 'img/imgLYK/zan.png';
	}
	//img.src = 'img/zaned.png';
}

const changeLovePic =(img) =>{
	console.log();
	if(img.src.indexOf("love.png")!= -1){
		img.src = 'img/imgLYK/loved.png';
	}else{
		img.src = 'img/imgLYK/love.png';
	}
	//img.src = 'img/zaned.png';
}

const setAudioPlaySrc = (musicAddress) =>{
	var audioPlay = document.getElementById("audio-player");
	audioPlay.src = musicAddress;
	audioPlay.play();
}

var floatButtons = document.getElementById('float-buttons');
var floatMusic = document.getElementById('float-button-music');
var floatComment = document.getElementById('float-button-comment');

const showFloatButtons =() =>{
	floatMusic.style.display = 'block';
	floatComment.style.display = 'block';
}

const hideFloatButtons = () =>{
	floatMusic.style.display = 'none';
	floatComment.style.display = 'none';
}
const setFilterPic = () =>{
	var movieBackgrooundFilter = document.getElementById('movie-backgroound-filter');
	var moviePoster = document.getElementById('movie-poster');
	var movieBackground = document.getElementById('movie-background');

	//movieBackgrooundFilter.style.cssText = 'top:' + movieBackground.offsetTop +'px';
	movieBackgrooundFilter.style.cssText = 'height:' +( movieBackground.offsetHeight + 100 ) +  'px';
}