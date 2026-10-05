<%-- ============================================================
     Página: cadastrarUsuario.jsp
     Cadastro de Usuários/Clientes
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Usuário - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Usuário
    </h2>

    <form action="formUsuario.jsp" method="post">

        <div class="form-group">
            <label>Nome:</label>
            <input type="text"
                   name="nome"
                   class="form-control"
                   maxlength="100"
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

        <div class="form-group">
            <label>Senha:</label>
            <input type="password"
                   name="senha"
                   class="form-control"
                   maxlength="12"
                   required>
        </div>

        <div class="form-group">
            <label>Endereço:</label>
            <input type="text"
                   name="endereco"
                   class="form-control"
                   maxlength="150"
                   required>
        </div>

        <div class="form-group">
            <label>Número:</label>
            <input type="text"
                   name="numero"
                   class="form-control"
                   maxlength="10"
                   required>
        </div>

        <div class="form-group">
            <label>Bairro:</label>
            <input type="text"
                   name="bairro"
                   class="form-control"
                   maxlength="50"
                   required>
        </div>

        <div class="form-group">
            <label>Cidade:</label>
            <input type="text"
                   name="cidade"
                   class="form-control"
                   maxlength="50"
                   required>
        </div>

        <div class="form-group">
            <label>Estado:</label>
            <input type="text"
                   name="estado"
                   class="form-control"
                   maxlength="2"
                   placeholder="RS"
                   required>
        </div>

        <div class="form-group">
            <label>CEP:</label>
            <input type="text"
                   name="cep"
                   class="form-control"
                   maxlength="8"
                   required>
        </div>

        <button type="submit" class="btn btn-success">
            Cadastrar
        </button>

        <a href="listarUsuarios.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
