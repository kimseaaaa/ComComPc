$(document).ready(function(){
  $('.carousel').slick({
    slidesToShow: 4,
    slidesToScroll : 1,
    dots:false,
    centerMode: false,
    draggable : true 	//드래그 가능 여부 
    });
});


// 처음에 페이지 하단으로 스크롤 위치 지정
window.onload = () => {
  window.scrollTo({ top: document.body.scrollHeight });  
}


function cartadd(obj) {
	let fcode = obj.dataset.value;
   
   $.ajax({
      url: "ajaxcartadd.do",
      type: "post",
      data: { "orderfoodcode": fcode },
      dataType : 'json', 
      success:cartview,
      error: function () {
         alert("에러!!!!!!!!!");
      }
      
   });

}
	
	
function cartminus(obj) {
	let fcode = obj.dataset.value;
   
   $.ajax({
      url: "ajaxCartMinus.do",
      type: "post",
      data: { "orderfoodcode": fcode },
      dataType : 'json', 
      success:cartview,
      error: function () {
         alert("에러!!!!!!!!!");
      }
      
   });

}	
	
function cartDelete(obj) {
	let fcode = obj.dataset.value;
   
   $.ajax({
      url: "ajaxCartDelete.do",
      type: "post",
      data: { "orderfoodcode": fcode },
      dataType : 'json', 
      success:cartview,
      error: function () {
         alert("에러!!!!!!!!!");
      }
      
   });

}		

function cartview (result){
	let html="" ;
	let pri=0;

	 $.each(result, function(key, value){ 
			html +="<li class='list'><div class='ordermenu'>";
			html +="<div style='margin-left: 0px;margin-right: 10px;font-size:13px ;line-height: 20px;'>";
			html += "<a href='javascript:void(0);' data-value='"+value.fcode+"' style='color:#cdcdcd;' onclick='cartminus(this)'><i class='fa fa-minus-square'></i></a></div>";
			html += "<div class='qty'>"+ value.fodqty+" </div> ";
			html += "<div style='margin-left: 10px;margin-right: 20px;font-size:13px;line-height: 20px;'>" ;
			html += "<a href='javascript:void(0);' data-value='"+value.fcode+"' style='color:#cdcdcd;' onclick='cartadd(this)'><i class='fa fa-plus-square'></i></a></div></div>";
			html += "<div class='name'>"+value.fname+" </div>" ;
			html += "<div class='money'><input type='hidden' value='"+value.fodpri+"' class='pri'/> "+value.fodpri+" 원";
			html += "<a href='javascript:void(0);' data-value='"+value.fcode+"' style='margin-left: 10px;color:rgb(237, 91, 91);' onclick='cartDelete(this)'><i class='fa fa-times'></i></a></div></li>"; 
			pri +=value.fodpri
	});
	
	pri +="원";
	$(".orderlist").html(html);
	$(".Money").text(pri);
}
	
	
	
	
	
	
	
	
	
	