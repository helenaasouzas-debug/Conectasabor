<%-- ============================================================
     Página: cadastrarFornecedor.jsp
     Cadastro de Fornecedores
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Fornecedor - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Fornecedor
    </h2>

    <form action="formFornecedor.jsp" method="post">

        <div class="form-group">

            <label>Nome:</label>

            <input type="text"
                   name="nome"
                   class="form-control"
                   maxlength="100"
                   required>

        </div>

        <div class="form-group">

            <label>CNPJ:</label>

            <input type="text"
                   name="cnpj"
                   class="form-control"
                   maxlength="14"
                   placeholder="Somente números"
                   required>

        </div>

        <div class="form-group">

            <label>Telefone:</label>

            <input type="text"
                   name="telefone"
                   class="form-control"
                   maxlength="13"
                   required>

        </div>

        <div class="form-group">

            <label>E-mail:</label>

            <input type="email"
                   name="email"
                   class="form-control"
                   maxlength="100">

        </div>

        <button type="submit"
                class="btn btn-success">
            Cadastrar
        </button>

        <a href="listarFornecedores.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
