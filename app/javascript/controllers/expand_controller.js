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
    if (getComputedStyle(expandee).display != "none"){
      expandee.style.display = "none";
      icon.innerHTML = "expand_more";
    }else{
      expandee.style.display = "flex";
      icon.innerHTML = "expand_less";
    }

   }

   expandText(event){
    console.log(this.element)
    let expandee = this.element.nextElementSibling;
    if (getComputedStyle(expandee).display != "none"){
      expandee.style.display = "none";
      event.target.nextElementSibling.innerHTML = "expand_more";
    }else{
      expandee.style.display = "flex";
      event.target.nextElementSibling.innerHTML = "expand_less";
    }

   }
  }

  
