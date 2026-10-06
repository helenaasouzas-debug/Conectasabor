<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String sql = "DELETE FROM funcionarios WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        ps.executeUpdate();

        response.sendRedirect("listarFuncionarios.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao excluir funcionário</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao excluir o funcionário!</h3>
        <hr>
        <strong>Detalhes do erro:</strong><br><br>
        Não foi possível excluir o funcionário. Verifique os dados
        e as possíveis restrições do banco de dados.
    </div>
    <a href="listarFuncionarios.jsp" class="btn btn-primary">
        Voltar para a listagem
    </a>
</div>
</body>
</html>
<%
    }
%>
