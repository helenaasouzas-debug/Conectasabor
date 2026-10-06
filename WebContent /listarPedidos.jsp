
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Pedidos - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Pedidos Registrados</h2>

    <a href="cadastrarPedido.jsp" class="btn btn-success mb-3">
        Novo Pedido
    </a>
    <a href="index.jsp" class="btn btn-secondary mb-3">Voltar ao Início</a>

    <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>ID do Cliente</th>
                <th>ID do Entregador</th>
                <th>Endereço de Entrega</th>
                <th>Forma de Pagamento</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
        <%
            String sql = "SELECT * FROM pedidos ORDER BY id DESC";

            try (Connection con = Conexao.conectar();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getInt("usuario_id") %></td>
                <td>
                    <%
                        Object entregadorId = rs.getObject("entregador_id");
                        out.print(entregadorId != null ? entregadorId : "Não atribuído");
                    %>
                </td>
                <td><%= rs.getString("endereco_entrega") %></td>
                <td><%= rs.getString("forma_pagamento") %></td>
                <td><%= rs.getString("status") %></td>
                <td>
                    <a href="editarPedido.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-warning btn-sm">Editar</a>

                    <a href="excluirPedido.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Deseja realmente excluir este pedido?');">
                        Excluir
                    </a>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
        %>
            <tr>
                <td colspan="7">
                    <div class="alert alert-danger">
                        Erro ao listar os pedidos.
                    </div>
                </td>
            </tr>
        <%
                application.log("Erro ao listar pedidos", e);
            }
        %>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>
