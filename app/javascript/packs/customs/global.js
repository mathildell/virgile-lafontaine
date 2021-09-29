// import $ from 'jquery';
require('jquery');
import Glide from '@glidejs/glide'

export default class Global {
    static start() {
        // alert('i work')

        // let glide = new Glide('.glide', {
        //     type: 'carousel',
        //     startAt: 0,
        // });
        let glide = new Glide('.glide');

        glide.on('run.after', function() {
            // console.log(e);
            let project_url = $('.glide__slide.glide__slide--active').data('project-url'),
                project_title = $('.glide__slide.glide__slide--active').data('project-title');
            $('.projects-slider h1 a span').text(project_title);
            $('.projects-slider h1 a').attr({ 'href': project_url });
        })

        $('document').ready(function(){
            $(window).resize(function(){
                resize_slider(glide)
            });

            $('a[data-show-modal]').click(function(e){
                e.preventDefault();
                let show_modal = $(this).data('show-modal');
                $(show_modal).toggleClass('show-modal');
            });

            resize_slider(glide)

            // let banner_gif = $('#main-content .blur-background').data('banner');
            // console.log(banner_gif);
            // $('#main-content .blur-background').css('background-image', 'url('+ banner_gif +')');
            // $('#main-content .blur-background').removeAttr('data-banner');

            // $('.sidebar-navigation').click(function(){
            //    $('.sidebar-navigation-modal').toggleClass('show-modal')
            // });
            // resize_content()
            // setTimeout(, 300);
        });

    }

}

function resize_project() {
    if($('.project').length > 0){
        let main_image_width = $('.glide .glide__slide img').width(),
            main_container_width = $('.projects-slider').width(),
            standard_margin = parseInt($('main h1').css('margin-top')),

            preview_container_width = main_container_width - main_image_width - (standard_margin * 2),
            preview_image_width_height = (preview_container_width / 5) - (standard_margin * 2);

        console.log(standard_margin);
        $('.glide').width(main_image_width);

        $('.glide-bullets-container')
            .width(preview_container_width)
            .css({'right': '-' + (preview_container_width + standard_margin) + 'px'});
        // .height(main_image_width);

        $('.glide__bullets')
            .width(preview_container_width);
        // .height(main_image_width);

        $('.glide__bullet')
            .width(preview_image_width_height)
            .height(preview_image_width_height);

        glide.destroy();
        glide.mount();

    }
}
function resize_slider(glide){
    if($('.glide').length > 0){
        let main_image_width = $('.glide .glide__slide img').width(),
            main_container_width = $('.projects-slider').width(),
            standard_margin = parseInt($('main h1').css('margin-top')),

            preview_container_width = main_container_width - main_image_width - (standard_margin * 2),
            preview_image_width_height = (preview_container_width / 5) - (standard_margin * 2);

            console.log(standard_margin);
            $('.glide').width(main_image_width);

            $('.glide-bullets-container')
                .width(preview_container_width)
                .css({'right': '-' + (preview_container_width + standard_margin) + 'px'});
                // .height(main_image_width);

            $('.glide__bullets')
                .width(preview_container_width);
                // .height(main_image_width);

            $('.glide__bullet')
                .width(preview_image_width_height)
                .height(preview_image_width_height);

            glide.destroy();
            glide.mount();

    }
}
