<%-- ============================================================
     Página: cadastrarComida.jsp
     Cadastro de Comidas
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Comida - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Comida
    </h2>

    <form action="formComida.jsp" method="post">

        <div class="form-group">

            <label>Nome da comida:</label>

            <input type="text"
                   name="nome"
                   class="form-control"
                   maxlength="100"
                   required>

        </div>

        <div class="form-group">

            <label>Ingredientes:</label>

            <textarea name="ingredientes"
                      class="form-control"
                      rows="4"
                      placeholder="Informe os ingredientes da comida"></textarea>

        </div>

        <div class="form-group">

            <label>Valor unitário:</label>

            <input type="number"
                   name="valor_unitario"
                   class="form-control"
                   step="0.01"
                   min="0"
                   placeholder="0,00"
                   required>

        </div>

        <div class="form-group">

            <label>ID do Fornecedor:</label>

            <input type="number"
                   name="id_fornecedor"
                   class="form-control"
                   min="1">

            <small class="form-text text-muted">
                Campo opcional. Informe o ID de um fornecedor cadastrado.
            </small>

        </div>

        <button type="submit"
                class="btn btn-success">
            Cadastrar
        </button>

        <a href="listarComidas.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
