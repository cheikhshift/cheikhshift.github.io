<%@page import="com.stix.mailer.coreMailer" %>
<%

if(!(request.getParameter("email").equals("")) && !(request.getParameter("Subject").equals("")) && !(request.getParameter("body").equals("")) ){

	coreMailer.sendMail(request.getParameter("email"), "jvmstix@gmail.com", request.getParameter("Subject"), request.getParameter("body"));
	
	%>
	<div class="alert alert-success">
	<strong>Email sent!</strong> We will get back to you ASAP.
	</div>
	<script>
	$(".loader-form").remove();
	$(".dosub").remove();
	</script>
	<%
}


%>