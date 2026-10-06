
<%-- Define o tipo de conteúdo e a codificação. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Comidas - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Comidas Cadastradas</h2>

    <a href="cadastrarComida.jsp" class="btn btn-success mb-3">
        Nova Comida
    </a>
    <a href="index.jsp" class="btn btn-secondary mb-3">
        Voltar ao Início
    </a>

    <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Ingredientes</th>
                <th>Preço</th>
                <th>Disponível</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
        <%
            String sql = "SELECT * FROM comidas ORDER BY id";

            try (Connection con = Conexao.conectar();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("descricao") %></td>
                <td><%= rs.getString("ingredientes") %></td>
                <td>R$ <%= rs.getBigDecimal("preco") %></td>
                <td>
                    <%= rs.getBoolean("disponivel") ? "Sim" : "Não" %>
                </td>
                <td>
                    <a href="editarComida.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-warning btn-sm">Editar</a>

                    <a href="excluirComida.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Deseja realmente excluir esta comida?');">
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
                        Erro ao listar as comidas. Verifique a conexão
                        com o banco de dados.
                    </div>
                </td>
            </tr>
        <%
                application.log("Erro ao listar comidas", e);
            }
        %>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>
