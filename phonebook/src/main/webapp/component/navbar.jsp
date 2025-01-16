<%@ page import="com.entity.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item active">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="addcontact.jsp"><i class="fa-solid fa-user-plus" style="color: white; font-size: 1.2em;"></i>Add Contact</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="viewcontact.jsp"><i class="fa-solid fa-eye" style="color: white; font-size: 1.2em;"></i>View Contact</a>
        </li>
      </ul>
      <% 
        User users = (User) session.getAttribute("users");
        if (users == null) {
      %>
        <form class="d-flex">
          <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
          <a href="register.jsp" class="btn btn-danger ms-2"><i class="fa-duotone fa-solid fa-registered"></i>Register</a>
        </form>
      <% 
        } else {
      %>
        <form class="d-flex">
          <button class="btn btn-success mr=5 ml=4"><%= users.getName() %></button>
    		<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"  class="btn btn-danger ml=4">Logout</a>
        </form>
      <% 
        }
      %>
    </div>
  </div>
</nav>


<!-- logout pop up -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
      <h6>Do you want to Logout?</h6>
      
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a  href ="logout" class="btn btn-primary">Logout</a>
      
        ...
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>



