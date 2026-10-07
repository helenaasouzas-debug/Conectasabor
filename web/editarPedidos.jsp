<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String dataPedido = "";
    String status = "";
    String formaPagamento = "";
    String idUsuario = "";
    String idFuncionario = "";
    String idEntregador = "";

    try {
        con = Conexao.conectar();

        String sql = "SELECT * FROM pedidos WHERE id=?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        if (rs.next()) {
            dataPedido = rs.getString("data_pedido");
            status = rs.getString("status");
            formaPagamento = rs.getString("forma_pagamento");

            if (rs.getObject("id_usuario") != null) {
                idUsuario = rs.getString("id_usuario");
            }

            if (rs.getObject("id_funcionario") != null) {
                idFuncionario = rs.getString("id_funcionario");
            }

            if (rs.getObject("id_entregador") != null) {
                idEntregador = rs.getString("id_entregador");
            }
        }

    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Pedido</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center">Editar Pedido</h2>

    <form action="atualizarPedidos.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Data do Pedido</label>
            <input type="text"
                   name="data_pedido"
                   class="form-control"
                   value="<%=dataPedido%>"
                   readonly>
        </div>

        <div class="form-group">
            <label>Status</label>
            <input type="text"
                   name="status"
                   class="form-control"
                   value="<%=status%>"
                   required>
        </div>

        <div class="form-group">
            <label>Forma de Pagamento</label>
            <input type="text"
                   name="forma_pagamento"
                   class="form-control"
                   value="<%=formaPagamento%>"
                   required>
        </div>

        <div class="form-group">
            <label>ID do Usuário</label>
            <input type="number"
                   name="id_usuario"
                   class="form-control"
                   value="<%=idUsuario%>"
                   required>
        </div>

        <div class="form-group">
            <label>ID do Funcionário</label>
            <input type="number"
                   name="id_funcionario"
                   class="form-control"
                   value="<%=idFuncionario%>">
        </div>

        <div class="form-group">
            <label>ID do Entregador</label>
            <input type="number"
                   name="id_entregador"
                   class="form-control"
                   value="<%=idEntregador%>">
        </div>

        <button class="btn btn-primary">
            Atualizar
        </button>

        <a href="listarPedido.jsp" class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>

<%
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
%>