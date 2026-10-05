<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String nome = "";
    String cnpj = "";
    String telefone = "";
    String email = "";

    try {
        con = Conexao.conectar();

        String sql = "SELECT * FROM fornecedores WHERE id=?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        if (rs.next()) {
            nome = rs.getString("nome");
            cnpj = rs.getString("cnpj");
            telefone = rs.getString("telefone");
            email = rs.getString("email");
        }

    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Fornecedor</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center">Editar Fornecedor</h2>

    <form action="atualizarFornecedor.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Nome</label>
            <input type="text"
                   name="nome"
                   class="form-control"
                   value="<%=nome%>"
                   required>
        </div>

        <div class="form-group">
            <label>CNPJ</label>
            <input type="text"
                   name="cnpj"
                   maxlength="14"
                   class="form-control"
                   value="<%=cnpj%>"
                   required>
        </div>

        <div class="form-group">
            <label>Telefone</label>
            <input type="text"
                   name="telefone"
                   maxlength="13"
                   class="form-control"
                   value="<%=telefone%>"
                   required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email"
                   name="email"
                   class="form-control"
                   value="<%=email%>">
        </div>

        <button class="btn btn-primary">
            Atualizar
        </button>

        <a href="listarFornecedor.jsp" class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>

<%
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
%>