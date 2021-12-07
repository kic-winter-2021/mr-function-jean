<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/review.css" />
<div id="review-container">
	<h3>상품평</h3>
	<span><a href="javascript:openRule();">상품평 운영원칙</a></span>
	<div id="review-rule-container" class="hidden">
		<div class="modal__overlay hidden"></div>
		<div id="review-rule" class="modal__content hidden">
			<h2>상품평 운영원칙</h2>
			<button class="modal__close">X</button>
			<p class="review-notice">※ 상품평 운영원칙 및 관련 법령에 위반되는 경우에는 해당 상품평에 대한
				임시 대처, 비공개 전환, 삭제 등의 필요한 조치가 취해질 수 있습니다.</p>
			1. 작성된 글과 첨부된 멀티미디어 파일 등으로 이루어진 각 상품평은 개인의 의견을 반영하므로, 게시된 내용에 대한 모든
			책임은 작성자에게 있습니다.<br> 2. 상품평은 상품의 사용 관련 후기인 바, 배송·주문취소·교환·반품 등에 관한
			문의사항은 고객센터로 제기하시기 바랍니다.<br> 3. 다음과 같은 내용은 상품평에 허용되지 않은 부류인 바,
			상품평 작성 시 주의하시기 바랍니다. <br>
			<p class="rule-subitem">
				A. 주관적인 의견으로 인해 상품의 기능 및 효과에 대하여 오해의 소지가 있는 내용<br> B. 비방, 욕설,
				도배 등의 게시물 또는 반복되는 동일 단어나 문장<br> C. 타인 또는 기타 기관이 작성, 공개한 정보를
				복사하여 기재한 부분<br> D. 상업적 목적의 광고성 내용<br> E. 그 밖에 상품평 운영원칙에
				위배되거나 그러하다고 사료되는 내용<br>
			</p>
			4. 상품평으로 인해 다른 회원 또는 제3자에게 피해가 가해질 경우, 법적인 책임이 따를 수 있으며, 이에 대한 책임은
			상품평을 게시한 당사자에게 있습니다.<br> 5. 개인정보 보호와 관련된 피해를 방지하기 위해 주민번호, 전화번호,
			이메일, 연락처 등의 내용 기입은 삼가해주시기 바랍니다. 해당 내용이 발견되는 경우,<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제3자 노출을 방지하기 위해 관리자에 의해 노출 제한, 비공개 전환,
			삭제 처리 등이 될 수 있습니다.<br> 6. 이 외 상품평의 성격에 맞지 않는 내용은 관리자에 의해 노출 제한,
			비공개 전환, 삭제 처리 등이 될 수 있습니다.
		</div>
	</div>
	<!--
      리뷰(작성자, 점수, 작성일자, 내용)
    -->
	<div class="review-grid">
		<!-- 리뷰 바:정렬 기능 제공 - 좋아요 순, 최신순, 평점 정렬,-->
		<div id="review-bar">
			<button>최신순</button>
			<button>좋아요순</button>
		</div>
		<div id="review-best">
			<h4>평점 높은 리뷰</h4>
			<ul class="img_list">
				<li><img src="../resources/img/unnamed.jpg" alt=""></li>
			</ul>
			<div class="rate">
				<div class="star-rating3">
					<div class="star-percent" style="width: 80%;">
						<img src="../resources/img/5star_transparent.png" alt="">
					</div>
				</div>
			</div>
			<span class="date"> 2021-12-05 </span>
			<div class="content">리뷰 내용</div>
		</div>
		<div id="review-worst">
			<h4>평점 낮은 리뷰</h4>
			<ul class="img_list">
				<li><img src="../resources/img/unnamed.jpg" alt=""></li>
			</ul>
			<div class="rate">
				<div class="star-rating3">
					<div class="star-percent" style="width: 10%;">
						<img src="../resources/img/5star_transparent.png" alt="">
					</div>
				</div>
			</div>
			<span class="date"> 2021-12-03 </span>
			<div class="content">리뷰 내용</div>
		</div>
		<div class="review-board">
			<!-- article을 추가하는 방식 -->
			<article class="review">
				<ul class="img_list">
					<li><img src="../resources/img/unnamed.jpg" alt=""></li>
				</ul>
				<div class="rate">
					<div class="star-rating3">
						<div class="star-percent" style="width: 10%;">
							<img src="../resources/img/5star_transparent.png" alt="">
						</div>
					</div>
				</div>
				<span class="date"> 2021-12-03 </span>
				<div class="content">리뷰 내용</div>
			</article>
		</div>
	</div>
</div>
<!-- reviewForm -->
<div id="reviewForm-container">
	<form action="">
		<h4>리뷰 입력</h4>
		<h5>별점 등록</h5>
		<div class="rating-container">
			<input type="radio" id="5-stars" name="rating" value="5" /> <label
				for="5-stars" class="star">&#9733;</label> <input type="radio"
				id="4-stars" name="rating" value="4" /> <label for="4-stars"
				class="star">&#9733;</label> <input type="radio" id="3-stars"
				name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
			<input type="radio" id="2-stars" name="rating" value="2" /> <label
				for="2-stars" class="star">&#9733;</label> <input type="radio"
				id="1-star" name="rating" value="1" /> <label for="1-star"
				class="star">&#9733;</label>
		</div>
		<label for="review-content">내용</label>
		<textarea placeholder="내용을 입력해주세요" name="review-content"
			id="review-content" cols="70" rows="10"></textarea>
		<h5>크기</h5>
		<div class="rating-container">
			<input type="radio" id="rating-1-5" name="rating-1" value="5" /> <label
				for="rating-1-5" class="star">&#9733;</label> <input type="radio"
				id="rating-1-4" name="rating-1" value="4" /> <label
				for="rating-1-4" class="star">&#9733;</label> <input type="radio"
				id="rating-1-3" name="rating-1" value="3" /> <label
				for="rating-1-3" class="star">&#9733;</label> <input type="radio"
				id="rating-1-2" name="rating-1" value="2" /> <label
				for="rating-1-2" class="star">&#9733;</label> <input type="radio"
				id="rating-1-1" name="rating-1" value="1" /> <label
				for="rating-1-1" class="star">&#9733;</label>
		</div>
		<div class="rating-container">
			<input type="radio" id="rating-2-5" name="rating-2" value="5" /> <label
				for="rating-2-5" class="star">&#9733;</label> <input type="radio"
				id="rating-2-4" name="rating-2" value="4" /> <label
				for="rating-2-4" class="star">&#9733;</label> <input type="radio"
				id="rating-2-3" name="rating-2" value="3" /> <label
				for="rating-2-3" class="star">&#9733;</label> <input type="radio"
				id="rating-2-2" name="rating-2" value="2" /> <label
				for="rating-2-2" class="star">&#9733;</label> <input type="radio"
				id="rating-2-1" name="rating-2" value="1" /> <label
				for="rating-2-1" class="star">&#9733;</label>
		</div>
		<div id="review-buttons">
			<a href="#" id="review-commit">리뷰 등록</a> <a href="#"
				id="review-cancel">취소</a>
		</div>
	</form>
</div>
<script src="../resources/js/review.js"></script>