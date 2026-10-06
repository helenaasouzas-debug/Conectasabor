<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nome = "";
    String email = "";
    String telefone = "";
    String endereco = "";
    boolean encontrado = false;

    String sql = "SELECT * FROM usuarios WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                nome = rs.getString("nome");
                email = rs.getString("email");
                telefone = rs.getString("telefone");
                endereco = rs.getString("endereco");

                if (nome == null) nome = "";
                if (email == null) email = "";
                if (telefone == null) telefone = "";
                if (endereco == null) endereco = "";

                encontrado = true;
            }
        }
    } catch (Exception e) {
        out.println("Erro ao buscar usuário: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuário - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="container mt-4">

    <h2 class="text-center">Editar Usuário</h2>

    <% if (encontrado) { %>
    <form action="atualizarUsuario.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Nome completo</label>
            <input type="text" name="nome" class="form-control"
                   value="<%=nome%>" required>
        </div>

        <div class="form-group">
            <label>E-mail</label>
            <input type="email" name="email" class="form-control"
                   value="<%=email%>" required>
        </div>

        <div class="form-group">
            <label>Telefone</label>
            <input type="tel" name="telefone" class="form-control"
                   value="<%=telefone%>" required>
        </div>

        <div class="form-group">
            <label>Endereço</label>
            <textarea name="endereco" class="form-control"
                      required><%=endereco%></textarea>
        </div>

        <button type="submit" class="btn btn-danger">
            Atualizar
        </button>

        <a href="listarUsuarios.jsp" class="btn btn-secondary">
            Cancelar
        </a>
    </form>
    <% } else { %>
        <div class="alert alert-warning">
            Usuário não encontrado.
        </div>
        <a href="listarUsuarios.jsp" class="btn btn-secondary">
            Voltar
        </a>
    <% } %>

</div>
</body>
</html>
