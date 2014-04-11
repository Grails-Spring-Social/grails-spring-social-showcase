<html>
<head>
  <meta name='layout' content='bootstrap'/>
  <title><g:message code="springSecurity.login.title"/></title>

</head>

<body>

<div class="container">
  <div class="row">
    <div class="span9 centred">


      <form class="form-signin" role="form" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>


        <h2>
          <g:message code="springSecurity.login.header"/>
        </h2>

        <g:if test='${flash.message}'>
          <div class='login_message'>${flash.message}</div>
        </g:if>

        <div class="form-group">
          <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
          <input type='text' class='text_' name='j_username' id='username'/>
        </div>

        <div class="form-group">
          <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
          <input type='password' class='text_' name='j_password' id='password'/>
        </div>

        <div class="checkbox">
          <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                 <g:if test='${hasCookie}'>checked='checked'</g:if>/>
          <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
        </div>
        <button type='submit' class="btn btn-primary"
                id="submit">${message(code: "springSecurity.login.button")}</button>

      </form>
    </div>
  </div>

</div> <!-- /container -->

</body>
</html>
