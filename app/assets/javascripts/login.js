document.addEventListener('turbolinks:load',() => {
    if(document.getElementById("particles-js")){
        particlesJS('particles-js', {
            "particles": {
                "number": {
                    "value": 76,
                    "density": {
                        "enable": false,
                        "value_area": 1260.3387160299326
                    }
                },
                "color": {
                    "value": "#C8DFFE"
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
                    "color": "#C8D8ED",
                    "opacity": 0.2,
                    "width": 2
                },
                "move": {
                    "enable": true,
                    "speed": 2,
                    "direction": "top-left",
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
                    onresize: {
                        enable: true,
                        density_auto: true,
                        density_area: 400 // nb_particles = particles.nb * (canvas width *  canvas height / 1000) / density_area
                    }
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
    }
});