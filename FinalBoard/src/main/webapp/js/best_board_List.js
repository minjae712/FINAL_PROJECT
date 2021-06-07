
function getBestBoard(){
	
	    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestList.do",
        success : function(data){
        	var str = "";
        	$("#best").html("");
        	$.each(data,function(idx,item){
    			str += "<div><table style='font-size:10px;' width='20%'>";
    			str += "<tr><td ><a href='getBoard.do?no= " + item.no +"'>"+ item.title + "</td>";
    			str += "<td >" + item.writer + "</td>";
    			str += "<td >" + item.cnt + "</td></tr></table><div>";
        	$("#best").html(str);
        	});
        },
        
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}


