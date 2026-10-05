<%-- Define o tipo de conteúdo e a codificação. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o ID do fornecedor.
    int id = Integer.parseInt(request.getParameter("id"));

    // Recebe o nome.
    String nome = request.getParameter("nome");

    // Recebe o CNPJ.
    String cnpj = request.getParameter("cnpj");

    // Recebe o telefone.
    String telefone = request.getParameter("telefone");

    // Recebe o e-mail.
    String email = request.getParameter("email");

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "UPDATE fornecedores "
                   + "SET nome = ?, cnpj = ?, telefone = ?, email = ? "
                   + "WHERE id = ?";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Define o nome.
        ps.setString(1, nome);

        // Define o CNPJ.
        ps.setString(2, cnpj);

        // Define o telefone.
        ps.setString(3, telefone);

        // Define o e-mail.
        ps.setString(4, email);

        // Define o ID.
        ps.setInt(5, id);

        // Executa o UPDATE.
        ps.executeUpdate();

        // Retorna para a listagem.
        response.sendRedirect("listarFornecedores.jsp");

        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Erro ao atualizar fornecedor</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao atualizar fornecedor!</h3>

        <p><%= e.getMessage() %></p>

    </div>

    <a href="listarFornecedores.jsp"
       class="btn btn-primary">
        Voltar
    </a>

</div>

</body>
</html>

<%

    } finally {

        if (ps != null) {
            ps.close();
        }

        if (con != null) {
            con.close();
        }

    }

%>
