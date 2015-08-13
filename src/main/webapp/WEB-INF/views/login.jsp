<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Guestbook</title>

   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
 <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
 <link href="<c:url value="/resources/css/animate.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/creative.css" />" rel="stylesheet">
  
</head>
<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Guestbook</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    </li>
               
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
               
            
            
				<div class="wrapper">
   	<form:form class="form-signin" method="post" action="j_spring_security_check"
				modelAttribute="users">
				 <h2 class="form-signin-heading">Please login</h2>
				   <td colspan="2" style="color: red">${message}</td>
						<form:input placeholder="username" class="form-control" path="username" />
					
				
						<form:input type="password" placeholder="password" class="form-control" path="password" />
				
						&nbsp;
					<input type="submit" value="login"class="btn btn-lg btn-primary btn-block"/>
				
			</form:form>
  </div>
		
            </div>
        </div>
    </header>

    
 <script src="<c:url value="/resources/js/jquery.js" />"></script>
  
  <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/js/jquery.easing.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.fittext.js" />"></script>
      <script src="<c:url value="/resources/js/wow.min.js" />"></script>
        <script src="<c:url value="/resources/js/creative.js" />"></script>


</body>
</html>