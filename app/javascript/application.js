// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//listens for page load otherwise turbo stops page reading javascript properly without refresh
document.addEventListener("turbo:load", function() {
    console.log("turbo loaded")
    
    if($(window).width() <= 750){
        let menuOpen = false;
        const menuButton = document.querySelector("#mobile_burger");
        const menuBar = document.querySelector("#sidebar");
        const contWindow = document.querySelector("#content_window");
        menuBar.style.display = "none";
        contWindow.style.display = "flex";

        function menuToggle() {
            if (menuOpen) {
                menuBar.style.display = "none";
                menuBar.style.maxWidth = "300px";
                menuBar.style.minWidth = "300px";
                contWindow.style.display = "flex";
                menuOpen = false;
                console.log("menuOpen")
            }else{
                menuBar.style.display ="flex";
                menuBar.style.maxWidth = "100vw";
                menuBar.style.minWidth = "100vw"
                contWindow.style.display ="none";
                menuOpen = true;
                console.log(menuOpen)
            }
        }


    menuButton.ontouchstart = menuToggle;

    }else{
        const menuBar = document.querySelector("#sidebar");
        menuBar.style.display = "flex";
        menuBar.style.maxWidth = "300px";
        menuBar.style.minWidth = "300px";
        const contWindow = document.querySelector("#content_window");
        contWindow.style.display = "flex";

    }

})

window.addEventListener("resize", function() {
    console.log("turbo loaded")
    
    if($(window).width() <= 750){
        let menuOpen = false;
        const menuButton = document.querySelector("#mobile_burger");
        const menuBar = document.querySelector("#sidebar");
        const contWindow = document.querySelector("#content_window");
        menuBar.style.display = "none";
        contWindow.style.display = "flex";

        function menuToggle() {
            if (menuOpen) {
                menuBar.style.display = "none";
                menuBar.style.maxWidth = "300px";
                menuBar.style.minWidth = "300px";
                contWindow.style.display = "flex";
                menuOpen = false;
                console.log("menuOpen")
            }else{
                menuBar.style.display ="flex";
                menuBar.style.maxWidth = "100vw";
                menuBar.style.minWidth = "100vw"
                contWindow.style.display ="none";
                menuOpen = true;
                console.log(menuOpen)
            }
        }


    menuButton.ontouchstart = menuToggle;

    }else{
        const menuBar = document.querySelector("#sidebar");
        menuBar.style.display = "flex";
        menuBar.style.maxWidth = "300px";
        menuBar.style.minWidth = "300px";
        const contWindow = document.querySelector("#content_window");
        contWindow.style.display = "flex";

    }

})

