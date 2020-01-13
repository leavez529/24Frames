

// var sub_btn = document.getElementById("SubmitButton");
var tag_cover = document.getElementById("imgcover");
var tag_back = document.getElementById("imgbackground");
var name_input = document.getElementById("TagName");
var desc_input = document.getElementById("Description");


var resultarr = new Array();
var chosedmovies = "";
var coverurl = "";
var backgroundurl = "";


var APP_ID = 'vVtVvfIeMbVP12F3Ryg6SSXr-gzGzoHsz';
var APP_KEY = 'x0z77TDQrddyN4PfVh9LV1hn';

AV.init({
    appId: APP_ID,
    appKey: APP_KEY
});

function submitTag (uid) {
    if (backgroundurl && coverurl) {
        $.ajax({
            type: 'POST',
            url: '/submitTag',
            data: {
                userId: uid,
                tagname: name_input.value,
                description: desc_input.value,
                movies: chosedmovies,
                cover_url: coverurl,
                background_url: backgroundurl
            },
            complete: function () {
                console.log('finish');
            }
        });
        window.location.reload();

    }
}

function submitCover() {
    var fileUploadControl = $('#TagCover')[0];
    if (fileUploadControl.files.length > 0) {
        var localFile = fileUploadControl.files[0];
        var name = localFile.name;

        var file = new AV.File(name, localFile);
        file.save().then(function (file) {
            // 文件保存成功
            coverurl = file.url();
            tag_cover.src = coverurl;
        }, function (error) {
            // 异常处理
            console.error(error);
        });
    }
}

function submitBackground() {
    var fileUploadControl = $('#TagBackground')[0];
    if (fileUploadControl.files.length > 0) {
        var localFile = fileUploadControl.files[0];
        var name = localFile.name;

        var file = new AV.File(name, localFile);
        file.save().then(function (file) {
            // 文件保存成功
            backgroundurl = file.url();
            tag_back.src = backgroundurl;
        }, function (error) {
            // 异常处理
            console.error(error);
        });
    }
}


function searchMovie() {
    var key = document.getElementById('key').value;
    if (key != null || key !== '') {
        $.ajax({
            type: 'POST',
            data: {
                key: key
            },
            url: '/searchFromTag',
            success: function (data) {
                var result = JSON.parse(data);
                // alert(result);
                document.getElementById("result-list").innerHTML = "";
                resultarr = [];
                for (var i = 0; i < result.length; i++) {
                    var name = result[i]['name'];
                    resultarr.push({
                        'name': name,
                        'id': result[i]['id']
                    });
                    var itemtext = "<li class=\"hjr-result-list-item\" onclick='choseResult(" + i + ")'><span>" + name + "</span></li>";
                    document.getElementById("result-list").innerHTML += itemtext;
                }
            }
        })
    }
}


function choseResult(index) {
    console.log('123213213');
    var element = "<span>\n" +
        "<label>" + resultarr[index]['name'] + "</label>" + "<a><i class=\"large trash icon\"></i></a></span>";
    $('#results').append(
        element
    );
    chosedmovies += resultarr[index]['id'].toString() + "=";
}

function addTag(uid, tid) {
    // alert("addTag");
    $.ajax({
        type: 'POST',
        url: '/addTag',
        data: {
            userId: uid,
            tagId: tid
        },
        complete: function () {
            // alert("complete");
            window.location.href = '/mytags?id=' + uid;
        }
    })
}