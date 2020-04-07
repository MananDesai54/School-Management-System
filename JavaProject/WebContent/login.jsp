<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    	* {
    padding: 0;
    margin: 0;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    /* transition: 0.2s ease-in-out; */
}

body {
    height: 100vh;
    width: 100vw;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #ebf5fc;
    scroll-behavior: smooth;
}

.signin {
    padding: 2em;
    margin: 1em;
    border-radius: 50px;
    box-shadow: 6px 6px 20px rgba(0, 0, 0, 0.1),
                -6px -6px 20px rgba(255, 255, 255, 1);
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
}
.signin .input {
    margin: 2rem;
    width: 90%;
    padding: 0;
    position: relative;
}
.signin .input i {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 20px;
}
.hidden {
    /* display: none; */
    opacity: 0;
    transition: opacity 0.4s ease-in-out;
    z-index: -1;
}
.show {
    opacity: 1;
    transition: opacity 0.4s ease-in-out;
    display: block;
    z-index: 1;
}
input[type="text"], .signin input[type="password"] {
    padding: 1em 1em;
    border: none;
    border-radius: 20px;
    width: 88%;
    outline: none;
}
/* .signin input:nth-of-type(2) {
    margin-top: 1em;
    margin-bottom: 5px;
} */
.signin h1 {
    padding: 10px;
    text-transform: uppercase;
    background: linear-gradient(to left,#0F2259,#3258A6,#77ACF2);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
.signin input::placeholder {
    text-align: left;
}
.signin .link {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 12px;
}
a {
    text-decoration: none;
}
.signin .link a {
    align-self: flex-start;
    margin: 0 20px;
}
.signin .button {
    margin: 2em;
    background: cadetblue;
    padding: 1em;
    border-radius: 30px;
    color: white;
    border:none;
}
.signin .button:hover {
    box-shadow:  0 0 10px rgba(0, 0, 0, 0.5);
    transform: scale(1.1);
    background:#3258A6;
    transition: transform 0.5s ease-in-out,
                box-shadow 0.6s ease-in-out,
                background 0.5s ease-in-out;
}
.signin .showpswd input[type="checkbox"] {
    border: none;
}
.signin .showpswd {
    margin: 2px 1em 1em 1em;
    padding-right: 10px;
    align-self: flex-end;
    font-size: 0.8em;
}
    </style>
    <script src="https://kit.fontawesome.com/1b8ba3dee0.js" crossorigin="anonymous"></script>
</head>
<body>	
	<% 
		if(session != null) {
			Boolean flag = (Boolean)session.getAttribute("login");
			if(flag==null) {
				session.setAttribute("login", false);
				response.sendRedirect("login.jsp");
			}else if(flag) {
				response.sendRedirect("home.jsp");
			}
		}
	%>
    <form class="signin" action="login" method="post">
    	<%
    		String msg = (String)request.getParameter("msg");
    		if(msg!=null) {
    			out.println(msg);
    		}
    	%>
        <h1>Student Sign in</h1>
        <div class="input">
          <input type="text" name="username" autocomplete="off" class="field username" id="username" placeholder="Username" required>
        </div>
        <div class="input">
          <input type="password" name="password" class="field password" id="password" placeholder="Password" required>
        <i class="fas fa-eye hidden" data-name="eye" title="Hide Password"></i>
        <i class="fas fa-eye-slash show" data-name="eye-slash" title="Show Password"></i>
        </div>
        <button type="submit" class="button">Sign in</button>
        <div class="link">
            <a href="teacherlogin.jsp">Teacher Sign-in</a>
        </div>
    </form>
    <script>
    let eye = document.querySelector('.fa-eye')
    let eye_slash = document.querySelector('.fa-eye-slash')
    let password = document.querySelector('.password')

    console.log(password)
    eye.addEventListener('click',showHide)
    eye_slash.addEventListener('click',showHide)

    function showHide() {
        let name = this.dataset.name;
        if(this.classList.contains('show')) {
            this.classList.add('hidden')
            this.classList.remove('show')
            check(name)
        }
        else {
            this.classList.remove('hidden')
            this.classList.add('show')
            check(name)
        }
    }
    function check(name) {
        if(name === 'eye'){
            eye_slash.classList.add('show')
            eye_slash.classList.remove('hidden')
            password.type = 'password'
        }else {
            eye.classList.add('show')
            eye.classList.remove('hidden')
            password.type = 'text'
        }
    }
    
    </script>
</body>
</html>