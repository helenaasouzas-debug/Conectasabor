<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<!DOCTYPE html>

<html lang="pt-BR">

<head>

    <!-- Define o conjunto de caracteres. -->
    <meta charset="UTF-8">

    <!-- Faz a página se adaptar a diferentes telas. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Título da página. -->
    <title>Cadastrar Pedido</title>

    <!-- Bootstrap 4.6.2. -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

    <!-- Container principal. -->
    <div class="container mt-5">

        <!-- Título. -->
        <h2 class="text-center mb-4">
            Cadastrar Pedido
        </h2>


        <%
            Connection con = null;

            PreparedStatement psUsuarios = null;
            PreparedStatement psComidas = null;

            ResultSet rsUsuarios = null;
            ResultSet rsComidas = null;

            try {

                // Abre a conexão com o banco.
                con = Conexao.conectar();


                // ========================================================
                // BUSCA OS USUÁRIOS
                // ========================================================

                String sqlUsuarios =
                        "SELECT id, nome FROM usuarios ORDER BY nome";

                psUsuarios = con.prepareStatement(sqlUsuarios);

                rsUsuarios = psUsuarios.executeQuery();


                // ========================================================
                // BUSCA AS COMIDAS
                // ========================================================

                String sqlComidas =
                        "SELECT id, nome, valor_unitario "
                        + "FROM comidas "
                        + "ORDER BY nome";

                psComidas = con.prepareStatement(sqlComidas);

                rsComidas = psComidas.executeQuery();

        %>


        <!-- ============================================================ -->
        <!-- FORMULÁRIO -->
        <!-- ============================================================ -->

        <form action="formPedido.jsp" method="post">


            <!-- ======================================================== -->
            <!-- CLIENTE -->
            <!-- ======================================================== -->

            <div class="form-group">

                <label for="id_usuario">
                    Cliente
                </label>

                <select name="id_usuario"
                        id="id_usuario"
                        class="form-control"
                        required>

                    <option value="">
                        Selecione o cliente
                    </option>

                    <%
                        while (rsUsuarios.next()) {
                    %>

                    <option value="<%= rsUsuarios.getInt("id")%>">

                        <%= rsUsuarios.getString("nome")%>

                    </option>

                    <%
                        }
                    %>

                </select>

            </div>


            <!-- ======================================================== -->
            <!-- FORMA DE PAGAMENTO -->
            <!-- ======================================================== -->

            <div class="form-group">

                <label for="forma_pagamento">
                    Forma de Pagamento
                </label>

                <select name="forma_pagamento"
                        id="forma_pagamento"
                        class="form-control"
                        required>

                    <option value="">
                        Selecione
                    </option>

                    <option value="Pix">
                        Pix
                    </option>

                    <option value="Cartão de Crédito">
                        Cartão de Crédito
                    </option>

                    <option value="Cartão de Débito">
                        Cartão de Débito
                    </option>

                    <option value="Dinheiro">
                        Dinheiro
                    </option>

                </select>

            </div>


            <!-- ======================================================== -->
            <!-- ÁREA PARA ADICIONAR ITENS -->
            <!-- ======================================================== -->

            <h4 class="mt-4">
                Itens do Pedido
            </h4>


            <div id="itens">


                <!-- PRIMEIRO ITEM -->
                <div class="row item-pedido mb-3">

                    <!-- Comida -->
                    <div class="col-md-7">

                        <label>
                            Comida
                        </label>

                        <select name="id_comida"
                                class="form-control"
                                required>

                            <option value="">
                                Selecione a comida
                            </option>

                            <%
                                /*
                                    Como o ResultSet é percorrido novamente
                                    para cada nova linha através do JavaScript,
                                    precisamos criar as opções como texto
                                    dentro do HTML.
                                */

                                while (rsComidas.next()) {
                            %>

                            <option value="<%= rsComidas.getInt("id")%>">

                                <%= rsComidas.getString("nome")%>
                                -
                                R$ <%= rsComidas.getBigDecimal("valor_unitario")%>

                            </option>

                            <%
                                }
                            %>

                        </select>

                    </div>


                    <!-- Quantidade -->
                    <div class="col-md-3">

                        <label>
                            Quantidade
                        </label>

                        <input type="number"
                               name="quantidade"
                               class="form-control"
                               min="1"
                               value="1"
                               required>

                    </div>


                    <!-- Botão remover -->
                    <div class="col-md-2">

                        <label>
                            &nbsp;
                        </label>

                        <button type="button"
                                class="btn btn-danger form-control"
                                onclick="removerItem(this)">

                            Remover

                        </button>

                    </div>

                </div>

            </div>


            <!-- ======================================================== -->
            <!-- BOTÃO ADICIONAR ITEM -->
            <!-- ======================================================== -->

            <button type="button"
                    class="btn btn-primary mb-4"
                    onclick="adicionarItem()">

                + Adicionar Item

            </button>


            <!-- ======================================================== -->
            <!-- BOTÕES -->
            <!-- ======================================================== -->

            <div class="mt-3">

                <button type="submit"
                        class="btn btn-success">

                    Finalizar Pedido

                </button>


                <a href="listarPedido.jsp"
                   class="btn btn-secondary">

                    Cancelar

                </a>

            </div>

        </form>


        <%
            } catch (Exception e) {
        %>


        <!-- ============================================================ -->
        <!-- ERRO -->
        <!-- ============================================================ -->

        <div class="alert alert-danger mt-4">

            <h4>
                Erro ao carregar os dados!
            </h4>

            <p>
                <%= e.getMessage()%>
            </p>

        </div>


        <%
            } finally {

                // Fecha o ResultSet dos usuários.
                if (rsUsuarios != null) {
                    rsUsuarios.close();
                }

                // Fecha o ResultSet das comidas.
                if (rsComidas != null) {
                    rsComidas.close();
                }

                // Fecha o PreparedStatement dos usuários.
                if (psUsuarios != null) {
                    psUsuarios.close();
                }

                // Fecha o PreparedStatement das comidas.
                if (psComidas != null) {
                    psComidas.close();
                }

                // Fecha a conexão.
                if (con != null) {
                    con.close();
                }
            }
        %>

    </div>


    <!-- ================================================================ -->
    <!-- JAVASCRIPT -->
    <!-- ================================================================ -->

    <script>

        // Adiciona uma nova linha de item.
        function adicionarItem() {

            // Pega a área onde os itens ficam.
            var itens = document.getElementById("itens");

            // Pega o primeiro item existente.
            var primeiroItem =
                    document.querySelector(".item-pedido");

            // Cria uma cópia do primeiro item.
            var novoItem =
                    primeiroItem.cloneNode(true);

            // Limpa a comida selecionada.
            novoItem.querySelector("select").selectedIndex = 0;

            // Define a quantidade novamente como 1.
            novoItem.querySelector("input").value = 1;

            // Adiciona o novo item na página.
            itens.appendChild(novoItem);
        }


        // Remove um item.
        function removerItem(botao) {

            // Conta quantos itens existem.
            var itens =
                    document.querySelectorAll(".item-pedido");

            /*
                Não permite remover o último item.
                O pedido precisa ter pelo menos uma comida.
            */
            if (itens.length > 1) {

                // Encontra a linha do botão clicado.
                var item =
                        botao.closest(".item-pedido");

                // Remove a linha.
                item.remove();

            }

        }

    </script>

</body>

</html>