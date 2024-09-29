<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewort" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="OmarPlays,OmarPlays Mod, OmarPlays Menu, OmarPlays Mod Menu, GTA Cheat">
        <meta name="description" content="Unlock powerful features and dominate with our cutting-edge cheat software, OmarPlays. Easy to install, regularly updated, and designed for elite gamers. Transform your play today!">
        <link rel="stylesheet" href="/main.css">
        <link rel="stylesheet" href="/Loading.css">
        <link rel="stylesheet" href="/SupportedGames.css">
        <link rel="icon" type="image/x-icon" href="/images/OP_logo.png">
        <!--Font Awesome CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>OmarPlays - Login</title>
        <link rel="stylesheet" href="/nav.css">
        <link rel="stylesheet" href="/copy.css">
        <link href="https://cdn.jsdelivr.net/npm/pace-js@latest/pace-theme-default.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="login.css">
    </head>
    
    <style>
.pace .pace-progress {
    background: #cf9cff; /* Custom color */
}
        @font-face {
        font-family: Designer;
        src: url(/fonts/Designer.otf);
        }
        @font-face {
        font-family: American;
        src: url(/fonts/MADE\ TOMMY\ Bold_PERSONAL\ USE.otf);
        }

        h1.CopyrightH1, h2.CopyrightH1, h3.CopyrightH1 {
            font-weight: 100;
            margin-top: 20px;
            transition: 0.5s;
        }
        h1.CopyrightH1 {
            font-size: 45px;
            font-family: Designer;
            text-decoration: underline;
            margin-left: 50px;
        }
        h1.MainTitle{
          font-family: Designer;
          color: white;
          font-weight: 100;
          font-size: 45px;
          text-align: center;
        }
        h2.CopyrightH1 {
            font-size: 20px;
            font-family: American;
            color: white;
            margin-left: 20px;
            margin-right: 20px;
        }

        a.your {
            color: #cf9cff;
            transition: 0.5s;
            border-radius: 5px;
            text-decoration: underline;
        }
        a.your:hover {
            cursor:default;
            color: #c077ff;
            transition: 0.5s;
            background-color: #282329;
            padding: 10px 13px;
            border-radius: 20px;
            cursor:grab;
            text-decoration: underline #c077ff00;
        }
        a.Titles, a.Titles:visited {
            color: #cf9cff;
            transition: 0.5s;
            border-radius: 5px;
            text-decoration: underline;
        }
        a.Titles:hover {
            cursor:default;
            color: #c077ff;
            transition: 0.5s;
            background-color: #282329;
            padding: 10px 13px;
            border-radius: 20px;
            cursor:grab;
            text-decoration: underline #282329;
        }


        .OP {
            width: 30px;
            cursor: pointer;
        }
        .cheats{
            display: flex;
            align-self:center;
            justify-content: center;
            flex-wrap: wrap;
        }
        .cheat {
            width: 600px;
            margin: 20px;
            cursor: pointer;
            transition: 0.5s ease-in-out;

        }
        .cheat:hover {
            -webkit-transform: scale(1.1);
            transform: scale(1.1);
            
        }

/* ------------------------------------- */

/* From Uiverse.io by SouravBandyopadhyay */ 
.notification {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  isolation: isolate;
  position: relative;
  width: 345px;
  height: 300px;
  background: #29292c;
  border-radius: 1rem;
  overflow: hidden;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  font-size: 16px;
  --color: #32a6ff;
  text-align: center;
  align-content: center;
  transition: 0.5s ease;
}
.notification img {
    width: 150px;
    height: 150px;
    margin-bottom: 0px;
    border-radius: 20px;
    transition: opacity 0.5s ease;
    z-index: 2;
    left: 50%;
}

.notification:before {
  position: absolute;
  content: "";
  inset: 0.0625rem;
  border-radius: 0.9375rem;
  background: #18181b;
  z-index: 2
}

.notification:after {
  position: absolute;
  content: "";
  width: 0.25rem;
  inset: 0.65rem auto 0.65rem 0.5rem;
  border-radius: 0.125rem;
  background: var(--gradient);
  transition: transform 300ms ease;
  z-index: 4;
}

.notification:hover {
    transform: scale(1.05);
    box-shadow: 0 0px 19px rgba(193, 142, 255, 0.079);
    margin-left: 20px;
    margin-right: 20px;
}

.notification:hover:after {
  transform: translateX(0.15rem)
}

