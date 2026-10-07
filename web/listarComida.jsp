<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Comidas</title>

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>

    <body>

        <div class="container mt-4">

            <h2 class="text-center">Comidas Cadastradas</h2>

            <a href="cadastrarComida.html" class="btn btn-success mb-3">
                Novo Cadastro
            </a>

            <table class="table table-bordered table-hovered table-striped">

                <thead class="thead-dark">

                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Ingredientes</th>
                        <th>Valor Unitário</th>
                        <th>ID Fornecedor</th>
                        <th>Ações</th>
                    </tr>

                </thead>

                <tbody>

                    <%
                        Connection con = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {

                            con = Conexao.conectar();

                            String sql = "SELECT * FROM comidas ORDER BY id";

                            ps = con.prepareStatement(sql);

                            rs = ps.executeQuery();

                            while (rs.next()) {
                    %>

                    <tr>

                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("nome")%></td>
                        <td><%= rs.getString("ingredientes")%></td>
                        <td><%= rs.getBigDecimal("valor_unitario")%></td>
                        <td><%= rs.getInt("id_fornecedor")%></td>

                        <td>

                            <a href="editarComidas.jsp?id=<%= rs.getInt("id")%>"
                               class="btn btn-warning btn-sm">
                                Editar
                            </a>

                            <a href="excluirComidas.jsp?id=<%= rs.getInt("id")%>"
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

                        <td colspan="6">

                            <div>
                                <strong>Erro:</strong>
                                <%= e.getMessage()%>
                            </div>

                        </td>

                    </tr>

                    <%
                        } finally {

                            if (rs != null) {
                                rs.close();
                            }

                            if (ps != null) {
                                ps.close();
                            }

                            if (con != null) {
                                con.close();
                            }

                        }
                    %>

                </tbody>

            </table>

        </div>

    </body>
</html>