<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Importa as classes utilizadas. --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%

    // Recebe o nome do funcionário.
    String nome = request.getParameter("nome");

    // Recebe o telefone do funcionário.
    String telefone = request.getParameter("telefone");

    // Recebe o cargo do funcionário.
    String cargo = request.getParameter("cargo");

    // Recebe o turno do funcionário.
    String turno = request.getParameter("turno");

    // Declara a conexão.
    Connection con = null;

    // Declara o PreparedStatement.
    PreparedStatement ps = null;

    try {

        // Abre a conexão.
        con = Conexao.conectar();

        // Cria o comando SQL.
        String sql = "INSERT INTO funcionarios "
                   + "(nome, telefone, cargo, turno) "
                   + "VALUES (?, ?, ?, ?)";

        // Prepara o comando.
        ps = con.prepareStatement(sql);

        // Define o nome.
        ps.setString(1, nome);

        // Define o telefone.
        ps.setString(2, telefone);

        // Define o cargo.
        ps.setString(3, cargo);

        // Define o turno.
        ps.setString(4, turno);

        // Executa o INSERT.
        ps.executeUpdate();

        // Redireciona para a listagem.
        response.sendRedirect("listarFuncionarios.jsp");

        // Encerra a execução.
        return;

    } catch (Exception e) {

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Erro ao cadastrar funcionário</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container mt-5">

    <div class="alert alert-danger">

        <h3>Erro ao cadastrar funcionário!</h3>

        <p><%= e.getMessage()%></p>

    </div>

    <a href="cadastrarFuncionario.jsp" class="btn btn-primary">
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
