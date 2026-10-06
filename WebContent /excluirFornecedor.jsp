<%-- Define o tipo de conteúdo e a codificação. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o ID do fornecedor.
    int id = Integer.parseInt(request.getParameter("id"));

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "DELETE FROM fornecedores WHERE id = ?";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Define o ID.
        ps.setInt(1, id);

        // Executa o DELETE.
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

    <title>Erro ao excluir fornecedor</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao excluir fornecedor!</h3>

        <p><%= e.getMessage() %></p>

        <p>
            Verifique se existem comidas cadastradas
            vinculadas a este fornecedor.
        </p>

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
