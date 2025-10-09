package com.mycompany.inventarioplus.service;

import com.mycompany.inventarioplus.dao.EquipoDAO;
import com.mycompany.inventarioplus.model.Equipo;

import java.sql.Connection;
import java.util.List;

public class EquipoService {

    private EquipoDAO equipoDAO;

    public EquipoService(Connection connection) {
        this.equipoDAO = new EquipoDAO(connection);
    }

    public void addEquipo(Equipo equipo) throws Exception {
        // Validaciones de negocio
        equipoDAO.addEquipo(equipo);
    }

    public List<Equipo> getAllEquipos() throws Exception {
        return equipoDAO.getAllEquipos();
    }

    public Equipo getEquipoById(int id) throws Exception {
        return equipoDAO.getEquipoById(id);
    }

    public void updateEquipo(Equipo equipo) throws Exception {
        equipoDAO.updateEquipo(equipo);
    }

    public void deleteEquipo(int id) throws Exception {
        equipoDAO.deleteEquipo(id);
    }
}