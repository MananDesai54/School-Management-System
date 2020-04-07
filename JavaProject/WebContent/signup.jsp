<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/1b8ba3dee0.js" crossorigin="anonymous"></script>
    <style>
    	* {
    padding: 0;
    margin: 0;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    box-sizing: border-box;
}
body {
    height: 100vh;
    width: 100vw;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #ebf5fc;
}
.signup {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 50%;
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
.signup:hover {
    box-shadow: inset 8px 8px 25px rgba(0, 0, 0, 0.1),
                inset -8px -8px 25px rgba(255, 255, 255, 1);
    transition: box-shadow 1s ease-in-out;
}
.signup h1 {
    padding: 10px;
    text-transform: uppercase;
    background: linear-gradient(to left,#0F2259,#3258A6,#77ACF2);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 1em;
}
.signup .input:nth-of-type(1), .signup .input:nth-of-type(4) {
    width: 90%;
    display: flex;
}
.signup .input:nth-of-type(1) input, .signup .input:nth-of-type(4) input {
    margin: 0 5px;
}
.signup .input {
    margin: 0.5rem;
    width: 90%;
    padding: 0;
    position: relative;
}
.signup .input i {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 30px;
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
input {
    padding: 1em 1em;
    border: none;
    border-radius: 20px;
    width: 100%;
    outline: none;
}
.signup .button {
    margin: 2em;
    background: cadetblue;
    padding: 1em;
    border-radius: 30px;
    color: white;
    text-decoration: none;
}
.signup .button:hover {
    box-shadow:  0 0 10px rgba(0, 0, 0, 0.5);
    transform: scale(1.1);
    background:#3258A6;
    transition: transform 0.5s ease-in-out,
                box-shadow 0.6s ease-in-out,
                background 0.5s ease-in-out;
}.success {
		background:rgba(0,255,0,0.1);
		color:green;
		padding:10px;
		margin:10px auto;
		border-radius:5px;
	}
    </style>
</head>
<body>
	<% if((((String)session.getAttribute("catagory")).equals("admin"))) { %>
    <form class="signup" action="SignUp" method="post">
    	<%
    		String msg = (String)request.getParameter("msg");
    		if(msg!=null) { %>
    			<p class="success"><%=msg %></p>
    		<%}
    	%>
        <h1>Student Sign up</h1>
        <div class="input">
            <input type="text" name="username" autocomplete="off" class="field username" id="username" placeholder="Username" required>
        </div>
        <div class="input">
            <input type="text" name="firstname" class="field firstname" id="firstname" placeholder="Firstname" required>
            <input type="text" name="middlename" class="field middlename" id="middlename" placeholder="Middlename" required>
            <input type="text" name="lastname" class="field lastname" id="lastname" placeholder="Lastname" required>
        </div>
        <div class="input">
			<input type="date" name="bday" class="field bday" id="bday"  required>
			<input type="text" name="standard" class="field standard" id="standard" placeholder="Standard" required>
			<select name="catagory">
				<option value="student">Student</option>
				<option value="teacher">Teacher</option>
			</select>
        </div>
        <div class="input">
            <input type="password" name="password" class="field password" id="password" placeholder="Password" required>
          <i class="fas fa-eye hidden" data-name="eye" data-index="0" title="Hide Password"></i>
          <i class="fas fa-eye-slash show" data-name="eye-slash" data-index="0" title="Show Password"></i>
        </div>
        <div class="input">
            <input type="password" name="repassword" class="field repassword password" id="repassword" placeholder="Re-Enter Password" required>
          <i class="fas fa-eye hidden" data-name="eye" data-index="1" title="Hide Password"></i>
          <i class="fas fa-eye-slash show" data-name="eye-slash" data-index="1" title="Show Password"></i>
        </div>
        <button type="submit" class="button">Sign up</button>
        <div class="link">
        	<a href="teachersignup.jsp">Create Teacher Account</a>
        </div>
    </form>
    <%} %>
    <script>
        let eyes = document.querySelectorAll('.fa-eye')
        let eyes_slash = document.querySelectorAll('.fa-eye-slash')
        let password = document.querySelectorAll('.password')

        console.log(eyes,eyes_slash)
        eyes.forEach(eye => eye.addEventListener('click',showHide))
        eyes_slash.forEach(eye=>eye.addEventListener('click',showHide))

        function showHide() {
            let name = this.dataset.name
            let index = this.dataset.index
            console.log(index)
            if(this.classList.contains('show')) {
                this.classList.add('hidden')
                this.classList.remove('show')
                check(name,index)
            }
            else {
                this.classList.remove('hidden')
                this.classList.add('show')
                check(name,index)
            }
        }
        function check(name,index) {
            if(name === 'eye'){
                eyes_slash[index].classList.add('show')
                eyes_slash[index].classList.remove('hidden')
                password[index].type = 'password'
            }else {
                eyes[index].classList.add('show')
                eyes[index].classList.remove('hidden')
                password[index].type = 'text'
            }
        }
        </script>
</body>
</html>