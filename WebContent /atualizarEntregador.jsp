<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String telefone = request.getParameter("telefone");
    String veiculo = request.getParameter("veiculo");
    String disponibilidade = request.getParameter("disponibilidade");

    String sql = "UPDATE entregadores SET nome=?, telefone=?, " +
                 "veiculo=?, disponibilidade=? WHERE id=?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, nome);
        ps.setString(2, telefone);
        ps.setString(3, veiculo);
        ps.setString(4, disponibilidade);
        ps.setInt(5, id);

        ps.executeUpdate();

        response.sendRedirect("listarEntregadores.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao atualizar entregador</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao atualizar o entregador!</h3>
        <hr>
        Verifique os dados informados e tente novamente.
    </div>
    <a href="listarEntregadores.jsp" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
<%
    }
%>
