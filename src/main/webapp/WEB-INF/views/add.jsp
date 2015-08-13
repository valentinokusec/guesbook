<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Guestbook</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/simple-sidebar.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
     <link href="<c:url value="/resources/css/main1.css" />" rel="stylesheet">
   
</head>
<body>

    <div id="wrapper" class="toggled">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
             
              <li>
                    <a href="http://guestbook-valentino.rhcloud.com/guestbook/main">Main</a>
                </li>
                <li>
                    <a href="http://guestbook-valentino.rhcloud.com/guestbook/edit/${username}">Edit my profile</a>
                </li>
                <li>
                    <a href="http://guestbook-valentino.rhcloud.com/guestbook/reviews">Reviews</a>
                </li>
                  <li>
                    <a href="http://guestbook-valentino.rhcloud.com/guestbook/admin">Admin Panel</a>
                </li>
                  <li>
               <form action="login?logout" method="post">
  <input id="bt" type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
        <nav class="navbar navbar-default" role="navigation">
  
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <table>
    <tr>  <td><a class="navbar-brand" id="element1" href="#">Guesbook</a></td>
 <td>       <a href="#menu-toggle" class="fa fa-bars fa-3x" id="menu-toggle"></a></td></tr>
        
        </table>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${username} <b class="caret"></b></a>
          <ul class="dropdown-menu">
       <c:if  test="${!empty reviewque}">
  
    <c:forEach items="${reviewque}" var="reviewque">
    <li><a href="adminreviews/${reviewque.id}"> ${reviewque.user}  ${reviewque.date} </a> </li>
    </c:forEach> 
    </c:if>
          </ul>
        </li>
        <li class="dropdown">
         
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  
</nav>
      
           
        </div>
        <!-- /#page-content-wrapper -->
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Add a new guest</h3>
				<form:form method="post" action="addguest" commandName="user">
  
	   
	   
				<div class="form-group col-lg-12">
					<label>Username</label>
					
				 <form:input path="username" type="text" class="form-control" placeholder="username" />
					
				</div>
				<div class="form-group col-lg-12">
					<label>Lastname</label>
					
				 <form:input path="lastname" type="text" class="form-control" placeholder="lastname" />
				 <form:input path="enabled" type="hidden"  value="1" />
					
				</div>
				<div class="form-group col-lg-6">
					<label>Password</label>
				 <form:input path="password" type="password"  class="form-control" placeholder="password" />
				</div>
				
				
								
				<div class="form-group col-lg-6">
					<label>Email Address</label>
				 <form:input path="email" type="text"  class="form-control" placeholder="email" />
				</div>
				<div class="form-group col-lg-6">
					<label>Contact</label>
				 <form:input path="contact" type="text"  class="form-control" placeholder="contact" />
				</div>
						<div class="form-group col-lg-6">
					<label>Adress</label>
				 <form:input path="adress" type="text"  class="form-control" placeholder="adress" />
				</div>
				
				
					<div class="col-sm-6">	
					<input class="btn btn-primary" type="submit" value="Add"/>
	  
	    </form:form>		
	
				</div>	
			</div>
		
		
		</div>
	</section>
</div>


    
    
    
   
   

    </div>
    <script src="<c:url value="/resources/js/jquery.js" />"></script>
  
  <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/js/jquery.easing.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.fittext.js" />"></script>
      <script src="<c:url value="/resources/js/wow.min.js" />"></script>
        <script src="<c:url value="/resources/js/creative.js" />"></script>
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>
</html>