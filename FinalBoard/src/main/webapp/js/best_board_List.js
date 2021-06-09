
function getBestBoard(){
	    $.ajax({
        type : "POST",
        dataType : "json",
        url : "getBestList.do",
        success : function(data){
        	$("#best_data").html("");
        	var str1 = "";
        	var str2 = "";
        	str1 += "<tr><td width='100'>순위</td>";
			str1 += "<td width='400'>제목</td>"
			str1 += "<td width='100'>작성자</td>"
			str1 += "<td width='100'>조회수</td></tr>"
        	$.each(data,function(idx,item){
        		str1 += "<tr class='warning' id='best"+ idx +"'";
        		str1 += "</tr>";
        	});
			$("#best_data").html(str1);
        	$.each(data,function(idx,item){
        		str2 = "";
        		str2 += "<td>" + (idx + 1) + "</td>";
        		str2 += "<td><a href='getBoard.do?no=" + item.no +"'>"+ item.title + "</a></td>";
        		str2 += "<td>" + item.writer + "</td>";
        		str2 += "<td>" + item.cnt + "</td>";
        		$("#best"+idx).append(str2);
        	});
        },
        
        error : function(request,status,error){
            alert("통신실패 - " + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}
