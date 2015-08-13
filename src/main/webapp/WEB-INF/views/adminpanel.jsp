<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:if  test="${!empty reviewque}"> You have new reviews
                                                               </c:if><c:if  test="${empty reviewque}">${username}  </c:if> <b class="caret"></b></a>
          <ul class="dropdown-menu">
       <c:if  test="${!empty reviewque}">
  
    <c:forEach items="${reviewque}" var="reviewque">
    <li><a href="adminreviews/${reviewque.id}"> ${reviewque.user}  ${reviewque.date} </a> </li>
    </c:forEach> 
    </c:if>
    <c:if  test="${empty reviewque}">
        <li>You have no review to evaluate.</li>
    
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
         <div id="wrapper" class="toggled">
<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <h4>List of guests</h4>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                  
                   <th>First Name</th>
                    <th>Last Name</th>
                     <th>Address</th>
                     <th>Email</th>
                     <th>Contact</th>
                      <th>Edit</th>
                      
                       <th>Delete</th>
                   </thead>
    <tbody>
    
   
  
      <c:if  test="${!empty userlist}">
  
    <c:forEach items="${userlist}" var="user">
        <tr>
            <td>${user.username}  </td>
          <td>  ${user.lastname}</td>
            <td>${user.adress}</td>
            <td>${user.email}</td>
            <td>${user.contact}</td>
        
            
      
  
    <td><a href="http://guestbook-valentino.rhcloud.com/guestbook/edit/${user.username}"><span class="glyphicon glyphicon-pencil"></span></a></td>
    <td><a href="http://guestbook-valentino.rhcloud.com/guestbook/deleteuser/${user.username}"><span class="glyphicon glyphicon-trash"></span></a></td>
    </tr>
    
  </c:forEach>
   
    </c:if>

    </tbody>
        
</table>



                
            </div>
            <row>
  <a href="add" class="btn btn-primary">Add new guest</a>
    </row>
        </div>
	</div>
</div>

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