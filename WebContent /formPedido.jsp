<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Types"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o ID do usuário.
    String usuarioId = request.getParameter("usuario_id");

    // Recebe o ID do entregador.
    String entregadorId = request.getParameter("entregador_id");

    // Recebe o endereço de entrega.
    String enderecoEntrega = request.getParameter("endereco_entrega");

    // Recebe a forma de pagamento.
    String formaPagamento = request.getParameter("forma_pagamento");

    // Recebe o status do pedido.
    String status = request.getParameter("status");

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "INSERT INTO pedidos "
                   + "(usuario_id, entregador_id, endereco_entrega, "
                   + "forma_pagamento, status) "
                   + "VALUES (?, ?, ?, ?, ?)";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Converte o ID do usuário para inteiro.
        ps.setInt(1, Integer.parseInt(usuarioId));

        // Verifica se foi informado um entregador.
        if (entregadorId != null && !entregadorId.trim().isEmpty()) {

            // Define o ID do entregador.
            ps.setInt(2, Integer.parseInt(entregadorId));

        } else {

            // Define o entregador como NULL.
            ps.setNull(2, Types.INTEGER);
        }

        // Define o endereço.
        ps.setString(3, enderecoEntrega);

        // Define a forma de pagamento.
        ps.setString(4, formaPagamento);

        // Define o status.
        ps.setString(5, status);

        // Executa o INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem.
        response.sendRedirect("listarPedidos.jsp");

        // Encerra a execução.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Erro ao cadastrar pedido</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar pedido!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarPedido.jsp" class="btn btn-primary">
        Voltar
    </a>

</div>

</body>
</html>

<%

    } finally {

        // Fecha o PreparedStatement.
        if (ps != null) {
            ps.close();
        }

        // Fecha a conexão.
        if (con != null) {
            con.close();
        }

    }

%>
