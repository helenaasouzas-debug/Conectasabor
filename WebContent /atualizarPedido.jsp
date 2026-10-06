<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int usuarioId = Integer.parseInt(request.getParameter("usuario_id"));

    String entregadorParam = request.getParameter("entregador_id");
    String enderecoEntrega = request.getParameter("endereco_entrega");
    String formaPagamento = request.getParameter("forma_pagamento");
    String status = request.getParameter("status");

    String sql = "UPDATE pedidos SET usuario_id=?, entregador_id=?, " +
                 "endereco_entrega=?, forma_pagamento=?, status=? " +
                 "WHERE id=?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, usuarioId);

        if (entregadorParam == null || entregadorParam.trim().isEmpty()) {
            ps.setNull(2, Types.INTEGER);
        } else {
            ps.setInt(2, Integer.parseInt(entregadorParam));
        }

        ps.setString(3, enderecoEntrega);
        ps.setString(4, formaPagamento);
        ps.setString(5, status);
        ps.setInt(6, id);

        ps.executeUpdate();

        response.sendRedirect("listarPedidos.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao atualizar pedido</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao atualizar o pedido!</h3>
        <hr>
        Verifique os dados e confirme se o cliente e o entregador
        informados existem no banco de dados.
    </div>
    <a href="listarPedidos.jsp" class="btn btn-primary">Voltar</a>
</div>
</body>
</html>
<%
    }
%>
