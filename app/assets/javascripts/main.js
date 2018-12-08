document.addEventListener('turbolinks:load',() => {
    particlesJS('particles-id', {
        "particles": {
            "number": {
                "value": 76,
                "density": {
                    "enable": false,
                    "value_area": 1260.3387160299326
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 8
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 1,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 3,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 5.0547598989048,
                    "size_min": 1.6849199663016001,
                    "sync": true
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#ffffff",
                "opacity": 0.4,
                "width": 2
            },
            "move": {
                "enable": true,
                "speed": 2,
                "direction": "top-right",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "repulse"
                },
                "onclick": {
                    "enable": false,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 400,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 400,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 150,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    })
});


$( document ).ready(function() {
    // ------------------------------------------------------
    // @Window Resize
    // ------------------------------------------------------

    /**
     * NOTE: Register resize event for Masonry layout
     */
    const EVENT = document.createEvent('UIEvents');
    window.EVENT = EVENT;
    EVENT.initUIEvent('resize', true, false, window, 0);


    window.addEventListener('load', () => {
        /**
         * Trigger window resize event after page load
         * for recalculation of masonry layout.
         */
        window.dispatchEvent(EVENT);
    });

    // ------------------------------------------------------
    // @External Links
    // ------------------------------------------------------

    // Open external links in new window
    $('a')
        .filter('[href^="http"], [href^="//"]')
        .not(`[href*="${window.location.host}"]`)
        .attr('rel', 'noopener noreferrer')
        .attr('target', '_blank');

    // ------------------------------------------------------
    // @Resize Trigger
    // ------------------------------------------------------

    // Trigger resize on any element click
    document.addEventListener('click', () => {
        window.dispatchEvent(window.EVENT);
    });

    // Sidebar links
    $('.sidebar .sidebar-menu li a').on('click', function () {
        const $this = $(this);

        if ($this.parent().hasClass('open')) {
            $this
                .parent()
                .children('.dropdown-menu')
                .slideUp(200, () => {
                    $this.parent().removeClass('open');
                });
        } else {
            $this
                .parent()
                .parent()
                .children('li.open')
                .children('.dropdown-menu')
                .slideUp(200);

            $this
                .parent()
                .parent()
                .children('li.open')
                .children('a')
                .removeClass('open');

            $this
                .parent()
                .parent()
                .children('li.open')
                .removeClass('open');

            $this
                .parent()
                .children('.dropdown-menu')
                .slideDown(200, () => {
                    $this.parent().addClass('open');
                });
        }
    });

    // Sidebar Activity Class
    const sidebarLinks = $('.sidebar').find('.sidebar-link');

    sidebarLinks
        .each((index, el) => {
            $(el).removeClass('active');
        })
        .filter(function () {
            const href = $(this).attr('href');
            const pattern = href[0] === '/' ? href.substr(1) : href;
            return pattern === (window.location.pathname).substr(1);
        })
        .addClass('active');

    // ٍSidebar Toggle
    $('.sidebar-toggle').on('click', e => {
        $('.app').toggleClass('is-collapsed');
        e.preventDefault();
    });

    /**
     * Wait untill sidebar fully toggled (animated in/out)
     * then trigger window resize event in order to recalculate
     * masonry layout widths and gutters.
     */
    $('#sidebar-toggle').click(e => {
        e.preventDefault();
        setTimeout(() => {
            window.dispatchEvent(window.EVENT);
        }, 300);
    });

});