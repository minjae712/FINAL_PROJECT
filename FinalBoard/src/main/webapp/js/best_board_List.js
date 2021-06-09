
function getBestBoard(){
	    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestList.do",
        success : function(data){
        	var str = "";
        	$("#best").html("");
        	$.each(data,function(idx,item){
        		str += "<td>" + (idx + 1) + "</td>";
        		str += "<td><a href='getBoard.do?no=" + item.no +"'>"+ item.title + "</a></td>";
    			str += "<td>" + item.writer + "</td>";
    			str += "<td>" + item.cnt + "</td>";
        	$("#best").html(str);
        	});
        },
        
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}
