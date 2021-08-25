const swiper = new Swiper('.swiper-container', {
	navigation : {
		nextEl : '.swiper-button-next', //다음버튼 클래스 명
		prevEl : '.swiper-button-prev', //이전버튼 클래스 명
	}
});
// sign in 윈도우 작은 창으로 열기
// 이것도 main.js파일에 넣었는데 작동하지 않길래 밖으로 빼놨음