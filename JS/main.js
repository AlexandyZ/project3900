function change_color() {
    var nav = document.getElementById("navlink");
    var link = document.getElementsByTagName("a");
    
    for (var i = 0; i < link.length; i++) {
        var url = link[i].getAttribute("href");
        var currurl = document.location.href;
        if (currul.indexOf(url) != -1) {
            link[i].className = "current"; 
        }
    }
}