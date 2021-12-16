<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
    작성자: 정상준
    작성일: 2021-12-04
    
	Included to detail.jsp
--%>
<link rel="stylesheet" href="/resources/css/item-question.css" />
<div id="item-question-container">
	<h2>상품 문의</h2>
	<button id="qform__open">문의하기</button>
	<!-- 모달창 -->
	<div id="qform__container" class="hidden">
		<div id="qform__overlay" class="hidden"></div>
		<div id="qform__content" class="hidden">
			<button class="qform__close">X</button>
			<form action="" method="post" id="qform">
				<table id="qform__table">
					<thead>
						<tr>
							<td colspan="2"><h3>상품 문의</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>상품 선택</th>
							<td><label for="size">사이즈</label> <select name="size"
								id="size">
									<option value="28">28</option>
									<option value="30">30</option>
									<option value="32">32</option>
									<option value="34">34</option>
							</select></td>
						</tr>
						<tr>
							<th>판매자</th>
							<td>seller</td>
						</tr>
						<tr>
							<th>문의내용</th>
							<td><textarea name="qContent" id="qContent" cols="60"
									rows="10" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><input type="hidden" name="id"
								value="${signinUser.id}"> <!-- 작성자 아이디--> <input
								type="hidden" name="type" value=""> <span>*
									개인정보(주민번호, 연락처, 주소, 계좌번호, 카드번호 등)가 포함되지 않도록 유의해주세요.</span>
								<div class="send_question">
									<a href="#" class="send">확인</a> <a
										href="javascript:closeQform();" class="cancel qform-closer">취소</a>
								</div></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<!-- qform__content -->
	</div>
	<!-- end Modal -->
	<!-- q-caution -->
	<ul class="q__caution">
		<li>구매한 상품의 <b>취소/반품은 구매내역</b>에서 신청 가능합니다.
		</li>
		<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
		<li><b>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1
				문의하기</b>를 이용해주세요.</li>
		<li><b>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이
				이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</b></li>
		<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
	</ul>
	<hr>
	<section class="question__board">
		<!-- article을 추가하는 방식 -->
		<article class="question">
			질문 | 작성자<br> <span class="date">작성일자</span><br> <span
				class="item">품목</span><br>
			<p class="content">문의 내용</p>
		</article>
		<article class="answer">
			답변 | 작성자<br> <span class="date">작성일자</span><br>
			<p class="content">답변 내용</p>
		</article>
		<article class="question">
			질문 | 작성자<br> <span class="q-date">작성일자</span><br> <span
				class="q-item">품목</span><br>
			<p class="q-content">문의 내용</p>
		</article>
		<article class="question">
			질문 | 작성자<br> <span class="q-date">작성일자</span><br> <span
				class="q-item">품목</span><br>
			<p class="q-content">문의 내용</p>
		</article>
		<!--
        article이 없을 경우
        등록된 문의가 없습니다.
      -->
	</section>
</div>
<script src="../resources/js/item-question.js"></script>