<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String nome = "";
    String ingredientes = "";
    String valorUnitario = "";
    String idFornecedor = "";

    try {
        con = Conexao.conectar();

        String sql = "SELECT * FROM comidas WHERE id=?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        if (rs.next()) {
            nome = rs.getString("nome");
            ingredientes = rs.getString("ingredientes");
            valorUnitario = rs.getString("valor_unitario");

            if (rs.getObject("id_fornecedor") != null) {
                idFornecedor = rs.getString("id_fornecedor");
            }
        }

    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Comida</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center">Editar Comida</h2>

    <form action="atualizarComidas.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Nome da Comida</label>
            <input type="text"
                   name="nome"
                   class="form-control"
                   value="<%=nome%>"
                   required>
        </div>

        <div class="form-group">
            <label>Ingredientes</label>
            <textarea name="ingredientes"
                      class="form-control"
                      rows="4"><%=ingredientes%></textarea>
        </div>

        <div class="form-group">
            <label>Valor Unitário</label>
            <input type="number"
                   name="valor_unitario"
                   class="form-control"
                   step="0.01"
                   value="<%=valorUnitario%>"
                   required>
        </div>

        <div class="form-group">
            <label>ID do Fornecedor</label>
            <input type="number"
                   name="id_fornecedor"
                   class="form-control"
                   value="<%=idFornecedor%>">
        </div>

        <button class="btn btn-primary">
            Atualizar
        </button>

        <a href="listarComida.jsp" class="btn btn-secondary">
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