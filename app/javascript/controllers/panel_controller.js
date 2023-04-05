import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = [];

  connect(){
    console.log("Panel Controller Connected");
    
  }

  open(event){
    console.log(event.target)
    let expandee = event.target
    if (!expandee.classList.contains("table_cell")){
      expandee = expandee.parentElement
    }
    expandee = expandee.nextElementSibling;
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

  
