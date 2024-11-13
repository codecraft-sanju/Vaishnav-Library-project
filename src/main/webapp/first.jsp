<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vaishnav Library</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
 
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
   
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

    <style>
     .glow-on-hover:hover {
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.8);
        }

        .pulse-animation {
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                box-shadow: 0 0 10px rgba(255, 255, 0, 0.8);
            }
            50% {
                transform: scale(1.1);
                box-shadow: 0 0 30px rgba(255, 255, 0, 1);
            }
        }

        .confetti-canvas {
            pointer-events: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1000;
        }
    
       .glow-on-hover:hover {
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.8);
}
       
        .menu-slide {
            animation: slideIn 0.4s ease-out;
        }

        .menu-fade {
            animation: fadeIn 0.4s ease-out;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .sticky-nav {
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .hover\:scale-105:hover {
            transform: scale(1.05);
        }

        .parallax {
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
        }

      

        @keyframes popupAnimation {
            from {
                opacity: 0;
                transform: translateY(-40px) scale(0.8);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

    .popup-message {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    z-index: 1000;
    transition: transform 0.8s cubic-bezier(0.68, -0.55, 0.27, 1.55), opacity 0.5s ease;
    opacity: 0;
}

.popup-message.show {
    transform: translate(-50%, -50%) scale(1);
    opacity: 1;
}
       
    
        .btn-popup {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-popup:hover {
            background-color: #45a049;
        }

        .close-menu {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: transparent;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }
        /* Feedback Section */
        .feedback-card {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
     
        
    </style>
</head>

<body class="bg-gray-900 text-white font-sans leading-normal tracking-normal">

    <!-- Navbar -->
    <nav id="navbar" class="sticky-nav bg-gray-800 p-4 fixed w-full top-0 z-50 shadow-md">
        <div class="container mx-auto flex justify-between items-center">
            <a href="#home" class="text-white font-bold text-xl md:text-2xl hover:text-blue-400">Vaishnav Library</a>
            <!-- Desktop Menu -->
            <div class="hidden md:flex items-center justify-center space-x-6 text-white">
                <a href="#home" class="hover:text-blue-400">Home</a>
                <a href="#about" class="hover:text-blue-400">About Us</a>
                <a href="#membership" class="hover:text-blue-400">Membership</a>
                <a href="#feedback" class="hover:text-blue-400">Feedback</a>
                <a href="#rules" class="hover:text-blue-400">Rules</a>
                <a href="#events" class="hover:text-blue-400">Events</a>
                <a href="#contact" class="hover:text-blue-400">Contact</a>
                <a href="adminLogin.jsp" class="hover:bg-blue-500 bg-blue-700 rounded-lg p-2 cursor-pointer">Admin Login</a>
            </div>

            <!-- Mobile Menu Button -->
            <button id="hamburgerButton" class="md:hidden text-white focus:outline-none" aria-label="Toggle mobile menu">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
            </button>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu" class="hidden fixed inset-0 bg-gray-900 bg-opacity-90 flex-col items-center space-y-6 pt-16 z-50 text-lg text-white menu-slide">
            <!-- Close Button -->
            <button id="closeMenu" class="close-menu ">×</button>
            <a href="#home" class=" hover:text-blue-400 ">Home</a>
            <a href="#about" class="hover:text-blue-400">About Us</a>
            <a href="#membership" class="hover:text-blue-400">Membership</a>
            <a href="#feedback" class="hover:text-blue-400">Feedback</a>
            <a href="#rules" class="hover:text-blue-400">Rules</a>
            <a href="#events" class="hover:text-blue-400">Events</a>
            <a href="#contact" class="hover:text-blue-400">Contact</a>
            <a href="adminLogin.jsp" class="hover:text-blue-400">Admin Login</a>
        </div>
    </nav>

    <!-- Home Section -->
    <section id="home" class="h-screen flex flex-col items-center justify-center bg-cover bg-center relative parallax"
        style="background-image: url('4.jpeg');">
        <div class="absolute inset-0 bg-black opacity-50"></div>
        <div class="relative z-10 text-center text-white">
            <div id="welcomeText" class="text-4xl font-bold mb-6"></div>
            <div id="slogan" class="text-xl mt-4">Your Gateway to Knowledge and Growth</div>
            <script>
                new Typed("#welcomeText", {
                    strings: ["Welcome to Vaishnav Library", "Explore. Learn. Grow."],
                    typeSpeed: 100,
                    backSpeed: 50,
                    loop: true
                });
            </script>
            <!-- Sign Up & Sign In Buttons -->
            <div class="mt-8 space-x-4">
                <a href="register.jsp" class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-all">Sign Up</a>
                <a href="register.jsp" class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-all">Sign In</a>
            </div>
        </div>
    </section>

   <div id="popupMessage" class="popup-message transform scale-0">
    <div class="bg-gradient-to-r from-blue-500 via-purple-600 to-pink-500 p-6 rounded-xl shadow-lg text-center">
        <p class="text-2xl font-bold">Welcome to Vaishnav Library!</p>
        <p class="text-lg mt-2">Register and Login to explore more.</p>
        <a href="register.jsp" class="btn-popup mt-4">Get Started</a>
    </div>
</div>
   

    <!-- About Us Section -->
    <section id="about" class="py-20 bg-gray-900 text-white">
        <div class="container mx-auto text-center">
            <h2 class="text-4xl font-bold mb-8">About Us</h2>
            <p class="text-lg text-gray-300 mb-8">Vaishnav Library is a hub of knowledge and creativity, dedicated to
                providing students and researchers with access to valuable resources. Established in 1995, our mission
                is to foster a love of learning and make information accessible to all.</p>
            <p class="text-lg text-gray-300 mb-8">With a collection of over 50,000 books, journals, and digital
                resources, we strive to create an environment where students can grow, learn, and succeed.</p>
        </div>
    </section>
    
    
    
    <section id="membership" class="py-20 bg-gray-800 text-white">
    <div class="container mx-auto text-center">
        <h2 class="text-4xl font-bold mb-10">Membership Plans</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Free Membership -->
            <div class="bg-gray-900 rounded-lg shadow-lg p-6 hover:scale-105 transition-transform duration-300">
                <h3 class="text-2xl font-bold text-blue-400">Free Membership</h3>
                <p class="text-gray-400 my-4">Access to basic library resources and books.</p>
                <p class="text-4xl font-bold text-green-500">Free</p>
                <a href="#contact" class="mt-6 inline-block px-6 py-3 bg-blue-600 rounded hover:bg-blue-700 transition-all">
                    Sign Up
                </a>
            </div>
            <!-- Silver Membership -->
            <div class="bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg shadow-lg p-6 hover:scale-105 transition-transform duration-300">
                <h3 class="text-2xl font-bold text-white">Silver Membership</h3>
                <p class="text-gray-200 my-4">Borrow up to 10 books/month and access study areas.</p>
                <p class="text-4xl font-bold text-white">Rs700/month</p>
                <a href="#contact" class="mt-6 inline-block px-6 py-3 bg-gray-900 rounded hover:bg-gray-700 transition-all">
                    Get Started
                </a>
            </div>
            <!-- Gold Membership -->
            <div class="bg-gray-900 rounded-lg shadow-lg p-6 hover:scale-105 transition-transform duration-300">
                <h3 class="text-2xl font-bold text-yellow-400">Gold Membership</h3>
                <p class="text-gray-400 my-4">Unlimited borrowing and exclusive access to events.</p>
                <p class="text-4xl font-bold text-yellow-400">Rs1900/3month</p>
                <a href="#contact" class="mt-6 inline-block px-6 py-3 bg-yellow-500 rounded hover:bg-yellow-600 transition-all">
                    Join Now
                </a>
            </div>
        </div>
    </div>
</section>
    
    <section id="spoken-english" class="py-20 bg-gradient-to-r from-blue-900 via-purple-900 to-black text-white">
    <div class="container mx-auto text-center">
        <h2 class="text-4xl font-bold mb-6 text-yellow-300">Free Spoken English Classes</h2>
        <p class="text-gray-300 text-lg mb-8">
            Vaishnav Library is offering <span class="text-yellow-400">free spoken English classes</span> for 3 months to help you enhance your communication skills.
        </p>
        <div class="relative group">
            <a id="enrollButton" href="#" class="px-8 py-4 bg-yellow-500 text-black rounded-lg text-lg font-bold hover:bg-yellow-600 transition-all">
               Enroll Now
             </a>
            </a>
        </div>
        <div class="mt-8 text-gray-400 text-sm">
            Limited seats available.For more information, please contact +91 7069449963.
        </div>
    </div>
</section>
     
    <section id="feedback" class="py-20 bg-gray-800 text-white">
    <div class="container mx-auto">
        <h2 class="text-4xl font-bold mb-6 text-center">We Value Your Feedback</h2>
        <p class="text-center text-gray-400 mb-8">Help us improve by sharing your thoughts!</p>

        <!-- Feedback Card -->
        <div class="max-w-lg mx-auto p-6 bg-gradient-to-r from-blue-600 to-purple-700 rounded-lg shadow-lg feedback-card relative">
            <!-- Feedback Form -->
            <form id="feedbackForm" class="space-y-4">
                <div class="relative group">
                    <input type="text" id="name" placeholder="Your Name" 
                        class="w-full p-3 bg-gray-900 text-white border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-blue-400 focus:border-transparent transition-all duration-300">
                    
                </div>

                <div class="relative group">
                    <textarea id="feedbackText" placeholder="Your Feedback" 
                        class="w-full p-3 bg-gray-900 text-white border border-gray-600 rounded focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent transition-all duration-300"></textarea>
                   
                </div>

                <!-- Animated Submit Button -->
                <div class="relative group">
                    <button type="submit" 
                        class="w-full bg-gradient-to-r from-blue-500 to-purple-500 text-white py-3 rounded hover:shadow-lg transform hover:-translate-y-1 hover:scale-105 transition-all duration-300">
                        Submit Feedback
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>


<!-- Confetti Animation on Submit -->
<div id="confetti" class="hidden fixed inset-0 z-50 pointer-events-none">
    <canvas id="confettiCanvas"></canvas>
</div>
    
    

    <footer class="bg-gradient-to-r from-gray-800 to-black text-white py-12 mt-16">
        <div class="container mx-auto text-center md:text-left">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
                <div class="space-y-4">
                    <h3 class="text-2xl font-semibold">Vaishnav Library</h3>
                    <p class="text-sm">Empowering knowledge and education through our library services.</p>
                    <a href="https://www.facebook.com" class="text-blue-400 hover:text-blue-600">Facebook</a>
                    <a href="https://www.instagram.com" class="text-blue-400 hover:text-blue-600">Instagram</a>
                    <a href="https://www.twitter.com" class="text-blue-400 hover:text-blue-600">Twitter</a>
                </div>
                <div class="space-y-4">
                    <h3 class="text-2xl font-semibold">Contact Us</h3>
                    <p class="text-sm">Admin: <strong>Nirmal Sir</strong></p>
                    <p class="text-sm">Phone: <a href="tel:+917069449963" class="hover:text-gray-400">+91 7069449963</a></p>
                    <p class="text-sm">Address: <a href="https://maps.google.com/?q=Your+Library+Address" class="hover:text-gray-400">Oppsite of Balaji Palace,kenpura road, Rani</a></p>
                </div>
            </div>
            <div class="mt-12 border-t border-gray-600 pt-4">
                <p class="text-sm text-gray-400">&copy; 2024 Vaishnav Library. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
    window.onload = function() {
        const popupMessage = document.getElementById("popupMessage");
        popupMessage.classList.add("show"); // Show with animation
        setTimeout(() => {
            popupMessage.classList.remove("show"); // Hide after 4 seconds
        }, 4000);
    };


     // Toggle mobile menu visibility
        document.getElementById("hamburgerButton").addEventListener("click", () => {
            const mobileMenu = document.getElementById("mobileMenu");
            mobileMenu.classList.toggle("hidden");
            mobileMenu.classList.toggle("flex");
        });

        // Close mobile menu when close button is clicked
        document.getElementById("closeMenu").addEventListener("click", () => {
            const mobileMenu = document.getElementById("mobileMenu");
            mobileMenu.classList.add("hidden");
            mobileMenu.classList.remove("flex");
        });

        // Close mobile menu when a link is clicked
        const mobileLinks = document.querySelectorAll("#mobileMenu a");
        mobileLinks.forEach(link => {
            link.addEventListener("click", () => {
                const mobileMenu = document.getElementById("mobileMenu");
                mobileMenu.classList.add("hidden");
                mobileMenu.classList.remove("flex");
            });
        });

        // Sticky navbar transition on scroll
        window.addEventListener("scroll", () => {
            const navbar = document.getElementById("navbar");
            if (window.scrollY > 50) {
                navbar.classList.add("bg-opacity-100", "shadow-lg");
                navbar.classList.remove("bg-opacity-75");
            } else {
                navbar.classList.add("bg-opacity-75");
                navbar.classList.remove("bg-opacity-100", "shadow-lg");
            }
        });
        
        document.getElementById('feedbackForm').addEventListener('submit', (event) => {
            event.preventDefault();
            
            // Show confetti animation
            const confettiContainer = document.getElementById('confetti');
            confettiContainer.classList.remove('hidden');
            launchConfetti();

            // Reset the form after submission
            setTimeout(() => {
                confettiContainer.classList.add('hidden');
                event.target.reset();
            }, 3000);
        });

        // Function for Confetti Animation
        function launchConfetti() {
            const canvas = document.getElementById('confettiCanvas');
            const confetti = canvas.getContext('2d');
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            const particles = [];
            const colors = ['#FFC700', '#FF0000', '#00FF00', '#00C3FF', '#FF00D9'];

            for (let i = 0; i < 100; i++) {
                particles.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height,
                    color: colors[Math.floor(Math.random() * colors.length)],
                    size: Math.random() * 5 + 1,
                    velocityX: Math.random() * 2 - 1,
                    velocityY: Math.random() * 2 - 1,
                });
            }

            function drawConfetti() {
                confetti.clearRect(0, 0, canvas.width, canvas.height);
                particles.forEach(p => {
                    confetti.fillStyle = p.color;
                    confetti.beginPath();
                    confetti.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                    confetti.fill();
                });
            }

            function updateConfetti() {
                particles.forEach(p => {
                    p.x += p.velocityX;
                    p.y += p.velocityY;

                    if (p.x < 0 || p.x > canvas.width || p.y < 0 || p.y > canvas.height) {
                        p.x = Math.random() * canvas.width;
                        p.y = Math.random() * canvas.height;
                    }
                });
            }

            function loop() {
                drawConfetti();
                updateConfetti();
                requestAnimationFrame(loop);
            }
            loop();
        }
        
        
        
     // Show confetti when Enroll Now button is clicked
        const enrollButton = document.getElementById("enrollButton");
        const canvas = document.getElementById("confettiCanvas");
        const ctx = canvas.getContext("2d");

        function launchConfetti() {
            const confettiColors = ["#FFC700", "#FF0000", "#00FF00", "#00C3FF", "#FF00D9"];
            const confetti = [];

            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            for (let i = 0; i < 100; i++) {
                confetti.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height,
                    size: Math.random() * 5 + 1,
                    color: confettiColors[Math.floor(Math.random() * confettiColors.length)],
                    speedX: Math.random() * 2 - 1,
                    speedY: Math.random() * 2 - 1,
                });
            }

            function draw() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                confetti.forEach(p => {
                    ctx.fillStyle = p.color;
                    ctx.beginPath();
                    ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                    ctx.fill();
                });
            }

            function update() {
                confetti.forEach(p => {
                    p.x += p.speedX;
                    p.y += p.speedY;

                    if (p.x < 0 || p.x > canvas.width || p.y < 0 || p.y > canvas.height) {
                        p.x = Math.random() * canvas.width;
                        p.y = Math.random() * canvas.height;
                    }
                });
            }

            function animate() {
                draw();
                update();
                requestAnimationFrame(animate);
            }

            canvas.classList.remove("hidden");
            animate();

            setTimeout(() => {
                canvas.classList.add("hidden");
                ctx.clearRect(0, 0, canvas.width, canvas.height);
            }, 3000);
        }

        enrollButton.addEventListener("click", launchConfetti);


    </script>

</body>

</html>
