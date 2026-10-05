<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    String status = request.getParameter("status");
    String forma_pagamento = request.getParameter("forma_pagamento");
    String id_usuario = request.getParameter("id_usuario");
    String id_funcionario = request.getParameter("id_funcionario");
    String id_entregador = request.getParameter("id_entregador");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "INSERT INTO pedidos (status, forma_pagamento, id_usuario, id_funcionario, id_entregador) VALUES (?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, status);
        ps.setString(2, forma_pagamento);
        ps.setString(3, id_usuario);
        ps.setString(4, id_funcionario);
        ps.setString(5, id_entregador);

        ps.executeUpdate();

        response.sendRedirect("listarPedido.jsp");

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

                <h3>Erro ao cadastrar o pedido!</h3>

                <p><%= e.getMessage()%></p>

            </div>

            <a href="index.html" class="btn btn-primary">
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