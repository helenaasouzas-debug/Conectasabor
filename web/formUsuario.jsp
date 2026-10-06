<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String endereco = request.getParameter("endereco");
    String numero = request.getParameter("numero");
    String bairro = request.getParameter("bairro");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String cep = request.getParameter("cep");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "INSERT INTO usuarios (nome, email, senha, endereco, numero, bairro, cidade, estado, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, nome);
        ps.setString(2, email);
        ps.setString(3, senha);
        ps.setString(4, endereco);
        ps.setString(5, numero);
        ps.setString(6, bairro);
        ps.setString(7, cidade);
        ps.setString(8, estado);
        ps.setString(9, cep);

        ps.executeUpdate();

        response.sendRedirect("listarUsuario.jsp");

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

                <h3>Erro ao cadastrar o usuário!</h3>

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