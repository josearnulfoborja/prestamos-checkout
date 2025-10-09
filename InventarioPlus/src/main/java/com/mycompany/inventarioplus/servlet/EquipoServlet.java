package com.mycompany.inventarioplus.servlet;

import com.mycompany.inventarioplus.dao.EquipoDAO;
import com.mycompany.inventarioplus.model.Equipo;
import com.mycompany.inventarioplus.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/equipos")
public class EquipoServlet extends HttpServlet {

    private EquipoDAO equipoDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBConnection.getConnection();
        equipoDAO = new EquipoDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Equipo> equipos = equipoDAO.getAllEquipos();
            request.setAttribute("equipos", equipos);
            request.getRequestDispatcher("equipos.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error al obtener equipos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String estado = request.getParameter("estado");
            double costoDia = Double.parseDouble(request.getParameter("costoDia"));
            double costoHora = Double.parseDouble(request.getParameter("costoHora"));
            boolean requiereEspecialista = Boolean.parseBoolean(request.getParameter("requiereEspecialista"));

            Equipo equipo = new Equipo();
            equipo.setNombre(nombre);
            equipo.setDescripcion(descripcion);
            equipo.setEstado(estado);
            equipo.setCostoDia(costoDia);
            equipo.setCostoHora(costoHora);
            equipo.setRequiereEspecialista(requiereEspecialista);

            equipoDAO.addEquipo(equipo);
            response.sendRedirect("/equipos");
        } catch (Exception e) {
            throw new ServletException("Error al agregar equipo", e);
        }
    }
}