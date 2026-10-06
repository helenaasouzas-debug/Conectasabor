<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : formFornecedor
    Author     : FlashBite
--%>

<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa a classe de conexão com o banco de dados. --%>
<%@page import="java.sql.Connection"%>

<%-- Importa a classe para executar comandos SQL. --%>
<%@page import="java.sql.PreparedStatement"%>

<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>

<%

    // Recebe o nome do fornecedor.
    String nome = request.getParameter("nome");

    // Recebe o CNPJ do fornecedor.
    String cnpj = request.getParameter("cnpj");

    // Recebe o telefone do fornecedor.
    String telefone = request.getParameter("telefone");

    // Recebe o e-mail do fornecedor.
    String email = request.getParameter("email");

    // Declara a variável da conexão.
    Connection con = null;

    // Declara a variável para executar o SQL.
    PreparedStatement ps = null;

    try {

        // Abre a conexão com o banco.
        con = Conexao.conectar();

        // Cria o comando SQL para inserir o fornecedor.
        String sql = "INSERT INTO fornecedores "
                   + "(nome, cnpj, telefone, email) "
                   + "VALUES (?, ?, ?, ?)";

        // Prepara o comando SQL.
        ps = con.prepareStatement(sql);

        // Define o nome.
        ps.setString(1, nome);

        // Define o CNPJ.
        ps.setString(2, cnpj);

        // Define o telefone.
        ps.setString(3, telefone);

        // Define o e-mail.
        ps.setString(4, email);

        // Executa o INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem.
        response.sendRedirect("listarFornecedores.jsp");

        // Encerra a execução.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Erro ao cadastrar fornecedor</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar fornecedor!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarFornecedor.jsp"
       class="btn btn-primary">
        Voltar
    </a>

</div>

</body>
</html>

<%

    } finally {

        // Verifica se o PreparedStatement foi criado.
        if (ps != null) {
            ps.close();
        }

        // Verifica se a conexão foi aberta.
        if (con != null) {
            con.close();
        }

    }

%>
