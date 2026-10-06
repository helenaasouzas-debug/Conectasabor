<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nome = request.getParameter("nome");
    String ingredientes = request.getParameter("ingredientes");
    String valor_unitario = request.getParameter("valor_unitario");
    String id_fornecedor = request.getParameter("id_fornecedor");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "UPDATE comidas SET nome=?, ingredientes=?, valor_unitario=?, id_fornecedor=? WHERE id=?";

        ps = con.prepareStatement(sql);

        ps.setString(1, nome);
        ps.setString(2, ingredientes);
        ps.setString(3, valor_unitario);
        ps.setString(4, id_fornecedor);
        ps.setInt(5, id);

        ps.executeUpdate();

        response.sendRedirect("listarComida.jsp");
        return;

    } catch (Exception e) {
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Erro</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao atualizar a comida!</h3>

        <hr>

        <%= e.getMessage()%>

    </div>

    <a href="listarComida.jsp" class="btn btn-primary">
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