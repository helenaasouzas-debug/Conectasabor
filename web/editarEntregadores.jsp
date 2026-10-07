<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="util.Conexao"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String nome = "";
    String cpf = "";
    String dataNascimento = "";
    String veiculo = "";
    String cnh = "";
    String orgaoEmissor = "";
    String dataEmissao = "";
    String telefone = "";
    String email = "";

    try {
        con = Conexao.conectar();

        String sql = "SELECT * FROM entregadores WHERE id=?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        rs = ps.executeQuery();

        if (rs.next()) {
            nome = rs.getString("nome");
            cpf = rs.getString("cpf");
            dataNascimento = rs.getString("data_nascimento");
            veiculo = rs.getString("veiculo");
            cnh = rs.getString("cnh");
            orgaoEmissor = rs.getString("orgao_emissor");
            dataEmissao = rs.getString("data_emissao");
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
    <title>Editar Entregador</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center">Editar Entregador</h2>

    <form action="atualizarEntregadores.jsp" method="post">

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
            <label>CPF</label>
            <input type="text"
                   name="cpf"
                   maxlength="11"
                   class="form-control"
                   value="<%=cpf%>"
                   required>
        </div>

        <div class="form-group">
            <label>Data de Nascimento</label>
            <input type="date"
                   name="data_nascimento"
                   class="form-control"
                   value="<%=dataNascimento%>"
                   required>
        </div>

        <div class="form-group">
            <label>Veículo</label>
            <input type="text"
                   name="veiculo"
                   class="form-control"
                   value="<%=veiculo%>"
                   required>
        </div>

        <div class="form-group">
            <label>CNH</label>
            <input type="text"
                   name="cnh"
                   maxlength="11"
                   class="form-control"
                   value="<%=cnh%>"
                   required>
        </div>

        <div class="form-group">
            <label>Órgão Emissor</label>
            <input type="text"
                   name="orgao_emissor"
                   class="form-control"
                   value="<%=orgaoEmissor%>">
        </div>

        <div class="form-group">
            <label>Data de Emissão</label>
            <input type="date"
                   name="data_emissao"
                   class="form-control"
                   value="<%=dataEmissao%>">
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
                   value="<%=email%>"
                   required>
        </div>

        <button class="btn btn-primary">
            Atualizar
        </button>

        <a href="listarEntregador.jsp" class="btn btn-secondary">
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