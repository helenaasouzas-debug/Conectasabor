<%-- ============================================================
     Página: cadastrarPedido.jsp
     Cadastro de Pedidos
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Pedido - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Pedido
    </h2>

    <form action="formPedido.jsp" method="post">

        <div class="form-group">

            <label>ID do Usuário:</label>

            <input type="number"
                   name="id_usuario"
                   class="form-control"
                   min="1"
                   required>

            <small class="form-text text-muted">
                Informe o ID do usuário que está realizando o pedido.
            </small>

        </div>

        <div class="form-group">

            <label>ID do Funcionário:</label>

            <input type="number"
                   name="id_funcionario"
                   class="form-control"
                   min="1">

            <small class="form-text text-muted">
                Campo opcional.
            </small>

        </div>

        <div class="form-group">

            <label>ID do Entregador:</label>

            <input type="number"
                   name="id_entregador"
                   class="form-control"
                   min="1">

            <small class="form-text text-muted">
                Campo opcional. Pode ser definido posteriormente.
            </small>

        </div>

        <div class="form-group">

            <label>Forma de pagamento:</label>

            <select name="forma_pagamento"
                    class="form-control"
                    required>

                <option value="">Selecione</option>

                <option value="Dinheiro">
                    Dinheiro
                </option>

                <option value="Cartão de Crédito">
                    Cartão de Crédito
                </option>

                <option value="Cartão de Débito">
                    Cartão de Débito
                </option>

                <option value="PIX">
                    PIX
                </option>

            </select>

        </div>

        <div class="form-group">

            <label>Status:</label>

            <select name="status"
                    class="form-control">

                <option value="Pendente">
                    Pendente
                </option>

                <option value="Em preparo">
                    Em preparo
                </option>

                <option value="Saiu para entrega">
                    Saiu para entrega
                </option>

                <option value="Entregue">
                    Entregue
                </option>

                <option value="Cancelado">
                    Cancelado
                </option>

            </select>

        </div>

        <button type="submit"
                class="btn btn-success">
            Cadastrar Pedido
        </button>

        <a href="listarPedidos.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
7.
cadastrarItemPedido.jsp
Essa é uma página um pouco diferente. A tabela itens_pedido representa os itens que pertencem a um pedido.

Ela possui:

id_pedido
id_comida
quantidade
valor_total
Então podemos cadastrar um item informando o pedido, a comida e a quantidade.

<%-- ============================================================
     Página: cadastrarItemPedido.jsp
     Cadastro de Itens do Pedido
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Adicionar Item ao Pedido - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Adicionar Item ao Pedido
    </h2>

    <form action="formItemPedido.jsp" method="post">

        <div class="form-group">

            <label>ID do Pedido:</label>

            <input type="number"
                   name="id_pedido"
                   class="form-control"
                   min="1"
                   required>

        </div>

        <div class="form-group">

            <label>ID da Comida:</label>

            <input type="number"
                   name="id_comida"
                   class="form-control"
                   min="1"
                   required>

        </div>

        <div class="form-group">

            <label>Quantidade:</label>

            <input type="number"
                   name="quantidade"
                   class="form-control"
                   min="1"
                   required>

        </div>

        <div class="form-group">

            <label>Valor Total:</label>

            <input type="number"
                   name="valor_total"
                   class="form-control"
                   step="0.01"
                   min="0"
                   required>

            <small class="form-text text-muted">
                Valor total do item considerando a quantidade.
            </small>

        </div>

        <button type="submit"
                class="btn btn-success">
            Adicionar Item
        </button>

        <a href="listarPedidos.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
