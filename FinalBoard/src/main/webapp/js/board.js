
function getBestList(){
	
	$.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestList.do",
        success : function(data){
        	
        	var str = "";
        	$.each(data,function(idx,item){
        		
    			
    			str += "<center><table>";
    			str += "<tr><td width='50'><a href='getBoard.do?no= " + item.no +"'> " + item.no + "</td>"; 
    			str += "<td width='150'><a href='getBoard.do?no= " + item.no +"'>"+ item.title + "</td>";
    			str += "<td width='80'>" + item.writer + "</td>";
    			str += "<td width='100'>" + item.regDate + "</td>";
    			str += "<td width='50'>" + item.cnt + "</td></tr></table><center>";
        	$("#bestList").html(str);
        	});
        },
        
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}