import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Modal Controller Connected")
    this.modal = this.element;
  }

  open() {
    console.log(`opening ${this.modal}`)
    if (getComputedStyle(this.modal).display == "none") {
      this.modal.style.display = "flex";
      
    }
  }

  close(event) {
    if (getComputedStyle(this.modal).display == "flex") {
      this.modal.style.display = "none";
    }
  }
}

  
