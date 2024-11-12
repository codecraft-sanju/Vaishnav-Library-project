<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign In & Sign Up Form</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap"
        rel="stylesheet" />
    <script src="https://kit.fontawesome.com/1788c719dd.js" crossorigin="anonymous"></script>
   
   <script src="https://accounts.google.com/gsi/client" async defer></script>
   
    <link rel="stylesheet" href="./Event/login.css" />
</head>

<body>
    <div class="container">
        <div class="container__forms">
            <div class="form">

                <form action="LoginForm" class="form__sign-in" method="post">

                    <h2 class="form__title">Sign In</h2>
                    <div class="form__input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Email" name="email1" required />
                    </div>
                    <div class="form__input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" name="pass1" required />
                    </div>
                    <input class="form__submit" type="submit" value="Sign in" />
                    <div class="forget__password">
                        <p><a href="forget_password.jsp" class="pass">Forgot your password</a></p>
                    </div>

                    <p class="form__social-text">Or Sign in with social platforms</p>
                    <div class="form__social-media">
                        <a href="#" class="form__social-icons">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="form__social-icons">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="form__social-icons" id="googleSignInButton">
                              <i class="fab fa-google"></i>
                              </a>
                        

                        <a href="#" class="form__social-icons">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                  </form>

                <form action="regForm" method="post" class="form__sign-up">

                    <h2 class="form__title">Sign Up</h2>
                    <div class="form__input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Username" name="name1" required />
                    </div>
                    <div class="form__input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="text" placeholder="Email" name="email1" required />
                    </div>
                    <div class="form__input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" name="pass1" required />
                    </div>
                    <!-- New Date of Birth Field -->
                    <div class="form__input-field">
                        <i class="fas fa-calendar"></i>
                        <input type="date" placeholder="Date of Birth" name="dob1" required />
                    </div>

                    <!-- New City Field -->
                    <div class="form__input-field">
                        <i class="fas fa-city"></i>
                        <input type="text" placeholder="City" name="city1" required />
                    </div>

                    <input class="form__submit" type="submit" value="Sign Up" />

                    <p class="form__social-text">Or Sign up with social platforms</p>
                    <div class="form__social-media">
                        <a href="#" class="form__social-icons">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="form__social-icons">
                            <i class="fab fa-twitter"></i>
                        </a>
                      <a href="#" class="form__social-icons" id="googleSignInButton">
                            <i class="fab fa-google"></i>
                             </a>
                      
                        <a href="#" class="form__social-icons">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="container__panels">
            <div class="panel panel__left">
                <div class="panel__content">
                    <h3 class="panel__title">One of us?</h3>
                    <p class="panel__paragraph">
                     Welcome back, reader! Dive back into the vast collection, pick up where you left off, and discover something new every day.
                       
                    </p>
                    <button class="btn btn-transparent" id="sign-up-btn">
                        Sign Up
                    </button>
                </div>
                <img class="panel__image"
                    src="https://stories.freepiklabs.com/storage/11588/market-launch-amico-2628.png" alt="" />
            </div>
            <div class="panel panel__right">
                <div class="panel__content">
                    <h3 class="panel__title">New here?</h3>
                    <p class="panel__paragraph">
                        New here? Join us to explore a world of knowledge, imagination, and discovery. Become a member and unlock access to countless books, resources, and more.
                    </p>
                    <button class="btn btn-transparent" id="sign-in-btn">
                        Sign In
                    </button>
                </div>
                <img class="panel__image" src="https://www.pngkey.com/png/full/444-4444270_ia-press-play-website.png"
                    alt="" />
            </div>
        </div>
    </div>
    <script>
    function handleCredentialResponse(response) {
    	 console.log("Google Credential Response:", response); 
        // Send the credential to the backend for processing
        fetch("googleSignIn", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "credential=" + encodeURIComponent(response.credential)
        }).then(response => {
            if (response.ok) {
                window.location.href = "attendance.jsp"; // Redirect on success
            } else {
                alert("Google sign-in failed. Please try again.");
            }
        });
    }

    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "1092036301830-a2fb2tmua1l2vgbps7g5ub3k4ufn65it.apps.googleusercontent.com",// Google Client ID
            callback: handleCredentialResponse
        });

        // Show the Google Sign-In prompt when the button is clicked
        document.getElementById("googleSignInButton").addEventListener("click", function (event) {
            event.preventDefault();
            google.accounts.id.prompt();
        });
    };
</script>
    
   
    <script src="./Event/login.js"></script>
</body>

</html>
