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

    let groupExpand = document.getElementById("member_title");

    let groupFiltersExpand = document.getElementById("groups_filter_header");

    console.log(groupFiltersExpand)

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

    function expandGroupFilters(){
        let groupFiltersWindow = document.getElementById("filter_form_groups")
        let groupFiltersArrow = document.getElementById("expand_group_filters")

        console.log(getComputedStyle(groupFiltersWindow).display)
        if (getComputedStyle(groupFiltersWindow).display == "flex"){
            groupFiltersWindow.style.display = "none";
            groupFiltersArrow.innerHTML = "expand_more";
        }else{
            groupFiltersWindow.style.display = "flex";
            groupFiltersArrow.innerHTML = "expand_less";
        }
    }

    if (groupExpand){
        console.log(groupExpand)
        groupExpand.addEventListener("click", expandMembers)
    }

    if (groupFiltersExpand){
        console.log(groupFiltersExpand)
        groupFiltersExpand.addEventListener("click", expandGroupFilters)
    }
    

    
    


}

)



