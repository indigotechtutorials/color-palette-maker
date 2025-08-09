import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]
  open(e) {
    e.preventDefault()
    let modalId = e.target.getAttribute("data-modal-id")
    let modal = document.querySelector(`dialog[id='${modalId}']`)
    if (!modal) {
      return console.log("No modal found with id:", modalId)
    }
    modal.showModal()
    this.modalOpening = true
    setTimeout(() => {
      this.modalOpening = false
    }, 500)
  }

  closeIfOutside(e) {
    if (this.modalOpening) {
      return
    }
    this.modalTargets.forEach(target => {
      if (target.open) {
        let modalContent = target.querySelector("[data-modal-content]")
        if (modalContent) {
          if (!modalContent.contains(e.target)) {
            target.close()
          }
        }
      }
    })
  }
}
