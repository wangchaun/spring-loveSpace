
jQuery(document).ready(function($) {
    $.backgrounds = [];
    var width = $(window).width();
    var height = $(window).height();
    var api = 'https://unsplash.it/'+width+'/'+height+'?image=';
    var limit = 5;
    var current = 0;

    $.get('https://unsplash.it/list', function(data) {
        for (var i = 0; i < limit; i++) {
            var random = Math.floor(Math.random() * data.length) + 1;
            var photo = data[random];
            $.backgrounds.push(
                {
                    src: api + photo.id
                }
            );
        }

        $("#banner").vegas({
            slides: $.backgrounds
        });
    });
});