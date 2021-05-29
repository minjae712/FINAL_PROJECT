
function getC_Mood(){
	
	$.ajax({
        type : "POST",
        dataType : "json",
        url : "getCommentMood.do",
        data : {"no" :b_num},
        success : function(data){
        	var str1 = "";
        	var str2 = "";
        	
        	$.each(data,function(idx,item){
        		str1 = "";
        		str2 = "";
        		str1 += "추천" + item.good;
        		str2 += "반대" + item.bad;
        	$("#C_good" + idx).html(str1);
        	$("#C_bad" + idx).html(str2);
        	});
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}

function getB_Mood(){
	
	$.ajax({
        type : "POST",
        dataType : "json",
        url : "getBoardMood.do",
        data : {"no" :b_num},
        success : function(data){
        	var str1 = "";
        	var str2 = "";
        	$.each(data,function(idx,item){
        		str1 += "추천" + item.good;
        		str2 += "반대" + item.bad;
        	$("#B_good" + b_num).html(str1);
        	$("#B_bad" + b_num).html(str2);
        	});
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}


function getCommentList(){
    
    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getCommentList.do",
        data : {"no" :b_num},
        success : function(data){
        	alert("통신성공" + data);
            var str="";
            $(".commentList").html("");
            $.each(data,function(idx,item){
            	str += "<div class='modify_" + idx +"'>";
            	str += "<div>";
            	str += "<div><b>" + item.writer + "</b>";
            	str += "<div align='right'><a id='C_good"+ idx +"' class='glyphicon glyphicon-thumbs-up' onclick='c_checkGoodOrBad("+ item.commentNo + ","+ 1 + ","+ 0 + ")'>추천</a>&nbsp;&nbsp";
            	str += "<a id='C_bad"+ idx +"' class='glyphicon glyphicon-thumbs-down' onclick='c_checkGoodOrBad("+ item.commentNo + ","+ 0 + ","+ 1 + ")'>반대</a>";
            	str += "</div></div></div>";
            	str += "<div>" + item.content + "</div>";
            	str += "<div><small>" + item.regDate + "</small></div>";
            	str += "<div align='right'>";
            	if(item.writer == name) {
            		str += "<a onclick='textAreaSet("+ idx + "," + item.commentNo + ","+ item.no + ")'>[수정]</a>";
            		str += "<a onclick='deleteComment("+ item.commentNo + ","+ item.no + ")'>[삭제]</a>";
            	};
            	str += "</div><hr></div>";
                  });
            $(".commentList").append(str);
            getC_Mood();

        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function getBestList(){
    
    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestCommentList.do",
        data : {"no" :b_num},
        success : function(data){
            var str="";
            $(".bestComment").html("");
            $.each(data,function(idx,item){
            	str += "<div>";
            	str += "<span id='rank"+ idx +"'></span>";
            	str += "<div><b>" + item.writer + "</b>";
            	str += "<div align='right'>";
            	str += "</div></div>";
            	str += "<div>" + item.content + "</div>";
            	str += "<div><small>" + item.regDate + "</small></div>";
            	str += "<div align='right'>";
            	str += "</div><hr></div>";
                  });
            $(".bestComment").append(str);
            $.each(data,function(idx,item){
            	attachRank(idx,item.good);
            });

        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function getCommentCount(){
	
	$.ajax({
        type : "POST",
        dataType : "text",
        url : "getCommentCount.do",
        data : {"no" :b_num},
        success : function(data){
        	$(".count").html(data);
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }

	});
	
}

function insertComment() {
	
		
		var num = $("#no").val();
		var writer = $("#writer").val();
		var content = $("#content").val();
		
		
		var comment = {
				"no" : num,
				"writer" : writer,
				"content" : content
		};
		$.ajax({
	        type : "POST",
	        dataType : "text",
	        url : "insertComment.do",
	        data : comment,
	        success : function(data){
	        	getCommentCount();
	        	getCommentList();
	        },
	        error : function(request,status,error){
	            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }

		});


}
	
function deleteComment(commentNo,no) {
	var Comment1 = commentNo;
	var Comment2 = no;
	var com = {
			"commentNo" : Comment1,
			"no" : Comment2
	};
	
	$.ajax({
        type : "POST",
        dataType : "text",
        url : "deleteComment.do",
        data : com,
        success : function(data){
        	getCommentCount();
        	getCommentList();
        	getBestList();
        	getB_Mood();
        	
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }

	});

	
}
	
function updateComment(commentNo,no) { 
	
	var Comment1 = commentNo;
	var Comment2 = no;
	var content = $("#mod").val();
	var com = {
			"commentNo" : Comment1,
			"no" : Comment2,
			"content" : content
	};
	
	$.ajax({
        type : "POST",
        dataType : "text",
        url : "updateComment.do",
        data : com,
        success : function(data){
        	modifying = 0;
        	getCommentCount();
        	getCommentList();
        	getBestList();
        	getB_Mood();
        	
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}

function textAreaSet(idx,commentNo,no) { 

	if(modifying == 1){
		return;
	}
	
	var Comment1 = commentNo;
	var Comment2 = no;
	var com = {
			"commentNo" : Comment1,
			"no" : Comment2
	};
	
	$.ajax({
        type : "POST",
        dataType : "json",
        url : "textAreaSet.do",
        data : com,
        success : function(data){
        	var str = "";
        	str += "<div>";
        	str += "<div><b>" + data.writer + "</b></div></div>";
        	str += "<textarea rows='3' cols='100' name='mod' id='mod' class='form-control'>" + data.content + "</textarea>";
        	str += "<div><small>" + data.regDate + "</small></div>";
        	str += "<div align='right'>";
        	str += "<button class='btn btn-default' onclick='updateComment("+ commentNo + ","+ no + ")'>수정완료</button>";
        	str += "</div><hr>";
            $(".modify_"+ idx).html(str);
            modifying = 1;
        	
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}

function c_checkGoodOrBad(commentNo,good,bad) {
	var com = {
			"commentNo" : commentNo,
			"no" : b_num,
			"good" : good,
			"bad" : bad
	};
	
	$.ajax({
        type : "POST",
        dataType : "text",
        url : "c_goodOrBad.do",
        data : com,
        success : function(data){
        	getBestList();
        	getC_Mood();
        	
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});

	
}

function b_checkGoodOrBad(good,bad) {
	var com = {
			"no" : b_num,
			"good" : good,
			"bad" : bad
	};
	
	$.ajax({
        type : "POST",
        dataType : "text",
        url : "b_goodOrBad.do",
        data : com,
        success : function(data){
        	getB_Mood();
        	
        },
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});

	
}

function attachRank(idx,good){ 
	var str = "&nbsp;<b style='color: red;'>Best "+ (idx + 1) +"등 - </b><b> 추천수 :" + good + "</b>";
	$("#rank" + idx ).html(str);
}
