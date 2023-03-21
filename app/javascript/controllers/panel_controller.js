import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = [];

  connect(){
    console.log("Panel Controller Connected");
    
  }

  open(){
    console.log(this.element.nextElementSibling)
    let expandee = this.element.nextElementSibling;
    while (true){
      if (expandee.getAttribute("class") == "games_panel"){
        break;
      }else{
        expandee = expandee.nextElementSibling
      }
    }
    if (getComputedStyle(expandee).display != "none"){
      expandee.style.display = "none";
    }else{
      expandee.style.display = "flex";
    }

   }
  }

  
