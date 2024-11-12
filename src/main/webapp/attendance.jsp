<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Calendar</title>
    <link rel="stylesheet" href="./homefiles/sss.css"/>
     <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
</head>
<body>

 <header>
        <nav class="navbar">
            <div class="logo">Vaishnav Library</div>
            <ul class="nav-links" id="nav-links">
                <button class="close-btn" id="close-btn"><i class="fa-solid fa-xmark"></i></button>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#service">Service</a></li>
                <li><a href="#rules">Rules</a></li>
                <li><a href="#callender">Calendar</a></li>
                <li><a href="#contact">Contact</a></li>
                 <li><a href="userProfile.jsp">Profile</a></li>
                
  <li id="logout"><a href="register.jsp">Logout</a></li>
              
            </ul>
            <button class="menu-btn" id="menu-btn"><i class="fa-solid fa-bars"></i></button>
        </nav>
    </header>

    <!-- Home Section -->
    <div class="container" id="home">
        <div class="content">
            <h2 class="greeting">HELLO!</h2>
            <h1 class="title" id="typed-text"></h1>
            <p class="description">
                A library management system designed to simplify the process of managing books, members, and book
                lending. Keep track of all your inventory, monitor book availability, manage members, and easily record
                issued and returned books.
            </p>
            <button id="contact-button" class="contact-button">Contact Me</button>
        </div>
        <div class="image-container">
            <img src="./homefiles/file.png" alt="Sky illustration" class="illustration">
        </div>
       
    </div>
     <div class="slogan-container">
            <p class="slogan-text">
                Your library, your knowledge. | Books are the gateway to wisdom. | Unlock knowledge one page at a time.
                | Bringing books closer to you.
            </p>
        </div>

    <!-- About Section -->
    <div class="container" id="about">
        <h1 class="title">About Our Library</h1>
        <p class="d">
            Welcome to our library! We provide a diverse collection of books and resources, from fiction to reference
            materials, to support your reading and research needs.
        </p>
        <div class="grid">
            <img src="./homefiles/library1.jpg" alt="Library" class="image">
            <img src="./homefiles/library2.jpg" alt="Library" class="image">
            <img src="./homefiles/library3.jpg" alt="Library" class="image">
            <img src="./homefiles/library4.jpg" alt="Library" class="image">
            <img src="./homefiles/library5.jpg" alt="Library" class="image">
            <img src="./homefiles/library6.jpg" alt="Library" class="image">
        </div>
    </div>

      
    
    <form action="MarkAttendance" method="post" id="attendanceForm" style="display:none;">
        <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>" />
        <input type="hidden" name="name" value="<%= session.getAttribute("name") %>" />
        <input type="hidden" name="date" id="selectedDate" />
        <input type="hidden" name="status" value="Present" />
    </form> 
    
    
    
    
    <div class="main-container" id="callender">
     
        <div class="container2">
            <div class="calendar-container">
                <h1>Interactive Calendar</h1>
                <div class="calendar-header">
                    <button class="btn" onclick="previousMonth()">&#9664;</button>
                    <span id="monthYear"></span>
                    <button class="btn" onclick="nextMonth()">&#9654;</button>
                    <select id="yearSelect" onchange="changeYear(this.value)">
                    </select>
                </div>
                <div id="calendar" class="calendar"></div>
                <div class="add-event">
                    <input type="text" id="eventName" placeholder="Event Name" />
                    <button onclick="addEvent()">Add Event</button>
                </div>
                <div id="attendanceMessage" class="attendance-message" style="display: none;"></div>
            </div>

            <div class="event-list-container">
                <div class="event-list">
                    <h2>Events</h2>
                    <div id="eventList"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Library Facilities Section -->
<div class="facilities-section" id="facilities">
    <h1 class="facilities-title">Our Library Facilities</h1>
    <p class="facilities-description">
        Our library offers a range of facilities to ensure a comfortable and productive study environment.
    </p>
    <div class="facilities-container">
        <!-- Facility Card: Wi-Fi -->
        <div class="facility-card" data-aos="fade-up">
            <i class="fas fa-wifi fa-3x facility-icon"></i>
            <h3>High-Speed Wi-Fi</h3>
            <p>Stay connected with our high-speed internet for research and study purposes.</p>
        </div>
        
        <!-- Facility Card: Air Conditioning -->
        <div class="facility-card" data-aos="fade-up" data-aos-delay="100">
            <i class="fas fa-wind fa-3x facility-icon"></i>
            <h3>Air Conditioning</h3>
            <p>Enjoy a cool, comfortable environment during your time at the library.</p>
        </div>
        
        <!-- Facility Card: Study Desks -->
        <div class="facility-card" data-aos="fade-up" data-aos-delay="200">
            <i class="fas fa-chair fa-3x facility-icon"></i>
            <h3>Quiet Study Desks</h3>
            <p>Our dedicated study desks are designed for focus and minimal distraction.</p>
        </div>

        <!-- Facility Card: Printing Services -->
        <div class="facility-card" data-aos="fade-up" data-aos-delay="300">
            <i class="fas fa-print fa-3x facility-icon"></i>
            <h3>Printing Services</h3>
            <p>Get your study materials printed easily with our affordable printing service.</p>
        </div>
        
        <!-- Facility Card: Cafeteria -->
        <div class="facility-card" data-aos="fade-up" data-aos-delay="400">
            <i class="fas fa-coffee fa-3x facility-icon"></i>
            <h3>In-house Cafeteria</h3>
            <p>Relax and recharge with a variety of snacks and beverages in our cozy cafeteria.</p>
        </div>
    </div>
</div>
    
    
    <!-- Library Rules Section -->
<div class="rules-section" id="rules">
    <h1 class="rules-title">Library Rules</h1>
    <div class="rules-content">
        <div class="rule-card">
            <h3 class="rule-title">Quiet Environment</h3>
            <p class="rule-description">Please maintain silence at all times. This is a place for reading, learning, and reflection.</p>
        </div>
        <div class="rule-card">
            <h3 class="rule-title">Respect the Books</h3>
            <p class="rule-description">Handle books with care. Keep them clean and return them on time.</p>
        </div>
        <div class="rule-card">
            <h3 class="rule-title">Food and Drinks</h3>
            <p class="rule-description">Food and beverages are not allowed inside the library to maintain cleanliness.</p>
        </div>
        <div class="rule-card">
            <h3 class="rule-title">Mobile Phones</h3>
            <p class="rule-description">Keep mobile phones on silent mode and avoid unnecessary conversations.</p>
        </div>
        <div class="rule-card">
            <h3 class="rule-title">Personal Belongings</h3>
            <p class="rule-description">Do not leave your belongings unattended. The library is not responsible for lost items.</p>
        </div>
    </div>
</div>
    
    
    <!-- Footer Section -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">Vaishnav Library</div>
        <p class="footer-description">
            Bringing knowledge closer to you. Explore, read, and unlock new realms of wisdom.
        </p>
        
        <div class="footer-socials">
            <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
        </div>
        
        <ul class="footer-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#service">Service</a></li>
            <li><a href="#rules">Rules</a></li>
            <li><a href="#main-container">Calendar</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
        
        <p class="footer-copyright">
            &copy; 2023 Vaishnav Library. All rights reserved.
        </p>
    </div>
</footer>

    
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    <script src="libr.js"></script>
</body>
</html>
