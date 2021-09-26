// import $ from 'jquery';
require('jquery')

export default class Global {
    static start() {
        // alert('i work')
        $('document').ready(function(){
            $('.sidebar-navigation').click(function(){
               $('.sidebar-navigation-modal').toggleClass('show-modal')
            });
            resize_content()
            // setTimeout(, 300);
        });
        $(window).resize(function(){
            resize_content()
        });
    }

}

function resize_content() {
    //.project-item

    let height = $('.project-item').height();
    $('.project-item').width(height);

    // let margin = 100,
    //     viewport_width = $(window).width(),
    //     viewport_height = $(window).height(),
    //     min_side_bar_width = 100,
    //     height = $('.main-content').height(),
    //     new_width = height + (margin * 2),
    //     new_sidebar_width = viewport_width - new_width - (margin * 4);
    // if(new_sidebar_width <= min_side_bar_width) {
    //     new_width = viewport_width - min_side_bar_width - (margin * 2)
    // }
    // $('.main-content').css({ width: new_width, padding: margin });
    // $('.main-sidebar').width(new_sidebar_width);

}