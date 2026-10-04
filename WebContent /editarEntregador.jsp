<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    String nome = "";
    String telefone = "";
    String veiculo = "";
    String disponibilidade = "Disponível";
    boolean encontrado = false;

    String sql = "SELECT * FROM entregadores WHERE id = ?";

    try (Connection con = Conexao.conectar();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                nome = rs.getString("nome");
                telefone = rs.getString("telefone");
                veiculo = rs.getString("veiculo");
                disponibilidade = rs.getString("disponibilidade");
                encontrado = true;
            }
        }
    } catch (Exception e) {
        out.println("Erro ao buscar entregador: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Entregador - FlashBite</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">

    <h2 class="text-center">Editar Entregador</h2>

    <% if (encontrado) { %>
    <form action="atualizarEntregador.jsp" method="post">

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
            <label>Veículo</label>
            <select name="veiculo" class="form-control" required>
                <option value="Bicicleta"
                    <%= "Bicicleta".equals(veiculo) ? "selected" : "" %>>
                    Bicicleta
                </option>
                <option value="Moto"
                    <%= "Moto".equals(veiculo) ? "selected" : "" %>>
                    Moto
                </option>
                <option value="Carro"
                    <%= "Carro".equals(veiculo) ? "selected" : "" %>>
                    Carro
                </option>
            </select>
        </div>

        <div class="form-group">
            <label>Disponibilidade</label>
            <select name="disponibilidade" class="form-control">
                <option value="Disponível"
                    <%= "Disponível".equals(disponibilidade) ? "selected" : "" %>>
                    Disponível
                </option>
                <option value="Indisponível"
                    <%= "Indisponível".equals(disponibilidade) ? "selected" : "" %>>
                    Indisponível
                </option>
            </select>
        </div>

        <button type="submit" class="btn btn-danger">
            Atualizar
        </button>

        <a href="listarEntregadores.jsp" class="btn btn-secondary">
            Cancelar
        </a>
    </form>
    <% } else { %>
        <div class="alert alert-warning">
            Entregador não encontrado.
        </div>
        <a href="listarEntregadores.jsp" class="btn btn-secondary">
            Voltar
        </a>
    <% } %>

</div>
</body>
</html>
