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
    <form action="/addTask" method="post">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Новая задача</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4>Наименование:</h4>
                    <input type="text" name="name" placeholder="Наименование задачи" required>
                    <h4>Описание:</h4>
                        <input type="text" name="description" placeholder="Описание...">
                    <h4>Крайний срок</h4>
                    <input type="date" name="deadlineDate" required>



                </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>

                </div>
            </div>
        </div>
    </div>
    </form>

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
    </style>

    <table class="table table-primary">
        <thead>
        <tr>
            <th>ID</th>
            <th>Наименование</th>
            <th>Крайний срок</th>
            <th>Выполнено</th>
            <th>Детали</th>
        </tr>
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
            <td><%=task.getDeadlineDate()%></td>
            <td>
                <select id="choose-option" name="option">
                <option value="option1">Да</option>
                <option value="option2" selected>Нет</option>
            </select>
            </td>
            <td>
                <form action="/details" method="get">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <button type="submit" class="btn btn-primary">
                        Детали
                    </button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>



</body>

</html>
