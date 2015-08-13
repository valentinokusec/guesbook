<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Guestbook</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
   <link href="<c:url value="/resources/css/simple-sidebar.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
     <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
              
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        <li class="dropdown">
         
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  
</nav>
      
           
      <div class="container">
    <div class="col-lg-4 col-sm-6 text-center">
    <div class="well">
        
    
    <hr data-brackets-id="12673">
    <ul data-brackets-id="12674" id="sortable" class="list-unstyled ui-sortable">
      <c:if  test="${!empty reviewquelist}">
  
    <c:forEach items="${reviewquelist}" var="reviewquelist">
        <strong class="pull-left primary-font"> ${reviewquelist.user}</strong>
        <small class="pull-right text-muted">
           <span class="glyphicon glyphicon-time"></span>${reviewquelist.date}</small>
        </br>
        <li class="ui-state-default"> ${reviewquelist.content}  </li>
        </br>
      
   
    <form:form method="post" action="addreview" commandName="review">
        <form:input path="date" type="hidden" value="${reviewquelist.date}" />
                <form:input path="user" type="hidden" value="${reviewquelist.user}" />
                        <form:input path="content" type="hidden" value="${reviewquelist.content}" />
                <input name="id" type="hidden" value="${reviewquelist.id}" />
        
  
	  <span class="input-group-btn" onclick="addComment()">   
	   <input class="btn btn-primary btn-sm" type="submit" value="Approve"/>
	   </span>  
	    </form:form>
            <form:form method="post" action="deletereview">
        <input name="id" type="hidden" value="${reviewquelist.id}" />
        
  
	  <span class="input-group-btn" onclick="addComment()">   
	   <input class="btn btn-primary btn-sm" type="submit" value="Disapprove"/>
	   </span>  
	    </form:form> 
  
            </c:forEach>
            </c:if>

        
    </ul>
    </div>
</div>
        <!-- /#page-content-wrapper -->

	</div>
</div>



      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
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