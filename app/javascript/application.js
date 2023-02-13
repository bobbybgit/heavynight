// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.initMap = () => {
    console.log("map loaded")
}

document.addEventListener('turbo:load',function(){
    console.log('load')

    const activeTabStorage = localStorage.getItem('currentTab')
    let tabs = document.querySelectorAll(".tab");

    let country = document.getElementById("country")

    if(activeTabStorage){
        tabs[activeTabStorage].style.borderBottomColor = "var(--highlight)"
        console.log(activeTabStorage)
    }

    let newGroupBtn = document.getElementById("new_group_button");
    console.log(newGroupBtn)
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



