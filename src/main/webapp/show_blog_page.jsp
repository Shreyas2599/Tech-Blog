<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));

PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<link href="css/mystyle.css" rel="stylesheet" type="text/css" />


<title><%=p.getpTitle()%>|| LearnCode</title>
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 84%, 72% 98%, 38% 91%, 0 100%, 0 0);
	
	
	
}
.row-user{
 border:1px solid #e2e2e2;
 padding-top:15px;
}

body{
background: url("img/ali.jpg");
background-size: cover;
background-attachment: fixed;
}

</style>
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-file-code-o"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Profile.jsp"><span class="fa fa-gears"></span> LearnCode
						with Shreyas <span class="sr-only">(current)</span> </a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-newspaper-o"></span>
						Category
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="	fa fa-address-book-o"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="	fa fa-asterisk"></span> Do Post</a></li>



			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#exampleModal"><span
						class="	fa fa-user-circle"></span> <%=user.getName()%></a></li>




				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="	fa fa-user-plus"></span> Log out</a></li>

			</ul>
		</div>
	</nav>
	<!-- navbar ends -->

	<!-- main content of body -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<h4 class="post-title" style="font-weight: 100;font-size: 30px;"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
					
					<div class="row my-3 row-user" >
					<div class="col-md-8"> 
					<%
					UserDao ud=new UserDao(ConnectionProvider.getConnection());
					
					
					%>
					
					
					<p class="posy-user-info" style="font-size:20px;font-weight:200"><a href="#!" ><%=ud.getUserByUserId(p.getUserId()).getName() %></a> has Posted:</p>
					
					</div>
					<div class="col-md-4">
						<p class="post-date" style="font-style: italic;font-weight: bold"><%=DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
					
					
					</div>
					
					
					</div>
					
					
						<p class="post-content" style="font-weight: 100;font-size: 25px; "><%=p.getpContent()%></p>

						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>

					</div>
					<div class="card-footer">
						<%
						LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
						
						
						%>
					
					
						<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm"><i
							class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a> 
						<a href="#!"
							class="btn btn-outline-primary btn-sm"><i
							class="fa fa-commenting-o"></i><span>20</span></a>

					</div>


				</div>

			</div>

		</div>


	</div>





	<!-- profile modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px"> <br>
						<h5 class="modal-title " id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile edit -->
						<div id="profile-edit" style="display: none">

							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>">
										</td>
									</tr>
									<%-- <tr>
										<td>Gender:</td>
										<td><input type="radio" class="form-control" name="user_gender"  value="<%=user.getGender()%>">Male
										<input type="radio" class="form-control" name="user_gender" value="<%=user.getGender()%>">Female
										 </td>
									</tr> --%>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea class="form-control" name="about"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-success">Save</button>
								</div>
						</div>



						</form>






					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of profile modal -->

	<!-- Add Post modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">---Select
									Category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>

						</div>


						<div class=form-group>
							<input name="pTitle" type="text" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class=form-group>
							<textarea name="pContent" class="form-control"
								style="height: 200px;" placeholder="Enter your content"></textarea>
						</div>
						<div class=form-group>
							<textarea name="pCode" class="form-control"
								style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class=form-group>
							<label>Select pic:</l00abel> <br> <input name="pic"
								type="file" placeholder="Enter your pic">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>


						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- End Post modal -->
























	<!-- JAVASCRIPTS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<script src="js/myjs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function()

			{
				//alert("button clicked")
				if (editStatus == false) {
					$("#profile-details").hide()

					$("#profile-edit").show()
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()

					$("#profile-edit").hide()
					editStatus = false;
					$(this).text("Edit")
				}

			})
		});
	</script>


	<!-- now add post js -->

	<script>
		$(document)
				.ready(
						function(e) {

							// alert("loaded..")
							$("#add-post-form")
									.on(
											"submit",
											function(event) {

												//this code get  called when form is submitted.
												event.preventDefault();
												console.log("submit..")

												let form = new FormData(this);

												//now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Saved Successfully",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong try again..",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error..	
																swal(
																		"Error!",
																		"Something went wrong try again..",
																		"error");
															},
															processData : false,
															contentType : false

														})

											})

						})
	</script>
</body>
</html>