const modal = document.getElementById("qform-container")
function modalOn() {
  modal.style.display = "flex"
}
function isModalOn() {
  return modal.style.display === "flex"
}
function modalOff() {
  modal.style.display = "none"
}
const btnModal = document.getElementById("open-question")
btnModal.addEventListener("click", e => {
  modalOn()
})
const closeBtn = modal.querySelector(".qform-closer")
closeBtn.addEventListener("click", e => {
  modalOff()
})
modal.addEventListener("clock", e => {
  const evTarget = e.target
  if(evTarget.classList.contains("modal-overlay")) {
    modalOff()
  }
})
window.addEventListener("keyup", e => {
  if(isModalOn() && e.key === "Escape") {
    modalOff()
  }
})