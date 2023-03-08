import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = [];

  connect(){
    console.log("Expand Controller Connected");
    
  }

  expand(event){
    console.log(this.element)
    let expandee = this.element.nextElementSibling;
    let icon = event.target;
    if (getComputedStyle(expandee).display == "flex"){
      expandee.style.display = "none";
      icon.innerHTML = "expand_more";
    }else{
      expandee.style.display = "flex";
      icon.innerHTML = "expand_less";
    }

   }
  }

  
