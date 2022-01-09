<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
	
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title><c:out value="${page }"></c:out> </title>
  </head>
  <body>
    
    <div class="container mt-3">
    	<h1 class="text-center">Welcome to TODO manager</h1>
    	
    	<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<b><c:out value="${msg }"></c:out></b>
			</div>
		</c:if>
    	
    	<div class="row mt-5">
    		<div class="col-md-2">

				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href="<c:url value='/add'></c:url>"
						class="list-group-item list-group-item-action">Add TODO</a>
					<a href="<c:url value='/home'></c:url>" class="list-group-item list-group-item-action">View TODO</a>
					
				</div>
			</div>
    		<div class="col-md-10">
    			<c:if test="${page=='home' }">
    				<h1 class="text-center">All DODOs</h1>
    				
    				<c:forEach items="${todos }" var="t">
    					<div class="card">
    						<div class="card-body">
    							<p><c:out value="${t.todoId }"></c:out></p>
    							<h3><c:out value="${t.todoTitle }"></c:out></h3>
    							<p><c:out value="${t.todoContent }"></c:out></p>
    							    							
    							<p><b><c:out value="${t.todoDate }"></c:out></b></p>
    							
    							 <a  class="btn btn-primary" href="<c:url value="/update" ><c:param name="id" ><c:out value="${t.todoId }"></c:out></c:param></c:url>">Edit</a>
    							 <a  class="btn btn-danger" href="<c:url value="/delete" ><c:param name="id" ><c:out value="${t.todoId }"></c:out></c:param></c:url>">Delete</a>

    						</div>
    					</div>
    				</c:forEach>
    				
    			</c:if>
    			
    			<c:if test="${page=='add' }">
    				<h1 class="text-center">Add TODO</h1>
    					<!-- <br> -->
    					<form:form action="saveTodo" method="post" modelAttribute="todo">
    						<div class="form-group">
    							<form:input path="todoTitle" cssClass="form-control" placeholder="Enter your todo title" required="required"/>
    						</div>
    						
    						<div class="form-group">
    							<form:textarea path="todoContent"   cssClass="form-control" placeholder="Enter your todo content" cssStyle="height:250px;" required="required"/>
    						</div>
    						
    						<div class="container text-center">
    							<button class="btn btn-outline-success">Add Todo</button>
    						</div>
    						
    					</form:form>
    					
    			</c:if>
    			
    			<!--newly added  -->
    			<c:if test="${page=='update' }">
    				<h1 class="text-center">Update TODO</h1>
    					<!-- <br> -->
    					<form:form action="updateTodo" method="post" modelAttribute="todoss">
    						
    						<div class="form-group">
    							<form:input path="todoId" cssClass="form-control" placeholder="Enter your todo title" readonly="true" />
    						</div>
    					
    						<div class="form-group">
    							<form:input path="todoTitle" cssClass="form-control" placeholder="Enter your todo title" required="required"/>
    						</div>
    						
    						<div class="form-group">
    							<form:textarea path="todoContent" cssClass="form-control" placeholder="Enter your todo content" cssStyle="height:250px;" required="required"/>
    						</div>
    						
    						<div class="container text-center">
    							<button class="btn btn-outline-success">Update</button>
    						</div>
    					</form:form>
    						 		
    			</c:if>
    			
    			
    			
    		</div>
    	</div>
    </div>
    
    
    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>