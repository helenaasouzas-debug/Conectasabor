<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "DELETE FROM entregadores WHERE id = ?";

        ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ps.executeUpdate();

        response.sendRedirect("listarentregadores.jsp");

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

        <h3>Erro ao excluir o entregador!</h3>

        <hr>

        <strong>Detalhes do erro:</strong>

        <br><br>

        <%= e.getMessage()%>

    </div>

    <a href="listarEntregador.jsp" class="btn btn-primary">
        Voltar para a Listagem
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