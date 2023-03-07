import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

static targets = ['home', 'groups', 'events', 'games'];




  connect(){
    console.log("Tab Controller Connected");
    
  }

  tabSelect({params: {tab}}){
    console.log(this.homeTarget)
    let homeTab = this.homeTarget
    let groupsTab = this.groupsTarget
    let eventsTab = this.eventsTarget
    let gamesTab = this.gamesTarget

    switch(tab){
      case "home":
        console.log("Home Selected");
        homeTab.style.borderBottomColor = "var(--highlight)"
        groupsTab.style.borderBottomColor = "var(--mainDark)"
        eventsTab.style.borderBottomColor = "var(--mainDark)"
        gamesTab.style.borderBottomColor = "var(--mainDark)"
      break;
      case "groups":
        console.log("Groups Selected");
        homeTab.style.borderBottomColor = "var(--mainDark)"
        groupsTab.style.borderBottomColor = "var(--highlight)"
        eventsTab.style.borderBottomColor = "var(--mainDark)"
        gamesTab.style.borderBottomColor = "var(--mainDark)"
      break;
      case "events":
        console.log("Events Selected");
        homeTab.style.borderBottomColor = "var(--mainDark)";
        groupsTab.style.borderBottomColor = "var(--mainDark)";
        eventsTab.style.borderBottomColor = "var(--highlight)";
        gamesTab.style.borderBottomColor = "var(--mainDark)";
      break;
      case "games":
        console.log("Games Selected");
        homeTab.style.borderBottomColor = "var(--mainDark)";
        groupsTab.style.borderBottomColor = "var(--mainDark)";
        eventsTab.style.borderBottomColor = "var(--mainDark)";
        gamesTab.style.borderBottomColor = "var(--highlight)";
      break;
    }
  }

  

}
