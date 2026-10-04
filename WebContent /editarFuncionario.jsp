<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nome = "";
    String telefone = "";
    String cargo = "";
    String turno = "";
    boolean encontrado = false;

    String sql = "SELECT * FROM funcionarios WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                nome = rs.getString("nome");
                telefone = rs.getString("telefone");
                cargo = rs.getString("cargo");
                turno = rs.getString("turno");
                encontrado = true;
            }
        }
    } catch (Exception e) {
        out.println("Erro ao buscar funcionário: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Funcionário - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">

    <h2 class="text-center">Editar Funcionário</h2>

    <% if (encontrado) { %>
    <form action="atualizarFuncionario.jsp" method="post">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="form-group">
            <label>Nome completo</label>
            <input type="text" name="nome" class="form-control"
                   value="<%=nome%>" required>
        </div>

        <div class="form-group">
            <label>Telefone</label>
            <input type="tel" name="telefone" class="form-control"
                   value="<%=telefone%>" required>
        </div>

        <div class="form-group">
            <label>Cargo</label>
            <input type="text" name="cargo" class="form-control"
                   value="<%=cargo%>" required>
        </div>

        <div class="form-group">
            <label>Turno de trabalho</label>
            <select name="turno" class="form-control" required>
                <option value="Manhã"
                    <%= "Manhã".equals(turno) ? "selected" : "" %>>
                    Manhã
                </option>
                <option value="Tarde"
                    <%= "Tarde".equals(turno) ? "selected" : "" %>>
                    Tarde
                </option>
                <option value="Noite"
                    <%= "Noite".equals(turno) ? "selected" : "" %>>
                    Noite
                </option>
                <option value="Integral"
                    <%= "Integral".equals(turno) ? "selected" : "" %>>
                    Integral
                </option>
            </select>
        </div>

        <button type="submit" class="btn btn-danger">
            Atualizar
        </button>

        <a href="listarFuncionarios.jsp" class="btn btn-secondary">
            Cancelar
        </a>
    </form>
    <% } else { %>
        <div class="alert alert-warning">
            Funcionário não encontrado.
        </div>
        <a href="listarFuncionarios.jsp" class="btn btn-secondary">
            Voltar
        </a>
    <% } %>

</div>
</body>
</html>
