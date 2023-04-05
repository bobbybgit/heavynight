import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  static targets =  ["check"]

  connect() {
    console.log("checkbox connected")
  }

  check(){
    console.log("checking");
    this.checkTarget.checked = true;
    const event = new CustomEvent("update");
    window.dispatchEvent(event);
  }

}