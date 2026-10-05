<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    String nome = request.getParameter("nome");
    String cpf = request.getParameter("cpf");
    String data_nascimento = request.getParameter("data_nascimento");
    String genero = request.getParameter("genero");
    String rg = request.getParameter("rg");
    String orgao_emissor = request.getParameter("orgao_emissor");
    String data_emissao = request.getParameter("data_emissao");
    String telefone = request.getParameter("telefone");
    String email = request.getParameter("email");
    String id_usuario = request.getParameter("id_usuario");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "INSERT INTO funcionarios (nome, cpf, data_nascimento, genero, rg, orgao_emissor, data_emissao, telefone, email, id_usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, nome);
        ps.setString(2, cpf);
        ps.setString(3, data_nascimento);
        ps.setString(4, genero);
        ps.setString(5, rg);
        ps.setString(6, orgao_emissor);
        ps.setString(7, data_emissao);
        ps.setString(8, telefone);
        ps.setString(9, email);
        ps.setString(10, id_usuario);

        ps.executeUpdate();

        response.sendRedirect("listarFuncionario.jsp");

        return;

    } catch (Exception e) {
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Erro</title>

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    </head>

    <body>

        <div class="container mt-5">

            <div class="alert alert-danger">

                <h3>Erro ao cadastrar o funcionário!</h3>

                <p><%= e.getMessage()%></p>

            </div>

            <a href="index.html" class="btn btn-primary">
                Voltar
            </a>

        </div>

    </body>

</html>

<%
    } finally {

        if (ps != null) {
            ps.close();
        }

        if (con != null) {
            con.close();
        }

    }
%>