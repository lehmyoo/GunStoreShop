<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <style>

    </style>
</head>
<body>
<div id="app">

    <main class="auth-page">


        <div class="wrapper">



            <div class="auth-content register">

                <div class="presentation">
                    <img src="${pageContext.request.contextPath}/img/weapons/bg.png" alt="logo">
                </div>

                <div class="form register">
                    <a href="home" class="auth-logo">
                        <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
                    </a>

                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5.52 19c.64-2.2 1.84-3 3.22-3h6.52c1.38 0 2.58.8 3.22 3"/><circle cx="12" cy="10" r="3"/><circle cx="12" cy="12" r="10"/></svg>
                        <h1>Sign up</h1>
                    </div>

                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <input type="text" name="username" placeholder="Username" autocomplete="off" autofocus>
                        <input type="text" name="email" placeholder="Email" autocomplete="off">
                        <input type="text" name="password" placeholder="Password" autocomplete="off">
                        <button type="submit">Register</button>
                    </form>
                    <div class="flex items-center new-customer">
                        <div><a href="login">Sign in</a> instead?</div>
                    </div>
                </div>

            </div>

        </div>
    </main>

</div>
</body>
</html>
