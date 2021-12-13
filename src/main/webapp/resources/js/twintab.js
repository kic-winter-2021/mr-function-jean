/**
 * 
 */
window.onload = () => {
	const tab1 = document.getElementById("tab1");
	const tab2 = document.getElementById("tab2");
	const content1 = document.getElementById("content1");
	const content2 = document.getElementById("content2");
	const select1 = () => {
		tab1.classList.add("active");
		content1.classList.remove("hidden");
		tab2.classList.remove("active");
		content2.classList.add("hidden");
	}
	const select2 = () => {
		tab2.classList.add("active");
		content2.classList.remove("hidden");
		tab1.classList.remove("active");
		content1.classList.add("hidden");
	}
	tab1.addEventListener('click', select1);
	tab2.addEventListener('click', select2);
}