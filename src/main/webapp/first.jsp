<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vaishnav Library</title>

 
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
   
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

    <style>
       
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

      
        .popup-message {
            position: fixed;
            top: 20%;
            left: 30%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.85);
            color: white;
            padding: 30px;
            border-radius: 12px;
            display: none; /* Hidden initially */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
            animation: popupAnimation 0.7s cubic-bezier(0.25, 0.8, 0.25, 1) forwards;
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

        .popup-message p {
            font-size: 1.2rem;
            font-weight: 600;
            text-align: center;
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

    <!-- Register/Login Popup -->
    <div id="popupMessage" class="popup-message">
        <p class="text-lg font-semibold">Please Register and Login for more details about Vaishnav Library.</p>
        <a href="register.jsp" class="btn-popup">Register Now</a>
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
   
    <section id="feedback" class="py-20 bg-gray-800 text-white">
    <div class="container mx-auto">
        <h2 class="text-4xl font-bold mb-6 text-center">Feedback</h2>
        <p class="text-center text-gray-400 mb-8">We value your feedback to improve our library services!</p>
        <!-- Feedback Form -->
        <form id="feedbackForm" class="max-w-lg mx-auto">
            <div class="mb-4">
                <input type="text" id="name" placeholder="Your Name" class="w-full p-3 bg-gray-900 text-white border border-gray-600 rounded" required>
            </div>
            <div class="mb-4">
                <textarea id="feedbackText" placeholder="Your Feedback" class="w-full p-3 bg-gray-900 text-white border border-gray-600 rounded" required></textarea>
            </div>
            <button type="submit" class="w-full bg-blue-600 text-white py-3 rounded hover:bg-blue-700 transition-all">
                Submit Feedback
            </button>
        </form>

    </div>
</section>
    

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
        // Show the popup message for 3 seconds
        window.onload = function() {
            const popupMessage = document.getElementById("popupMessage");
            popupMessage.style.display = "block"; // Show the message
            setTimeout(() => {
                popupMessage.style.display = "none"; // Hide the message after 3 seconds
            }, 3000);
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
        


    </script>

</body>

</html>
