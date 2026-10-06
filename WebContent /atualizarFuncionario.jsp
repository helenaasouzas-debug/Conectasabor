<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String telefone = request.getParameter("telefone");
    String cargo = request.getParameter("cargo");
    String turno = request.getParameter("turno");

    String sql = "UPDATE funcionarios SET nome=?, telefone=?, " +
                 "cargo=?, turno=? WHERE id=?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, nome);
        ps.setString(2, telefone);
        ps.setString(3, cargo);
        ps.setString(4, turno);
        ps.setInt(5, id);

        ps.executeUpdate();

        response.sendRedirect("listarFuncionarios.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao atualizar funcionário</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao atualizar o funcionário!</h3>
        <hr>
        Verifique os dados informados e tente novamente.
    </div>
    <a href="listarFuncionarios.jsp" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
<%
    }
%>
