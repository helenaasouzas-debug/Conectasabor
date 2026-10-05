<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : formComida
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

<%-- Inicia o bloco de código Java da JSP. --%>
<%

    // Recebe o nome da comida enviado pelo formulário.
    String nome = request.getParameter("nome");

    // Recebe a descrição da comida.
    String descricao = request.getParameter("descricao");

    // Recebe os ingredientes da comida.
    String ingredientes = request.getParameter("ingredientes");

    // Recebe o preço da comida.
    String preco = request.getParameter("preco");

    // Recebe a disponibilidade da comida.
    String disponivel = request.getParameter("disponivel");

    // Declara a variável da conexão com o banco.
    Connection con = null;

    // Declara a variável para executar o comando SQL.
    PreparedStatement ps = null;

    // Inicia o tratamento de possíveis erros.
    try {

        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();

        // Cria o comando SQL para inserir uma nova comida.
        String sql = "INSERT INTO comidas "
                   + "(nome, descricao, ingredientes, preco, disponivel) "
                   + "VALUES (?, ?, ?, ?, ?)";

        // Prepara o comando SQL.
        ps = con.prepareStatement(sql);

        // Define o primeiro parâmetro como o nome.
        ps.setString(1, nome);

        // Define o segundo parâmetro como a descrição.
        ps.setString(2, descricao);

        // Define o terceiro parâmetro como os ingredientes.
        ps.setString(3, ingredientes);

        // Converte o preço para número decimal.
        ps.setBigDecimal(4, new java.math.BigDecimal(preco));

        // Define a disponibilidade como verdadeiro ou falso.
        ps.setBoolean(5, Boolean.parseBoolean(disponivel));

        // Executa o comando INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem de comidas.
        response.sendRedirect("listarComidas.jsp");

        // Encerra a execução da página.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Erro ao cadastrar comida</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar comida!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarComida.jsp" class="btn btn-primary">
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
