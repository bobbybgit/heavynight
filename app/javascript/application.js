// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.initMap = function () {
    console.log("Init map running")
    const event = new Event('google-maps-callback', {
      bubbles: true,
      cancelable: true,
    })
    window.dispatchEvent(event)
    console.log("event dispatched")
  }

document.addEventListener('turbo:load',function(){

    console.log("load");

    let activeTabStorage = parseInt(localStorage.getItem('currentTab'));

    let tabs = document.querySelectorAll(".tab");

    let groupExpand = document.getElementById("member_title")

    function expandMembers(){
        let membersWindow = document.getElementById("member_list")
        let membersArrow = document.getElementById("member_expand")

        console.log(getComputedStyle(membersWindow).display)
        if (getComputedStyle(membersWindow).display == "flex"){
            membersWindow.style.display = "none";
            membersArrow.innerHTML = "expand_more";
        }else{
            membersWindow.style.display = "flex";
            membersArrow.innerHTML = "expand_less";
        }
    }

    if (groupExpand){
        console.log(groupExpand)
        groupExpand.addEventListener("click", expandMembers)
    }
    
    if(!activeTabStorage.isNaN){
        tabs[activeTabStorage].style.borderBottomColor = "var(--highlight)"
        console.log(activeTabStorage)
    }

    let newGroupBtn = document.getElementById("new_group_button");
    
    if (newGroupBtn){newGroupBtn.addEventListener("click", function(){
        tabs.forEach((tab, pos, tabsPassed) => {
            if (pos === 0){
                tabs[pos].style.borderBottomColor = "var(--highlight)";
                localStorage.setItem('currentTab', pos);
            }else{
                tabs[pos].style.borderBottomColor = "var(--mainDark)";
            }
        })
    })
    }

    
    tabs.forEach((tab, pos, tabsPassed) => {
        tab.addEventListener("click", function(){
            tabs.forEach((tabStyle) => {
                if (tabStyle === tab) {
                    tabStyle.style.borderBottomColor = "var(--highlight)";
                    localStorage.setItem('currentTab', pos)
                } else {
                    tabStyle.style.borderBottomColor = "var(--mainDark)";
                }
                console.log(`set ${tabStyle}`)
            }) 
        })
    })
    


}

)



