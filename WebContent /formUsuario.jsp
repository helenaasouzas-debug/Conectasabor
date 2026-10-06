<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o nome do usuário.
    String nome = request.getParameter("nome");

    // Recebe o e-mail do usuário.
    String email = request.getParameter("email");

    // Recebe o telefone do usuário.
    String telefone = request.getParameter("telefone");

    // Recebe o endereço do usuário.
    String endereco = request.getParameter("endereco");

    // Recebe a senha do usuário.
    String senha = request.getParameter("senha");

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "INSERT INTO usuarios "
                   + "(nome, email, telefone, endereco, senha) "
                   + "VALUES (?, ?, ?, ?, ?)";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Define o nome.
        ps.setString(1, nome);

        // Define o e-mail.
        ps.setString(2, email);

        // Define o telefone.
        ps.setString(3, telefone);

        // Define o endereço.
        ps.setString(4, endereco);

        // Define a senha.
        ps.setString(5, senha);

        // Executa o INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem.
        response.sendRedirect("listarUsuarios.jsp");

        // Encerra a execução.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Erro ao cadastrar usuário</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar usuário!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarUsuario.jsp" class="btn btn-primary">
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
