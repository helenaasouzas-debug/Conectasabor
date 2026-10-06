<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas para conexão e SQL. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o nome do entregador.
    String nome = request.getParameter("nome");

    // Recebe o telefone do entregador.
    String telefone = request.getParameter("telefone");

    // Recebe o veículo utilizado pelo entregador.
    String veiculo = request.getParameter("veiculo");

    // Recebe a disponibilidade do entregador.
    String disponibilidade = request.getParameter("disponibilidade");

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão com o banco.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "INSERT INTO entregadores "
                   + "(nome, telefone, veiculo, disponibilidade) "
                   + "VALUES (?, ?, ?, ?)";

        // Prepara o comando SQL.
        ps = con.prepareStatement(sql);

        // Define o nome.
        ps.setString(1, nome);

        // Define o telefone.
        ps.setString(2, telefone);

        // Define o veículo.
        ps.setString(3, veiculo);

        // Define a disponibilidade.
        ps.setString(4, disponibilidade);

        // Executa o INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem.
        response.sendRedirect("listarEntregadores.jsp");

        // Encerra a execução.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Erro ao cadastrar entregador</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar entregador!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarEntregador.jsp" class="btn btn-primary">
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
