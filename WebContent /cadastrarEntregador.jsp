<%-- ============================================================
     Página: cadastrarEntregador.jsp
     Cadastro de Entregadores
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Entregador - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Entregador
    </h2>

    <form action="formEntregador.jsp" method="post">

        <div class="form-group">
            <label>Nome:</label>

            <input type="text"
                   name="nome"
                   class="form-control"
                   maxlength="100"
                   required>
        </div>

        <div class="form-group">
            <label>CPF:</label>

            <input type="text"
                   name="cpf"
                   class="form-control"
                   maxlength="11"
                   placeholder="Somente números"
                   required>
        </div>

        <div class="form-group">
            <label>Data de nascimento:</label>

            <input type="date"
                   name="data_nascimento"
                   class="form-control"
                   required>
        </div>

        <div class="form-group">
            <label>Veículo:</label>

            <input type="text"
                   name="veiculo"
                   class="form-control"
                   maxlength="50"
                   required>
        </div>

        <div class="form-group">
            <label>CNH:</label>

            <input type="text"
                   name="cnh"
                   class="form-control"
                   maxlength="11"
                   placeholder="Somente números"
                   required>
        </div>

        <div class="form-group">
            <label>Órgão emissor:</label>

            <input type="text"
                   name="orgao_emissor"
                   class="form-control"
                   maxlength="20">
        </div>

        <div class="form-group">
            <label>Data de emissão:</label>

            <input type="date"
                   name="data_emissao"
                   class="form-control">
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
                   maxlength="100"
                   required>
        </div>

        <button type="submit"
                class="btn btn-success">
            Cadastrar
        </button>

        <a href="listarEntregadores.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
