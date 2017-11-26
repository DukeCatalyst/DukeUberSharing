$(document).ready(function() {
    /* Sets the posts to redirect to their individual page */
    $('.post').each(function() {
        this.onclick = function() { 
            var post_url = gon.global.base_url + "posts/" + this.id;
            window.location.href = post_url;
        }
    });
});