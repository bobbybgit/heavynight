import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = ['tab'];




  connect(){
    console.log("Tab Controller Connected");
    this.tabTargets[0].style.backgroundColor = "var(--main)"
    this.tabTargets[0].style.color = "var(--secondary)"
        
  }

  tabSelect(event){
    let evTarg = event.target
    while (!this.tabTargets.includes(evTarg)){
      evTarg = evTarg.parentElement
    }
    this.tabTargets.forEach((targ, i) => {
      console.log(targ)
      if (targ != evTarg){
        targ.style.backgroundColor = "var(--secondary)"
        targ.style.color = "var(--main)"
      }else{
        evTarg.style.backgroundColor = "var(--main)"
        evTarg.style.color = "var(--secondary)"
      }
    });
    
  }
}

  


