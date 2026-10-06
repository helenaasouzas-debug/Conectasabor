<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nome = "";
    String descricao = "";
    String ingredientes = "";
    double preco = 0;
    boolean disponivel = true;
    boolean encontrado = false;

    String sql = "SELECT * FROM comidas WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                nome = rs.getString("nome");
                descricao = rs.getString("descricao");
                ingredientes = rs.getString("ingredientes");
                preco = rs.getDouble("preco");
                disponivel = rs.getBoolean("disponivel");
                encontrado = true;
            }
        }
    } catch (Exception e) {
        out.println("Erro ao buscar comida: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Comida - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-4">

    <h2 class="text-center">Editar Comida</h2>

    <% if (encontrado) { %>
    <form action="atualizarComida.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Nome da comida</label>
            <input type="text" name="nome" class="form-control"
                   value="<%=nome%>" required>
        </div>

        <div class="form-group">
            <label>Descrição</label>
            <textarea name="descricao" class="form-control"
                      required><%=descricao%></textarea>
        </div>

        <div class="form-group">
            <label>Ingredientes</label>
            <textarea name="ingredientes" class="form-control"
                      required><%=ingredientes%></textarea>
        </div>

        <div class="form-group">
            <label>Preço (R$)</label>
            <input type="number" name="preco" class="form-control"
                   min="0.01" step="0.01"
                   value="<%=preco%>" required>
        </div>

        <div class="form-group">
            <label>Disponibilidade</label>
            <select name="disponivel" class="form-control">
                <option value="true"
                    <%=disponivel ? "selected" : ""%>>
                    Disponível
                </option>
                <option value="false"
                    <%=!disponivel ? "selected" : ""%>>
                    Indisponível
                </option>
            </select>
        </div>

        <button type="submit" class="btn btn-danger">
            Atualizar
        </button>

        <a href="listarComidas.jsp" class="btn btn-secondary">
            Cancelar
        </a>
    </form>
    <% } else { %>
        <div class="alert alert-warning">
            Comida não encontrada.
        </div>
        <a href="listarComidas.jsp" class="btn btn-secondary">
            Voltar
        </a>
    <% } %>

</div>
</body>
</html>
