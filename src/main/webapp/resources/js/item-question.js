const qform = document.getElementById("qform__container");
const qformOverlay = qform.querySelector("#qform__overlay");
const qformContent = qform.querySelector("#qform__content");
const qformOpenBtn = document.querySelector("#qform__open");
console.log(qformOpenBtn);
const qformCloseBtn = qform.querySelector(".qform__close");
const openQform = () => {
	console.log("open Qform");
	qform.classList.remove("hidden");
	qformOverlay.classList.remove("hidden");
	qformContent.classList.remove("hidden");
}
const closeQform = () => {
	console.log("close Qform");
	qform.classList.add("hidden");
	qformOverlay.classList.add("hidden");
	qformContent.classList.add("hidden");
}
const isQformOpen = () => {
	return qform.style.display === "flex";
}
qformOverlay.addEventListener("click", closeQform);
window.addEventListener("keyup", e => {
	if (isQformOpen() && e.key === "Escape") {
		closeQform();
	}
})
qformOpenBtn.addEventListener("click", openQform);
qformCloseBtn.addEventListener("click", closeQform);