const ruleContainer = document.getElementById("review-rule-container");
console.log(ruleContainer);
const ruleOverlay = ruleContainer.querySelector(".modal__overlay");
console.log(ruleOverlay)
const ruleContent = ruleContainer.querySelector(".modal__content")
console.log(ruleContent)
const ruleCloseBtn = ruleContainer.querySelector(".modal__close");
const openRule = () => {
	console.log("open review-rule");
	ruleContainer.classList.remove("hidden");
	ruleOverlay.classList.remove("hidden");
	ruleContent.classList.remove("hidden");
}
const closeRule = () => {
	console.log("close review-rule")
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
	if (isRuleOpen() && e.key === "Escape") {
		closeRule();
	}
})