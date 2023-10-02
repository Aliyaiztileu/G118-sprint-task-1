package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Task;

import java.io.IOException;

@WebServlet(value = "/add-task-servlet")
public class AddTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadLineDate = req.getParameter("deadLineDate");

        Task task = new Task();
        task.setName(name);
        task.setDescription(description);
        task.setDeadLineDate(deadLineDate);

        DBManager.addTask(task);
        System.out.println("Task added successfully"); // Добавьте эту строку для отладки

        req.getRequestDispatcher("home.jsp").forward(req, resp);

        System.out.println("Forwarding to Home");


    }
}
