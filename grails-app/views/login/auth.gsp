<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

</head>

<body>

<div class="container">
    <g:message code="springSecurity.login.header"/>

    <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
    </g:if>

    <form class="form-signin" role="form" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
        <div class="form-group">
            <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
            <input type='text' class='text_' name='j_username' id='username'/>
        </div>
        <div class="form-group">
            <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
            <input type='password' class='text_' name='j_password' id='password'/>
        </div>
        <div class="checkbox">
            <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
            <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
        </div>
        <button type='submit' class="btn btn-default" id="submit">${message(code: "springSecurity.login.button")}</button>

    </form>

</div> <!-- /container -->

</body>
</html>
