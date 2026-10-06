<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="util.Conexao"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String descricao = request.getParameter("descricao");
    String ingredientes = request.getParameter("ingredientes");
    BigDecimal preco = new BigDecimal(request.getParameter("preco"));
    boolean disponivel = Boolean.parseBoolean(
        request.getParameter("disponivel")
    );

    String sql = "UPDATE comidas SET nome=?, descricao=?, " +
                 "ingredientes=?, preco=?, disponivel=? WHERE id=?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, nome);
        ps.setString(2, descricao);
        ps.setString(3, ingredientes);
        ps.setBigDecimal(4, preco);
        ps.setBoolean(5, disponivel);
        ps.setInt(6, id);

        ps.executeUpdate();

        response.sendRedirect("listarComidas.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao atualizar comida</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao atualizar a comida!</h3>
        <hr>
        Verifique os dados informados e tente novamente.
    </div>
    <a href="listarComidas.jsp" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
<%
    }
%>
