<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Conexao"%>

<%
    String nome = request.getParameter("nome");
    String ingredientes = request.getParameter("ingredientes");
    String valor_unitario = request.getParameter("valor_unitario");
    String id_fornecedor = request.getParameter("id_fornecedor");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Conexao.conectar();

        String sql = "INSERT INTO comidas (nome, ingredientes, valor_unitario, id_fornecedor) VALUES (?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setString(1, nome);
        ps.setString(2, ingredientes);
        ps.setString(3, valor_unitario);
        ps.setString(4, id_fornecedor);

        ps.executeUpdate();

        response.sendRedirect("listarComida.jsp");

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

                <h3>Erro ao cadastrar a comida!</h3>

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