.notititle {
  color: var(--color);
  padding: 0.65rem 0.25rem 0.4rem 1.25rem;
  font-weight: 500;
  font-size: 1.1rem;
  transition: transform 300ms ease;
  z-index: 5;
  font-weight: bolder;
}

.notification:hover .notititle {
  transform: translateX(0.15rem)
}

.notibody {
  color: #99999d;
  padding: 0 1.25rem;
  transition: transform 300ms ease;
  z-index: 5;
}
/*
.notification:hover .notibody {
  transform: translateX(0.25rem)
}
  */

.notiglow,
.notiborderglow {
  position: absolute;
  width: 20rem;
  height: 20rem;
  transform: translate(-50%, -50%);
  background: radial-gradient(circle closest-side at center, rgb(180, 118, 255), transparent);
  opacity: 0;
  transition: opacity 300ms ease;
}

.notiglow {
  z-index: 3;
}

.notiborderglow {
  z-index: 1;
}

.notification:hover .notiglow {
  opacity: 0.1
}

.notification:hover .notiborderglow {
  opacity: 0.1
}

.note {
  color: var(--color);
  position: fixed;
  top: 80%;
  left: 50%;
  transform: translateX(-50%);
  text-align: center;
  font-size: 0.9rem;
  width: 75%;
}
.Box {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-top: 40px;
    flex-wrap: wrap; /* This allows the items to wrap to the next line */
}
/* ------------------------------------- */

/* From Uiverse.io by gharsh11032000 */ 
.buttonGame {
  cursor: pointer;
  position: relative;
  padding: 10px 24px;
  font-size: 18px;
  color: rgb(193, 142, 255);
  border: 2px solid rgb(193, 142, 255);
  border-radius: 34px;
  background-color: transparent;
  font-weight: 600;
  transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
  overflow: hidden;
  margin-top: 15px;
  box-shadow: 0 0px 17px rgba(193, 142, 255, 0.332);
}

.buttonGame::before {
  content: '';
  position: absolute;
  inset: 0;
  margin: auto;
  width: 50px;
  height: 50px;
  border-radius: inherit;
  scale: 0;
  z-index: -1;
  background-color: rgba(193, 142, 255, 0.585);
  transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
}

.buttonGame:hover::before {
  scale: 5.2;
}

.buttonGame:hover {
  color: #ffffff;
  scale: 1.1;
  box-shadow: 0 0px 20px rgba(193, 142, 255, 0.466);
}

.buttonGame:active {
  scale: 1;
}

/* ------------------------------------- */
p {
    font-size: 1em;
    color: #ffffff;
    font-family: American;
}

/* ------------------------------------- */

/* From Uiverse.io by vinodjangid07 */ 
.button {
  bottom: 2%;
  left: 1%;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: rgb(20, 20, 20);
  border: none;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0px 0px 0px 4px rgba(180, 160, 255, 0.253);
  cursor: pointer;
  transition-duration: 0.3s;
  overflow: hidden;
  position: fixed;
  z-index: 1;
  opacity: 0;  /* Initially invisible */
  visibility: hidden;  /* Hides the element entirely */
}

/* Make the button visible when it's active */
.button.active {
  opacity: 1;
  visibility: visible;
}

.svgIcon {
  width: 12px;
  transition-duration: 0.3s;
}

.svgIcon path {
  fill: white;
}

.button:hover {
  width: 140px;
  border-radius: 50px;
  transition-duration: 0.3s;
  background-color: rgb(181, 160, 255);
  align-items: center;
}

.button:hover .svgIcon {
  /* width: 20px; */
  transition-duration: 0.3s;
  transform: translateY(-200%);
}

.button::before {
  position: absolute;
  bottom: -20px;
  content: "Back to Top";
  color: white;
  /* transition-duration: .3s; */
  font-size: 0px;
}

.button:hover::before {
  font-size: 13px;
  opacity: 1;
  bottom: unset;
  /* transform: translateY(-30px); */
  transition-duration: 0.3s;
}

/* ------------------------------------- */

