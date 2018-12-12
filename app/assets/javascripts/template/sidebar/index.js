console.log("---0---");
$(function () {
    $( document ).ready(function() {
        console.log("---1---");
        // Sidebar links
        $('.sidebar .sidebar-menu li a').on('click', function () {
            console.log("---2---");
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
            console.log("---3---");
            $('.app').toggleClass('is-collapsed');
            e.preventDefault();
        });

        /**
         * Wait untill sidebar fully toggled (animated in/out)
         * then trigger window resize event in order to recalculate
         * masonry layout widths and gutters.
         */
        $('#sidebar-toggle').click(e => {
            console.log("---4---");
            e.preventDefault();
            setTimeout(() => {
                window.dispatchEvent(window.EVENT);
            }, 300);
        });
    });
}());
