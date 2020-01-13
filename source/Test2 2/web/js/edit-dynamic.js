var picList = document.getElementById('pic-list');
var selectPicBtn = document.getElementById('send-dynamic-button');
var submitBtn = document.getElementById('submit-btn');
var dynamicInput = document.getElementById('edit-dynamic-input');
window.addEventListener('load',()=>{


	
});

var APP_ID = 'vVtVvfIeMbVP12F3Ryg6SSXr-gzGzoHsz';
var APP_KEY = 'x0z77TDQrddyN4PfVh9LV1hn';
var selected_images = "";

AV.init({
    appId: APP_ID,
    appKey: APP_KEY
});

function uploadImageFile(Imagefile) {
	console.log(Imagefile.name);
	var file = new AV.File(Imagefile.name, Imagefile);
	file.save().then(function (file) {
		// 文件保存成功
		cloudurl = file.url();
		selected_images += cloudurl + " ";
	}, function (error) {
		console.error(error);
	});
}

function submitdynamic(uid) {
	var describtion = dynamicInput.value;
	console.log(selected_images);
	$.ajax({
		type: 'POST',
		url: '/moment',
		data: {
			userId: uid,
			images: selected_images,
			content: describtion
		},
		complete: function () {
			location.reload();
		}
	})
}

function showPic(input){

	var picNum = document.getElementById('pic-num');
	
	console.log(parseInt(picNum.innerText) + 1);
	
	//var id = document.getElementById('i');
	//id.style.cssText = ' background:url(' + picAddress + ');';

	var imgDiv = document.createElement('div');
	imgDiv.classList.add("pic-showed-div");

	var img = document.createElement("img");
	img.classList.add("pic-showed");
	

	imgDiv.appendChild(img);
	


	var file = input.files[0];
	var reader = new FileReader();
	var imgFile ;
	uploadImageFile(file);

	reader.onload = function(e){
		imgFile = e.target.result;
		img.src = imgFile;
		picList.appendChild(imgDiv);
		img.addEventListener('click',function(){
			removeMe(imgDiv);
			picNum.innerText = picList.getElementsByTagName("img").length;

		})
		console.log(input.value);
		input.value= '';
		picNum.innerText = picList.getElementsByTagName("img").length;
		if(picNum.innerText == '5'){
			selectPicBtn.style.cssText = 'display:none;';
		}
		//id.style.cssText += ' background:url(' + imgFile + ');';
	}

	reader.readAsDataURL(file);
	
}

function removeMe(img){
	
	picList.removeChild(img);
	selectPicBtn.style.cssText = 'display:inline-block;';
}

