<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
nav {
  background-color: #333;
  overflow: hidden;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

nav li {
  float: left;
}

nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

nav li a:hover {
  background-color: #111;
}
nav {
  background-color: #333;
  overflow: hidden;
}

nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

nav li {
  float: left;
}

nav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

nav li a:hover {
  background-color: #111;
}

h1 {
  font-size: 48px;
  margin-top: 50px;
  text-align: center;
}

p {
  font-size: 24px;
  margin: 20px 0;
  text-align: center;
}

/* Media query for smaller screens */
@media screen and (max-width: 600px) {
  nav li {
    float: none;
    display: block;
    text-align: center;
  }
  
  nav li a {
    display: inline-block;
    margin: 5px;
  }
  
  h1 {
    font-size: 36px;
  }
  
  p {
    font-size: 18px;
    margin: 10px 0;
  }
}

</style>
</head>
<body>
<nav>
  <ul>
    <li><a href="login.jsp">CLICK HERE if you are user</a></li>
    <li><a href="restaurant_owner_login.jsp">CLICK HERE if you are restaurant owner</a></li>
  </ul>
</nav>
<h1>Welcome to the Food Ordering Portal</h1>
<p>Order your favorite food online from the comfort of your home or office.</p>
<p>If you're a restaurant owner, sign up to join our platform and reach more customers.</p>
</body>
</html>
