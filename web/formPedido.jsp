<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="util.Conexao"%>

<%
    // ================================================================
    // RECEBE OS DADOS DO PEDIDO
    // ================================================================

    // Recebe o ID do cliente.
    String id_usuario = request.getParameter("id_usuario");

    // Recebe a forma de pagamento.
    String forma_pagamento =
            request.getParameter("forma_pagamento");


    // ================================================================
    // RECEBE TODOS OS ITENS
    // ================================================================

    /*
        Como podem existir vários itens, usamos
        getParameterValues() em vez de getParameter().
    */

    String[] id_comidas =
            request.getParameterValues("id_comida");

    String[] quantidades =
            request.getParameterValues("quantidade");


    Connection con = null;

    PreparedStatement psPedido = null;
    PreparedStatement psComida = null;
    PreparedStatement psItem = null;

    ResultSet rsPedido = null;
    ResultSet rsComida = null;


    try {

        // Abre a conexão com o banco.
        con = Conexao.conectar();


        // ============================================================
        // INICIA UMA TRANSAÇÃO
        // ============================================================

        /*
            A transação faz com que o pedido e seus itens
            sejam gravados juntos.

            Se acontecer algum erro no meio do processo,
            podemos cancelar tudo.
        */
        con.setAutoCommit(false);


        // ============================================================
        // 1. CADASTRA O PEDIDO
        // ============================================================

        String sqlPedido =
                "INSERT INTO pedidos "
                + "(forma_pagamento, id_usuario) "
                + "VALUES (?, ?)";


        /*
            RETURN_GENERATED_KEYS permite recuperar
            o ID gerado automaticamente pelo MySQL.
        */
        psPedido = con.prepareStatement(
                sqlPedido,
                Statement.RETURN_GENERATED_KEYS
        );


        // Define a forma de pagamento.
        psPedido.setString(
                1,
                forma_pagamento
        );


        // Define o cliente.
        psPedido.setInt(
                2,
                Integer.parseInt(id_usuario)
        );


        // Executa o cadastro do pedido.
        psPedido.executeUpdate();


        // ============================================================
        // 2. PEGA O ID DO PEDIDO
        // ============================================================

        rsPedido =
                psPedido.getGeneratedKeys();


        rsPedido.next();


        // Guarda o ID gerado.
        int idPedido =
                rsPedido.getInt(1);


        // ============================================================
        // 3. PREPARA A CONSULTA DA COMIDA
        // ============================================================

        String sqlComida =
                "SELECT valor_unitario "
                + "FROM comidas "
                + "WHERE id = ?";


        psComida =
                con.prepareStatement(sqlComida);


        // ============================================================
        // 4. PREPARA O INSERT DOS ITENS
        // ============================================================

        String sqlItem =
                "INSERT INTO itens_pedido "
                + "(id_pedido, id_comida, quantidade, valor_total) "
                + "VALUES (?, ?, ?, ?)";


        psItem =
                con.prepareStatement(sqlItem);


        // ============================================================
        // 5. PERCORRE TODOS OS ITENS
        // ============================================================

        for (int i = 0; i < id_comidas.length; i++) {


            // --------------------------------------------------------
            // ID DA COMIDA
            // --------------------------------------------------------

            int idComida =
                    Integer.parseInt(id_comidas[i]);


            // --------------------------------------------------------
            // QUANTIDADE
            // --------------------------------------------------------

            int quantidade =
                    Integer.parseInt(quantidades[i]);


            // ========================================================
            // BUSCA O PREÇO DA COMIDA
            // ========================================================

            psComida.setInt(
                    1,
                    idComida
            );


            rsComida =
                    psComida.executeQuery();


            rsComida.next();


            // Pega o valor unitário.
            BigDecimal valorUnitario =
                    rsComida.getBigDecimal(
                            "valor_unitario"
                    );


            // ========================================================
            // CALCULA O VALOR TOTAL DO ITEM
            // ========================================================

            /*
                Exemplo:

                Pizza = R$ 30,00
                Quantidade = 2

                30 x 2 = R$ 60,00
            */

            BigDecimal valorTotal =
                    valorUnitario.multiply(
                            BigDecimal.valueOf(quantidade)
                    );


            // ========================================================
            // CADASTRA O ITEM
            // ========================================================

            // Define o ID do pedido.
            psItem.setInt(
                    1,
                    idPedido
            );


            // Define a comida.
            psItem.setInt(
                    2,
                    idComida
            );


            // Define a quantidade.
            psItem.setInt(
                    3,
                    quantidade
            );


            // Define o valor total do item.
            psItem.setBigDecimal(
                    4,
                    valorTotal
            );


            // Executa o INSERT.
            psItem.executeUpdate();


            // Fecha o ResultSet da consulta atual.
            rsComida.close();

        }


        // ============================================================
        // 6. CONFIRMA A TRANSAÇÃO
        // ============================================================

        con.commit();


        // ============================================================
        // 7. VOLTA PARA A LISTAGEM
        // ============================================================

        response.sendRedirect(
                "listarPedido.jsp"
        );

        return;


    } catch (Exception e) {


        // ============================================================
        // CANCELA A TRANSAÇÃO SE OCORRER ALGUM ERRO
        // ============================================================

        if (con != null) {

            try {

                con.rollback();

            } catch (Exception erroRollback) {

            }

        }

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

            <h3>
                Erro ao cadastrar o pedido!
            </h3>

            <p>
                <%= e.getMessage()%>
            </p>

        </div>


        <a href="cadastrarPedido.jsp"
           class="btn btn-primary">

            Voltar

        </a>

    </div>

</body>

</html>


<%
    } finally {


        // ============================================================
        // FECHA OS RECURSOS
        // ============================================================

        if (rsComida != null) {
            rsComida.close();
        }


        if (rsPedido != null) {
            rsPedido.close();
        }


        if (psItem != null) {
            psItem.close();
        }


        if (psComida != null) {
            psComida.close();
        }


        if (psPedido != null) {
            psPedido.close();
        }


        if (con != null) {

            con.setAutoCommit(true);

            con.close();

        }

    }
%>