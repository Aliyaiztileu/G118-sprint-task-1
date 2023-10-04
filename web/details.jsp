<%@ page import="models.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Yera
  Date: 01.10.2023
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Новая задача</h1>
                </div>
                <div class="modal-body">
                    <%
                        Task task = (Task) request.getAttribute("task");
                        if (task != null) {
                    %>

                    <h4>Наименование:</h4>
                    <input type="text" name="name" placeholder="Наименование задачи"  value="<%=task.getName()%>">
                    <h4>Описание:</h4>
                    <input type="text" name="description" placeholder="Описание..." value="<%=task.getDescription()%>">
                    <h4>Крайний срок</h4>
                    <input type="date" name="deadlineDate" value="<%=task.getDeadlineDate()%>" required>
                    <h4>Выполнено</h4>
                    <select id="choose-option" name="option">
                        <option value="option1">Да</option>
                        <option value="option2" selected>Нет</option>
                    </select>

                    <%

                        }
                    %>


                </div>
                <form action="/details" method="get">
                    <button type="submit" class="btn btn-secondary" >Сохранить</button>
                </form>
                <form action="/delete" method="post">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <button type="submit" class="btn btn-primary">Удалить</button>
                </form>

        </div>
    </div>
    </div>



</body>
</html>
