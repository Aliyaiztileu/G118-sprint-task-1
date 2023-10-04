package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Task;

import java.io.IOException;

@WebServlet (value = "/details")
public class DetailsServlet extends HomeServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id =Long.parseLong(request.getParameter("id"));
        if (!request.getParameter("id").isEmpty())
        request.setAttribute("task", DBManager.getTaskById(id));
        request.getRequestDispatcher("details.jsp").forward(request,response);
        }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        DBManager.getTaskById(id).setName(name);
        DBManager.getTaskById(id).setDescription(description);
        DBManager.getTaskById(id).setDeadlineDate(deadlineDate);

        resp.sendRedirect("/home");
    }
}
