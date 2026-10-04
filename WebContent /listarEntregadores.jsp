
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Entregadores - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Entregadores Cadastrados</h2>

    <a href="cadastrarEntregador.jsp" class="btn btn-success mb-3">
        Novo Entregador
    </a>
    <a href="index.jsp" class="btn btn-secondary mb-3">Voltar ao Início</a>

    <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Veículo</th>
                <th>Disponibilidade</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
        <%
            String sql = "SELECT * FROM entregadores ORDER BY id";

            try (Connection con = Conexao.conectar();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("telefone") %></td>
                <td><%= rs.getString("veiculo") %></td>
                <td><%= rs.getString("disponibilidade") %></td>
                <td>
                    <a href="editarEntregador.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-warning btn-sm">Editar</a>

                    <a href="excluirEntregador.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Deseja realmente excluir este entregador?');">
                        Excluir
                    </a>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
        %>
            <tr>
                <td colspan="6">
                    <div class="alert alert-danger">
                        Erro ao listar os entregadores.
                    </div>
                </td>
            </tr>
        <%
                application.log("Erro ao listar entregadores", e);
            }
        %>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>
