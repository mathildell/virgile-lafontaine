// import $ from 'jquery';
require('jquery');
require('magnify');
require('magnify/dist/css/magnify.css');

import Glide from '@glidejs/glide'
//import ImageZoom from 'js-image-zoom'

export default class Global {
    static start() {
        // alert('i work')

        // let glide = new Glide('.glide', {
        //     type: 'carousel',
        //     startAt: 0,
        // });
        // }

        $('document').ready(function(){

            if($('.glide').length > 0) {
                let glide = new Glide('.glide'),
                    window_width = $(document).width();

                // if(window_width > 1049) {
                glide.on('run.after', function () {
                    // console.log(e);
                    let project_url = $('.glide__slide.glide__slide--active').data('project-url'),
                        project_title = $('.glide__slide.glide__slide--active').data('project-title');
                    $('.projects-slider h1 a span').text(project_title);
                    $('.projects-slider h1 a').attr({'href': project_url});
                })

                if(window_width <= 1050) {
                    glide.mount();
                }

                if(window_width > 1049) {
                    resize_slider(glide)
                }

                $(window).resize(function() {
                    if(window_width > 1049) {
                        resize_slider(glide)
                    } else {
                        glide.destroy();
                        glide.mount();
                    }
                });
            }

            $(window).resize(function() {
                let window_width = $(document).width();
                if(window_width > 1049) {
                    resize_project()
                }
            });

            $('a[data-show-modal]').click(function(e){
                e.preventDefault();
                let show_modal = $(this).data('show-modal');
                $(show_modal).toggleClass('show-modal');
            });


            if($('.project').length > 0){
                let window_width = $(document).width();
                if(window_width > 1049) {
                    let original_image_width = resize_project();
                    $('.project-image img').magnify({
                        finalWidth: original_image_width,
                        finalHeight: original_image_width
                    });
                } else {

                }
            }
        });

    }

}

function resize_project() {
    if($('.project').length > 0){
        let main_image_width = $('.project .project-image img').width(),
            main_image_height = $('.project .project-image img').height(),
            main_container_width = $('.project').width(),
            main_container_height = $('.project').height(),
            standard_margin = parseInt($('main h1').css('margin-top'));

        // if(main_image_width != main_image_height){
        //     if(main_image_height > main_container_height) {
        //         main_image_width = main_container_height;
        //     }
        // }

        if(main_container_height > main_image_width) {
            $('.project-image, .project-image a, .project-image img').width(main_container_height);
            $('.project-image, .project-image a, .project-image img').height(main_container_height);
            main_image_width = main_container_height;
        } else {
            $('.project-image, .project-image a, .project-image img').width(main_image_width);
            $('.project-image, .project-image a, .project-image img').height(main_image_width);
        }

        let preview_container_width = main_container_width - main_image_width - (standard_margin * 2),
        preview_image_width_height = (preview_container_width / 5) - (standard_margin * 2);

        $('.description-container')
            .width(preview_container_width);

        return main_image_width;
        // .height(main_image_width);

    }
}
function resize_slider(glide){
    if($('.glide').length > 0){
        let main_image_width = $('.glide .glide__slide img').width(),
            main_image_height = $('.glide .glide__slide img').height(),
            main_container_width = $('.projects-slider').width(),
            main_container_height = $('.projects-slider').height(),
            standard_margin = parseInt($('main h1').css('margin-top'));

        if(main_image_width >= main_image_height){
            main_image_width = main_image_height;
        }
        if(main_container_height > main_image_height) {
            main_image_width = main_container_height;
        }

        let preview_container_width = main_container_width - main_image_width - (standard_margin * 2),
            preview_image_width_height = (preview_container_width / 5) - (standard_margin * 2);

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
