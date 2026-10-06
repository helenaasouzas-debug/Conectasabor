<%-- Define o tipo de conteúdo e a codificação. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o ID enviado pela URL.
    int id = Integer.parseInt(request.getParameter("id"));

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    // Declara o ResultSet.
    ResultSet rs = null;

    // Declara as variáveis do fornecedor.
    String nome = "";
    String cnpj = "";
    String telefone = "";
    String email = "";

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "SELECT * FROM fornecedores WHERE id = ?";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Define o ID.
        ps.setInt(1, id);

        // Executa a consulta.
        rs = ps.executeQuery();

        // Verifica se encontrou o fornecedor.
        if (rs.next()) {

            nome = rs.getString("nome");
            cnpj = rs.getString("cnpj");
            telefone = rs.getString("telefone");
            email = rs.getString("email");

        }

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Erro</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao buscar fornecedor!</h3>

        <p><%= e.getMessage() %></p>

    </div>

    <a href="listarFornecedores.jsp"
       class="btn btn-primary">
        Voltar
    </a>

</div>

</body>
</html>

<%

        return;

    } finally {

        if (rs != null) {
            rs.close();
        }

        if (ps != null) {
            ps.close();
        }

        if (con != null) {
            con.close();
        }

    }

%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Editar Fornecedor - FlashBite</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">
        Editar Fornecedor
    </h2>

    <form action="atualizarFornecedor.jsp" method="post">

        <%-- Envia o ID sem exibi-lo ao usuário. --%>
        <input type="hidden"
               name="id"
               value="<%= id %>">

        <div class="form-group">

            <label>Nome:</label>

            <input type="text"
                   name="nome"
                   class="form-control"
                   maxlength="100"
                   value="<%= nome %>"
                   required>

        </div>

        <div class="form-group">

            <label>CNPJ:</label>

            <input type="text"
                   name="cnpj"
                   class="form-control"
                   maxlength="14"
                   value="<%= cnpj %>"
                   required>

        </div>

        <div class="form-group">

            <label>Telefone:</label>

            <input type="text"
                   name="telefone"
                   class="form-control"
                   maxlength="13"
                   value="<%= telefone %>"
                   required>

        </div>

        <div class="form-group">

            <label>E-mail:</label>

            <input type="email"
                   name="email"
                   class="form-control"
                   maxlength="100"
                   value="<%= email != null ? email : "" %>">

        </div>

        <button type="submit"
                class="btn btn-success">
            Atualizar
        </button>

        <a href="listarFornecedores.jsp"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>
