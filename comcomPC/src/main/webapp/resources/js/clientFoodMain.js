$(document).ready(function(){
  $('.carousel').slick({
    slidesToShow: 4,
    slidesToScroll : 1,
    dots:false,
    centerMode: false,
    draggable : true 	//드래그 가능 여부 
    });
});

// const $topBtn = document.querySelector(".moveTopBtn");

// // 버튼 클릭 시 맨 위로 이동
// $topBtn.onclick = () => {
//   window.scrollTo({ top: 0, behavior: "smooth" });  
// }

// 처음에 페이지 하단으로 스크롤 위치 지정
window.onload = () => {
  window.scrollTo({ top: document.body.scrollHeight });  
}