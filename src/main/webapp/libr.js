document.addEventListener("DOMContentLoaded", function () {
  // Typed.js for the animated text
  const options = {
    strings: [
      "Track books, members, and issues seamlessly",
      "Digitalize your library management",
      "Efficient library solutions at your fingertips"
    ],
    typeSpeed: 50,
    backSpeed: 30,
    loop: true
  };

  new Typed("#typed-text", options);

  // Smooth scroll to contact section
  const contactButton = document.getElementById("contact-button");
  contactButton.addEventListener("click", () => {
    const offset = 100;
    const contactPosition = contactButton.getBoundingClientRect().top;
    const offsetPosition = contactPosition + window.scrollY - offset;

    window.scrollTo({
      top: offsetPosition,
      behavior: 'smooth'
    });
  });

  // Toggle mobile menu 
  const menuBtn = document.getElementById("menu-btn");
  const closeBtn = document.getElementById("close-btn");
  const navLinks = document.getElementById("nav-links");

  menuBtn.addEventListener("click", () => {
    navLinks.classList.add("active");
  });

  closeBtn.addEventListener("click", () => {
    navLinks.classList.remove("active");
  });

  // Close menu when a link is clicked
  const navItems = navLinks.querySelectorAll("li a");
  navItems.forEach(item => {
    item.addEventListener("click", () => {
      navLinks.classList.remove("active");
    });
  });
});

const today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();
let selectedDate = null;

const calendarElement = document.getElementById("calendar");
const eventListElement = document.getElementById("eventList");
const eventNameInput = document.getElementById("eventName");
const monthYearElement = document.getElementById("monthYear");
const yearSelect = document.getElementById("yearSelect");
const attendanceMessage = document.getElementById("attendanceMessage");

let events = JSON.parse(localStorage.getItem("events")) || {};

function populateYearOptions() {
  for (let year = currentYear - 50; year <= currentYear + 50; year++) {
    const option = document.createElement("option");
    option.value = year;
    option.textContent = year;
    if (year === currentYear) option.selected = true;
    yearSelect.appendChild(option);
  }
}

function updateMonthYearDisplay() {
  const monthNames = [
    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December",
  ];
  monthYearElement.textContent = `${monthNames[currentMonth]} ${currentYear}`;
}

function generateCalendar(month, year) {
  calendarElement.innerHTML = "";
  const firstDay = new Date(year, month).getDay();
  const daysInMonth = new Date(year, month + 1, 0).getDate();

  for (let i = 0; i < firstDay; i++) {
    const emptyDay = document.createElement("div");
    calendarElement.appendChild(emptyDay);
  }

  for (let day = 1; day <= daysInMonth; day++) {
    const dayElement = document.createElement("div");
    dayElement.classList.add("day");
    dayElement.textContent = day;
    dayElement.onclick = () => selectDate(day);

    if (
      selectedDate &&
      selectedDate.day === day &&
      selectedDate.month === month &&
      selectedDate.year === year
    ) {
      dayElement.classList.add("selected");
    }

    calendarElement.appendChild(dayElement);
  }
}

function selectDate(day) {
  selectedDate = { day, month: currentMonth, year: currentYear };
  generateCalendar(currentMonth, currentYear);
  displayEvents();
  markAttendance(day);
}

function previousMonth() {
  if (currentMonth === 0) {
    currentMonth = 11;
    currentYear--;
  } else {
    currentMonth--;
  }
  updateMonthYearDisplay();
  generateCalendar(currentMonth, currentYear);
}

function nextMonth() {
  if (currentMonth === 11) {
    currentMonth = 0;
    currentYear++;
  } else {
    currentMonth++;
  }
  updateMonthYearDisplay();
  generateCalendar(currentMonth, currentYear);
}

function changeYear(year) {
  currentYear = parseInt(year, 10);
  updateMonthYearDisplay();
  generateCalendar(currentMonth, currentYear);
}

function addEvent() {
  const eventName = eventNameInput.value.trim();
  if (eventName && selectedDate) {
    const dateKey = `${selectedDate.year}-${selectedDate.month}-${selectedDate.day}`;
    if (!events[dateKey]) events[dateKey] = [];
    events[dateKey].push(eventName);
    localStorage.setItem("events", JSON.stringify(events));
    eventNameInput.value = "";
    displayEvents();
  }
}

function displayEvents() {
  eventListElement.innerHTML = "";
  if (selectedDate) {
    const dateKey = `${selectedDate.year}-${selectedDate.month}-${selectedDate.day}`;
    const dayEvents = events[dateKey] || [];
    dayEvents.forEach((event) => {
      const eventElement = document.createElement("div");
      eventElement.classList.add("event");
      eventElement.textContent = event;
      eventListElement.appendChild(eventElement);
    });
  }
}

function markAttendance(day) {
  const currentDate = new Date();

  // Check if selected date matches today's date
  if (
    currentDate.getDate() === day &&
    currentDate.getMonth() === currentMonth &&
    currentDate.getFullYear() === currentYear
  ) {
    // Set the selected date and show the success message
    document.getElementById("selectedDate").value = `${currentYear}-${currentMonth + 1}-${day}`;
    attendanceMessage.style.display = "block";
    attendanceMessage.textContent = "Attendance marked successfully for today!";

    // Delay form submission to allow success message to display
    setTimeout(() => {
      document.getElementById("attendanceForm").submit();
    }, 1000); // Adjust delay time if necessary
  } else {
    // Show the message for selecting today's date
    attendanceMessage.style.display = "block";
    attendanceMessage.textContent = "Please select today's date for attendance.";
  }

  // Hide the message after 2 seconds
  setTimeout(() => {
    attendanceMessage.style.display = "none";
  }, 2000);
}

populateYearOptions();
updateMonthYearDisplay();
generateCalendar(currentMonth, currentYear);









