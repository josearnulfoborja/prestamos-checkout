package com.mycompany.inventarioplus.service;

import com.mycompany.inventarioplus.dao.ClienteDAO;
import com.mycompany.inventarioplus.model.Cliente;

import java.sql.Connection;
import java.util.List;

public class ClienteService {

    private ClienteDAO clienteDAO;

    public ClienteService(Connection connection) {
        this.clienteDAO = new ClienteDAO(connection);
    }

    public void addCliente(Cliente cliente) throws Exception {
        // Aquí pueden ir validaciones de negocio
        clienteDAO.addCliente(cliente);
    }

    public List<Cliente> getAllClientes() throws Exception {
        return clienteDAO.getAllClientes();
    }

    public Cliente getClienteById(int id) throws Exception {
        return clienteDAO.getClienteById(id);
    }

    public void updateCliente(Cliente cliente) throws Exception {
        clienteDAO.updateCliente(cliente);
    }

    public void deleteCliente(int id) throws Exception {
        clienteDAO.deleteCliente(id);
    }
}