function checkPwd(){
	var inputPwd = document.getElementById('input-password');
	var inputPwdAgain = document.getElementById('input-password-again');

	if(inputPwdAgain.value != inputPwd.value){
		alert("两次输入的密码不一致");
	}
}