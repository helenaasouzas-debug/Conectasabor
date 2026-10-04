<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String endereco = request.getParameter("endereco");

    String sql = "UPDATE usuarios SET nome=?, email=?, " +
                 "telefone=?, endereco=? WHERE id=?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, nome);
        ps.setString(2, email);
        ps.setString(3, telefone);
        ps.setString(4, endereco);
        ps.setInt(5, id);

        ps.executeUpdate();

        response.sendRedirect("listarUsuarios.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao atualizar usuário</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao atualizar o usuário!</h3>
        <hr>
        Verifique os dados informados. O e-mail também pode já estar
        cadastrado para outro usuário.
    </div>
    <a href="listarUsuarios.jsp" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
<%
    }
%>
