<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<!-- css파일 -->
<link rel="stylesheet" href="notice.css">

</head>
<body>
	<!-- 작성자 : 오근영 -->
	<!-- 작성일자 : 21.12.06 -->

	<!-- 리스트 부분 -->
	<div class="form_box">
		<span id="faq-title">공지사항 내역입니다.</span>
		<div class="faq-content">
			<button class="question" id="que-1">
				<span id="que-1-toggle">+</span><span>1. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-1">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-2">
				<span id="que-2-toggle">+</span><span>2. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-2">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>3. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>4. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>5. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>6. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>7. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>
		<div class="faq-content">
			<button class="question" id="que-3">
				<span id="que-3-toggle">+</span><span>8. *** 등록사항입니다.</span>
			</button>
			<div class="answer" id="ans-3">이번 새해 물품 배송은 1월 4일 부터 시작됩니다.</div>
		</div>

	</div>
	<!-- 자바 스크립트 -->
	<script>
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
</body>
</html>