.Banner {
    width: 100%;
    height: 100vh;
    background-image: linear-gradient(#0c0c0c6b, #00000000, #00000000, #00000000, #00000000, #00000000, #00000000, #00000000, #00000000), url(images/BG_Header1.png);
    background-size: cover;
    background-position: center;
}
/* ------------------------------------- */

footer {
    background-color: transparent;
    color: #fff;
    padding: 30px;
    text-align: left;
    margin-top: 150px;
}

.footer-container {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.footer-column {
    width: 22%;
    margin-bottom: 20px;
}

.footer-column h3 {
    color: #fff;
    font-family:  Designer;
}

.footer-column ul {
    list-style-type: none;
    padding: 0;
    font-family:  American;
}

.footer-column ul li {
    margin: 10px 0;
}

.footer-column ul li a {
    color: #ddd;
    text-decoration: none;
    transition: 0.4s;
}

.footer-column ul li a:hover {
    color: #ffffff;
    padding: 3px;
    text-shadow: 0px 0px 10px rgb(255, 255, 255);
}

.newsletter input[type="email"] {
    padding: 10px;
    width: 60%;
    border: none;
    margin-right: 10px;
    border-radius: 5px;
}

.newsletter button {
    padding: 10px 20px;
    background-color: #f15b2a;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.newsletter button:hover {
    background-color: #e14d1a;
}

.social-icons {
    margin: 20px 0;
}

.social-icons a {
    margin-right: 10px;
}

.social-icons img {
    width: 30px;
    height: 30px;
}

.contact-info p {
    margin: 5px 0;
    color: #ddd;
}

.footer-bottom {
    border-top: 1px solid #555;
    padding-top: 20px;
    text-align: center;
    font-family:  American;
}

.footer-bottom p {
    margin: 0;
    color: #ddd;
}

.footer-links {
    margin-top: 10px;
}

.footer-links a {
    margin: 0 10px;
    color: #ddd;
    text-decoration: none;
}

.footer-links a:hover {
    color: #fff;
}
/* ---------- */
#login-no {
  cursor: not-allowed;
 }
/* ---------- */
</style>

<button class="button">
  <svg class="svgIcon" viewBox="0 0 384 512">
    <path
      d="M214.6 41.4c-12.5-12.5-32.8-12.5-45.3 0l-160 160c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L160 141.2V448c0 17.7 14.3 32 32 32s32-14.3 32-32V141.2L329.4 246.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3l-160-160z"
    ></path>
  </svg>
</button>
<!--
<div class="navbar">
            <nav>
                <div class="navContainer">
                  <button class="nav-toggle">Menu</button>
                <section>
                  <a class="Item" href="#">HOME</a>
                  <a class="Item" href="#">CHEATS</a>
                  <a class="Item" href="#">SHOWCASES</a>
                  <a class="Item" href="#">DISCORD</a>
                </section>
                </div>
                </nav>
</div>
-->
<div class="navbar">
  <button class="nav-toggle">MENU</button>
  <ul class="nav-items">
      <li><a class="Item" href="https://omarmenu.xyz/">HOME</a></li>
      <li class="dropdown">
        <a class="Item" href="#">CHEATS</a>
        <ul class="dropdown-content">
            <li><a href="https://omarmenu.xyz/our-cheats">Our Cheats</a></li>
            <li><a href="https://omarmenu.xyz/others-cheats">Others Cheats</a></li>
        </ul>
    </li>
    <li><a id="login-no" class="Item" href="#">LOGIN</a></li>
  </ul>
</div>

<!--
<form class="form-control" action="">
  <p class="title">Login</p>
  <div class="input-field">
    <input required="" class="input" type="text" />
    <label class="label" for="input">Enter Email</label>
  </div>
  <div class="input-field">
    <input required="" class="input" type="password" />
    <label class="label" for="input">Enter Password</label>
  </div>
  <p>Don't have an account?<a class="SwitchBTN" href="#"> Register</a></p>
  <button class="submit-btn">LOGIN</button>
</form>

<form class="form-control" action="">
    <p class="title">Register</p>
    <div class="input-field">
        <input required="" class="input" type="text" />
        <label class="label" for="input">Enter Username</label>
      </div>
    <div class="input-field">
      <input required="" class="input" type="text" />
      <label class="label" for="input">Enter Email</label>
    </div>
    <div class="input-field">
      <input required="" class="input" type="password" />
      <label class="label" for="input">Enter Password</label>
    </div>
    <p>Already have an Account?<a class="SwitchBTN" href="#"> Login</a></p>
    <button class="submit-btn">LOGIN</button>
  </form>
-->
<!-- Login Form -->
<!-- Login Form -->
<div class="form-container" id="form-container">
    <form class="form-control" id="login-form" action="register.php" method="post">
      <p class="title">Login</p>
      <div class="input-field">
        <input id="username" required="" class="input" type="text" name="username" id="username" />
        <label class="label" for="input">Enter Username</label>
      </div>
      <div class="input-field">
        <input id="password" required="" class="input" type="password" name="password" id="password" />
        <label class="label" for="input" >Enter Password</label>
      </div>
      <p>Don't have an account?<a class="SwitchBTN" href="#" onclick="toggleForm()"> Register</a></p>
      <button class="submit-btn" type="submit" name="signIn">LOGIN</button>
    </form>
  
    <!-- Register Form -->
    <form class="form-control" id="register-form" action="register.php" method="post">
      <p class="title">Register</p>
      <div class="input-field">
        <input required="" class="input" type="text" name="username" id="username" />
        <label class="label" for="input">Enter Username</label>
      </div>
      <div class="input-field">
        <input required="" class="input" type="password" name="password" id="password" />
        <label class="label" for="input" >Enter Password</label>
      </div>
      <p>Already have an account?<a class="SwitchBTN" href="#" onclick="toggleForm()"> Login</a></p>
      <button class="submit-btn" type="submit" name="signUp">REGISTER</button>
    </form>
  </div>
  
  <div id="message"></div>



    <footer>
      <div class="footer-container">
          <div class="footer-column">
              <h3>Programs</h3>
              <ul>
                <li><a href="https://omarmenu.xyz/copyright">Copyright</a></li>
                <li><a href="https://omarmenu.xyz/our-cheats">Our Cheats</a></li>
                <li><a href="https://omarmenu.xyz/others-cheats">Others Cheats</a></li>
              </ul>
          </div>
          <div class="footer-column">
              <h3>Services</h3>
              <ul>
                  <li><a href="https://omarmenu.xyz/about-us/">About Us</a></li>
                  <li><a href="https://omarmenu.xyz/supported-games/">Supported Games</a></li>
                  <li><a href="https://omarmenu.xyz/supported-cheats/">Supported Cheats</a></li>
  
              </ul>
          </div>
          <div class="footer-column">
              <h3>Workspace</h3>
              <ul>
                  <li><a href="https://omarmenu.xyz/team-&-partners/">Team & Partners</a></li>
                  <li><a href="https://omarmenu.xyz/submit-your-cheat/">Submit Your Cheat</a></li>
                  <li><a href="https://omarmenu.xyz/join-the-team-&-get-paid/">join the team & get paid</a></li>
              </ul>
          </div>
          <div class="footer-column newsletter">
            <h3>Contact Us</h3>
              <div class="social-icons">
                  <a href="https://www.youtube.com/@omarcheats"><img src="/images/ICO_YOUTUBE.png" alt="YouTube" /></a>
                  <a href="https://discord.gg/OmarCheats"><img src="/images/ICO_DISCORD.png" alt="Discord" /></a>
                  <a href="https://www.instagram.com/omarplaysyt/"><img src="/images/ICO_INSTAGRAM.png" alt="Instagram" /></a>
                  <a href="https://twitter.com/OmarPlaysYT"><img src="/images/ICO_TWITTER.png" alt="Twitter" /></a>
              </div>
              <div class="contact-info">
                  <p>Email: <span id="emailText" class="copy-button" onclick="copyToClipboard()">omarplaysbusiness@gmail.com</span></p>
                  <span class="no-select" id="copyMessage">Copied!</span>
              </div>
          </div>
      </div>
      <div class="footer-bottom">
          <p>© 2024 omarmenu.xyz</p>
          <div class="footer-links">
              <a href="https://omarmenu.xyz/terms-&-conditions/">Terms & Conditions</a>
              <a href="https://omarmenu.xyz/privacy-policy">Privacy Policy</a>
              <a href="https://omarmenu.xyz/refund-policy">Refund Policy</a>
              <a href="https://omarmenu.xyz/delivery-policy">Delivery Policy</a>
          </div>
      </div>
  </footer>
    </body>
    <script src="/scroll-up.js"></script>
    <script src="Loading.js"></script>
    <script src="/navbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/pace-js@latest/pace.min.js"></script>
    <script src="/copy.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
function toggleForm() {
  const container = document.getElementById('form-container');
  container.classList.toggle('rotated');
}
    </script>
    <script src="login.js"></script>
</html>
