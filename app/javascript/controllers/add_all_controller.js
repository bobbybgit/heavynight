import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    
    console.log('Add All Controller Connected')
  }

  add(){
    const event = new CustomEvent("add")
    window.dispatchEvent(event)
    console.log("add clicked")
  }


}