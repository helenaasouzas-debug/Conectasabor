<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Entregadores</title>

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>

    <body>

        <div class="container mt-4">

            <h2 class="text-center">Entregadores Cadastrados</h2>

            <a href="index.html" class="btn btn-success mb-3">
                Novo Cadastro
            </a>

            <table class="table table-bordered table-hovered table-striped">

                <thead class="thead-dark">

                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Data de Nascimento</th>
                        <th>Veículo</th>
                        <th>CNH</th>
                        <th>Órgão Emissor</th>
                        <th>Data de Emissão</th>
                        <th>Telefone</th>
                        <th>Email</th>
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

                            String sql = "SELECT * FROM entregadores ORDER BY id";

                            ps = con.prepareStatement(sql);

                            rs = ps.executeQuery();

                            while (rs.next()) {
                    %>

                    <tr>

                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("nome")%></td>
                        <td><%= rs.getString("cpf")%></td>
                        <td><%= rs.getString("data_nascimento")%></td>
                        <td><%= rs.getString("veiculo")%></td>
                        <td><%= rs.getString("cnh")%></td>
                        <td><%= rs.getString("orgao_emissor")%></td>
                        <td><%= rs.getString("data_emissao")%></td>
                        <td><%= rs.getString("telefone")%></td>
                        <td><%= rs.getString("email")%></td>

                        <td>

                            <a href="editarEntregador.jsp?id=<%= rs.getInt("id")%>"
                               class="btn btn-warning btn-sm">
                                Editar
                            </a>

                            <a href="excluirEntregador.jsp?id=<%= rs.getInt("id")%>"
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

                        <td colspan="11">

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