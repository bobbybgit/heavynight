// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function(){

    const activeTabStorage = localStorage.getItem('currentTab')
    let tabs = document.querySelectorAll(".tab");

    if(activeTabStorage){
        tabs[activeTabStorage].style.borderBottomColor = "var(--highlight)"
        console.log(activeTabStorage)
    }

    console.log(tabs)

    tabs.forEach((tab, pos, tabsPassed) => {
        console.log(tabsPassed[pos]);
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
    

})





