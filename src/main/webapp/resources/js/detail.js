/**
 * 
 */
// modal window control
const ruleContainer = document.getElementById("review-rule-container");
console.log(ruleContainer);
const ruleOverlay = ruleContainer.querySelector(".modal__overlay");
console.log(ruleOverlay)
const ruleContent = ruleContainer.querySelector(".modal__content")
console.log(ruleContent)
const ruleCloseBtn = ruleContainer.querySelector(".modal__close");
const openRule = () => {
	ruleContainer.classList.remove("hidden");
	ruleOverlay.classList.remove("hidden");
	ruleContent.classList.remove("hidden");
}
const closeRule = () => {
	ruleContainer.classList.add("hidden");
	ruleOverlay.classList.add("hidden");
	ruleContent.classList.add("hidden");
}
const isRuleOpen = () => {
	return ruleContainer.style.display === "flex"
}
ruleCloseBtn.addEventListener("click", closeRule);
ruleOverlay.addEventListener("click", closeRule);
window.addEventListener("keyup", e => {
	if (isRuleOpen && e.key === "Escape") {
		closeRule();
	}
})
/**
 *
 */
const qform = document.getElementById("qform__container");
const qformOverlay = qform.querySelector("#qform__overlay");
const qformContent = qform.querySelector("#qform__content");
const qformCloseBtn = qform.querySelector(".qform__close");
const openQform = () => {
	qform.classList.remove("hidden");
}
const closeQform = () => {
	qform.classList.add("hidden");
}
const isQformOpen = () => {
	return qform.style.display === "flex"
}
qformCloseBtn.addEventListener("click", closeQform);
qformOverlay.addEventListener("click", closeQform);
window.addEventListener("keyup", e => {
	if (isQformOpen && e.key === "Escape") {
		closeQform();
	}
})