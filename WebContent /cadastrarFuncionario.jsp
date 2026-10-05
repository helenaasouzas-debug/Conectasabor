<%-- ============================================================
     Página: cadastrarFuncionario.jsp
     Cadastro de Funcionários
     ============================================================ --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Cadastro de Funcionário - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Cadastro de Funcionário
    </h2>

    <form action="formFuncionario.jsp" method="post">

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
            <label>Gênero:</label>

            <select name="genero"
                    class="form-control">

                <option value="">Selecione</option>
                <option value="Feminino">Feminino</option>
                <option value="Masculino">Masculino</option>
                <option value="Outro">Outro</option>

            </select>
        </div>

        <div class="form-group">
            <label>RG:</label>

            <input type="text"
                   name="rg"
                   class="form-control"
                   maxlength="12">
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

        <div class="form-group">
            <label>ID do Usuário (opcional):</label>

            <input type="number"
                   name="id_usuario"
                   class="form-control"
                   min="1">

            <small class="form-text text-muted">
                Deixe vazio caso o funcionário não possua usuário de acesso.
            </small>
        </div>

        <button type="submit"
                class="btn btn-success">
            Cadastrar
        </button>

        <a href="listarFuncionarios.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
