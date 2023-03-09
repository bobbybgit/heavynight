import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = ['tab'];




  connect(){
    console.log("Tab Controller Connected");
    this.tabTargets[0].style.borderBottomColor = "var(--highlight)"
        
  }

  tabSelect(event){
    this.tabTargets.forEach((targ, i) => {
      console.log(targ)
      if (targ != event.target){
        targ.style.borderBottomColor = "var(--mainDark)"
      }else{
        event.target.style.borderBottomColor = "var(--highlight)"
      }
    });
    
  }
}

  


