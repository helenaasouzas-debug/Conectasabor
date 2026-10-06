<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String sql = "DELETE FROM pedidos WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);
        int linhasAfetadas = ps.executeUpdate();

        if (linhasAfetadas == 0) {
            response.sendRedirect("listarPedidos.jsp");
            return;
        }

        response.sendRedirect("listarPedidos.jsp");
        return;

    } catch (Exception e) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro ao excluir pedido</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-5">
    <div class="alert alert-danger">
        <h3>Erro ao excluir o pedido!</h3>
        <hr>
        <strong>Detalhes do erro:</strong><br><br>
        Não foi possível excluir o pedido. Ele pode possuir itens
        vinculados ou outras restrições no banco de dados.
        Considere alterar o status para "Cancelado".
    </div>
    <a href="listarPedidos.jsp" class="btn btn-primary">
        Voltar para a listagem
    </a>
</div>
</body>
</html>
<%
    }
%>
