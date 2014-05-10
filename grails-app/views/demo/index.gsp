<html>
<head>
    <title>Twitter Profile</title>
    <meta name='layout' content='bootstrap'/>
</head>

<body>

  <div class="container">
  <div class="row">
    <div class="span9">
      <div class="form-container">

        <g:set var="connectionFactories" value="${springsocial.registeredProviderIds()}"/>

        <h2>Grails Spring Social Showcase</h2>
         <g:set var="connectionFactories" value="${springsocial.registeredProviderIds()}"/>
      <g:set var="connectionProviderSettings" value="${grails.util.Holders.getConfig().plugin.springSocialCore.providers}"/>
        <ul class="list-group">
          <li class="list-group-item"><sec:ifLoggedIn>
            You are logged as <b> <sec:loggedInUserInfo field="username"/> </b>
            <form class="form-inline" method="POST" action="${request.contextPath}/logout">
              <button class="btn"><i class="fa fa-sign-out"></i> Logout</button>
            </form>
          </sec:ifLoggedIn>
          <sec:ifNotLoggedIn>
            You aren't logged yet...
          </sec:ifNotLoggedIn></li>
          <g:each in="${connectionFactories}" var="providerId">
            <g:set var="connected" value="${springsocial.isCurrentUserConnectedTo(providerId: providerId)}"/>
            <li class="list-group-item">
              <g:if test="${Boolean.valueOf(connected)}">
                <g:set var="profiles" value="${springsocial.currentUserProfilesToService(providerId:providerId)}"/>
                <g:each in="${profiles}" var="profile">
                  You're connected to <b>${providerId.capitalize()}</b> as
                  <g:link controller="springSocial${providerId.capitalize()}">
                    <b>${profile.name}</b>
                  </g:link>
                </g:each>
              </g:if>
              <g:else>
                You aren't connected to <b>${providerId.capitalize()}</b>
                 <g:form method="POST" mapping="springSocialConnect" params='[providerId: "${providerId}"]' class="form-inline">
                  <g:each in="${connectionProviderSettings[providerId].fields.keySet()}" var="field">
                    <input type="hidden" name="${field}"
                           value="${connectionProviderSettings[providerId].fields[field]}"/>
                  </g:each>
                  <button class="btn btn-default"><i class="fa fa-${providerId}"></i> Login with ${providerId}</button>
                </g:form>
              </g:else>
            </li>
          </g:each>
        </ul>


    </div>
  </div>
</div>
</div>


</body>
</html>
