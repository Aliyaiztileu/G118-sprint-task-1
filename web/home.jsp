<%@ page import="models.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Yera
  Date: 29.09.2023
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
</head>
<body class="container-fluid">
    <%@include file="navbar.jsp"%>


    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
       ADD TASK
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <h2>New task</h2>
                    <form action="/add-task-servlet" method="post">

                    <h3>Name:</h3>
                    <input type="text" name="name" placeholder="Task name">
                    <h3>Description</h3>
                        <input type="text" name="description" placeholder="Description name">
                    <h3>Deadline date</h3>
                    <input type="date" name="deadLineDate">
                    </form>



                </div>
                <form action="/add-task-servlet" method="post" class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button> </form>

                </div>
            </div>
        </div>
    </div>


    <table>
        <thead>
            <th>ID</th>
            <th>Name</th>
            <th>DeadLine date</th>
            <th>Status</th>
            <th>Details</th>
        </thead>
        <tbody>
        <%
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if (tasks != null) {
                for (Task task : tasks){
        %>


        <tr>
            <td><%=task.getId()%></td>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadLineDate()%></td>
            <td>Status</td>
            <td>
                <form action="/details" method="get">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <button>DETAILS</button>
                </form>
            </td>
        </tr>
        <%
            }}
        %>
        </tbody>
    </table>


</body>

</html>
