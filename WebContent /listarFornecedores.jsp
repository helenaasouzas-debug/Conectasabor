<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas no banco. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Fornecedores - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center">
        Fornecedores Cadastrados
    </h2>

    <a href="cadastrarFornecedor.jsp"
       class="btn btn-success mb-3">
        Novo Fornecedor
    </a>

    <a href="index.jsp"
       class="btn btn-secondary mb-3">
        Voltar ao Início
    </a>

    <table class="table table-bordered table-hover table-striped">

        <thead class="thead-dark">

            <tr>

                <th>ID</th>
                <th>Nome</th>
                <th>CNPJ</th>
                <th>Telefone</th>
                <th>E-mail</th>
                <th>Ações</th>

            </tr>

        </thead>

        <tbody>

        <%

            // Declara a conexão.
            Connection con = null;

            // Declara o PreparedStatement.
            PreparedStatement ps = null;

            // Declara o ResultSet.
            ResultSet rs = null;

            try {

                // Abre a conexão.
                con = Conexao.conectar();

                // Cria o comando SQL.
                String sql = "SELECT * FROM fornecedores ORDER BY id";

                // Prepara o comando.
                ps = con.prepareStatement(sql);

                // Executa a consulta.
                rs = ps.executeQuery();

                // Percorre os fornecedores.
                while (rs.next()) {

        %>

            <tr>

                <td>
                    <%= rs.getInt("id") %>
                </td>

                <td>
                    <%= rs.getString("nome") %>
                </td>

                <td>
                    <%= rs.getString("cnpj") %>
                </td>

                <td>
                    <%= rs.getString("telefone") %>
                </td>

                <td>
                    <%= rs.getString("email") %>
                </td>

                <td>

                    <a href="editarFornecedor.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-warning btn-sm">
                        Editar
                    </a>

                    <a href="excluirFornecedor.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Deseja realmente excluir este fornecedor?');">
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

                        <strong>Erro:</strong>

                        <%= e.getMessage() %>

                    </div>

                </td>

            </tr>

        <%

            } finally {

                // Fecha o ResultSet.
                if (rs != null) {
                    rs.close();
                }

                // Fecha o PreparedStatement.
                if (ps != null) {
                    ps.close();
                }

                // Fecha a conexão.
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
