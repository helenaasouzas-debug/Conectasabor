<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    int usuarioId = 0;
    int entregadorId = 0;
    String enderecoEntrega = "";
    String formaPagamento = "";
    String status = "Pendente";
    boolean encontrado = false;

    String sql = "SELECT * FROM pedidos WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                usuarioId = rs.getInt("usuario_id");
                entregadorId = rs.getInt("entregador_id");
                enderecoEntrega = rs.getString("endereco_entrega");
                formaPagamento = rs.getString("forma_pagamento");
                status = rs.getString("status");
                encontrado = true;
            }
        }
    } catch (Exception e) {
        out.println("Erro ao buscar pedido: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Pedido - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">

    <h2 class="text-center">Editar Pedido</h2>

    <% if (encontrado) { %>
    <form action="atualizarPedido.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>ID do cliente</label>
            <input type="number" name="usuario_id"
                   class="form-control" min="1"
                   value="<%=usuarioId%>" required>
        </div>

        <div class="form-group">
            <label>ID do entregador</label>
            <input type="number" name="entregador_id"
                   class="form-control" min="1"
                   value="<%=entregadorId%>">
            <small class="form-text text-muted">
                Informe o ID de um entregador cadastrado.
                Deixe vazio se o pedido ainda não tiver entregador.
            </small>
        </div>

        <div class="form-group">
            <label>Endereço de entrega</label>
            <textarea name="endereco_entrega"
                      class="form-control"
                      required><%=enderecoEntrega == null ? "" : enderecoEntrega%></textarea>
        </div>

        <div class="form-group">
            <label>Forma de pagamento</label>
            <select name="forma_pagamento" class="form-control" required>
                <option value="Pix"
                    <%= "Pix".equals(formaPagamento) ? "selected" : "" %>>
                    Pix
                </option>
                <option value="Cartão de crédito"
                    <%= "Cartão de crédito".equals(formaPagamento) ? "selected" : "" %>>
                    Cartão de crédito
                </option>
                <option value="Cartão de débito"
                    <%= "Cartão de débito".equals(formaPagamento) ? "selected" : "" %>>
                    Cartão de débito
                </option>
                <option value="Dinheiro"
                    <%= "Dinheiro".equals(formaPagamento) ? "selected" : "" %>>
                    Dinheiro
                </option>
            </select>
        </div>

        <div class="form-group">
            <label>Status do pedido</label>
            <select name="status" class="form-control" required>
                <option value="Pendente"
                    <%= "Pendente".equals(status) ? "selected" : "" %>>
                    Pendente
                </option>
                <option value="Em preparo"
                    <%= "Em preparo".equals(status) ? "selected" : "" %>>
                    Em preparo
                </option>
                <option value="Saiu para entrega"
                    <%= "Saiu para entrega".equals(status) ? "selected" : "" %>>
                    Saiu para entrega
                </option>
                <option value="Entregue"
                    <%= "Entregue".equals(status) ? "selected" : "" %>>
                    Entregue
                </option>
                <option value="Cancelado"
                    <%= "Cancelado".equals(status) ? "selected" : "" %>>
                    Cancelado
                </option>
            </select>
        </div>

        <button type="submit" class="btn btn-danger">
            Atualizar
        </button>

        <a href="listarPedidos.jsp" class="btn btn-secondary">
            Cancelar
        </a>
    </form>
    <% } else { %>
        <div class="alert alert-warning">
            Pedido não encontrado.
        </div>
        <a href="listarPedidos.jsp" class="btn btn-secondary">
            Voltar
        </a>
    <% } %>

</div>
</body>
</html>
