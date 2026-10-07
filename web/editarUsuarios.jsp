<%-- Comentário JSP com informações sobre o arquivo. --%>
<%--
    Document   : editar
    Created on : 19 de jul. de 2026, 19:29:14
    Author     : Sr. Zenker
--%>
<%-- Define o tipo de conteúdo e a codificação da página. --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Importa todas as classes do pacote java.sql. --%>
<%@page import="java.sql.*"%>
<%-- Importa a classe responsável pela conexão com o banco. --%>
<%@page import="util.Conexao"%>
<%-- Inicia o bloco de código Java da JSP. --%>
<%
    // Recebe o id enviado pela URL e converte para inteiro.
    int id = Integer.parseInt(request.getParameter("id"));
    // Declara a variável da conexão com o banco.
    Connection con = null;
    // Declara a variável para executar comandos SQL.
    PreparedStatement ps = null;
    // Declara a variável para armazenar o resultado da consulta.
    ResultSet rs = null;
    // Declara a variável para armazenar o nome.
    String nome = "";
    // Declara a variável para armazenar o email.
    String email = "";
    // Declara a variável para armazenar a senha.
    String senha = "";
    // Declara a variável para armazenar o endereço.
    String endereco = "";
    // Declara a variável para armazenar o numero.
    String numero = "";
    // Declara a variável para armazenar o bairro.
    String bairro = "";
    // Declara a variável para armazenar a cidade.
    String cidade = "";
    // Declara a variável para armazenar o estado.
    String estado = "";
    // Declara a variável para armazenar o cep.
    String cep = "";
    // Inicia o tratamento de possíveis erros.
    try {
        // Abre a conexão com o banco de dados.
        con = Conexao.conectar();
        // Cria o comando SQL para buscar um usuario pelo id.
        String sql = "SELECT * FROM usuarios WHERE id=?";
        // Prepara o comando SQL para execução.
        ps = con.prepareStatement(sql);
        // Define o valor do parâmetro id na consulta.
        ps.setInt(1, id);
        // Executa a consulta e armazena o resultado.
        rs = ps.executeQuery();
        // Verifica se encontrou um registro.
        if (rs.next()) {
            // Obtém o valor do campo nome.
            nome = rs.getString("nome");
            // Obtém o valor do campo email.
            email = rs.getString("email");
            // Obtém o valor do campo senha.
            senha = rs.getString("senha");
            // Obtém o valor do campo endereço.
            endereco = rs.getString("endereco");
            // Obtém o valor do campo numero.
            numero = rs.getString("numero");
            // Obtém o valor do campo bairro.
            bairro = rs.getString("bairro");
            // Obtém o valor do campo cidade.
            cidade = rs.getString("cidade");
            // Obtém o valor do campo estado.
            estado = rs.getString("estado");
            // Obtém o valor do campo cep.
            cep = rs.getString("cep");
        }
        // Captura qualquer erro ocorrido.
    } catch (Exception e) {
        // Exibe a mensagem do erro na página.
        out.println(e.getMessage());
    }
%>
<%-- Informa que o documento utiliza HTML5. --%>
<!DOCTYPE html>
<%-- Início do documento HTML. --%>
<html>
    <%-- Início do cabeçalho da página. --%>
    <head>
        <%-- Define a codificação de caracteres da página. --%>
        <meta charset="UTF-8">
        <%-- Define o título exibido na aba do navegador. --%>
        <title>Editar Usuário</title>
        <%-- Importa a biblioteca Bootstrap para estilização. --%>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <%-- Fim do cabeçalho. --%>
    </head>
    <%-- Início do corpo da página. --%>
    <body>
        <%-- Cria um container Bootstrap. --%>
        <div class="container mt-4">
            <%-- Exibe o título da página. --%>
            <h2 class="text-center">Editar Usuário</h2>
            <%-- Inicia o formulário que enviará os dados para atualizar.jsp. --%>
            <form action="atualizarUsuarios.jsp" method="post">
                <%-- Campo oculto que envia o id do usuário. --%>
                <input type="hidden" name="id" value="<%=id%>">
                <%-- Cria um grupo para o campo nome. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo nome. --%>
                    <label>Nome</label>
                    <%-- Campo de texto para editar o nome. --%>
                    <input
                        type="text"
                        name="nome"
                        class="form-control"
                        value="<%=nome%>"
                        required>
                    <%-- Fecha o grupo do campo nome. --%>
                </div>
                <%-- Cria um grupo para o campo email. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo email. --%>
                    <label>Email</label>
                    <%-- Campo de texto para editar o email. --%>
                    <input
                        type="text"
                        name="email"
                        class="form-control"
                        value="<%=email%>"
                        required>
                    <%-- Fecha o grupo do campo email. --%>
                </div>
                <%-- Cria um grupo para o campo senha. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo senha. --%>
                    <label>Senha</label>
                    <%-- Campo de texto para editar a senha. --%>
                    <input
                        type="text"
                        name="senha"
                        class="form-control"
                        value="<%=senha%>"
                        required>
                    <%-- Fecha o grupo do campo senha. --%>
                </div>
                <%-- Cria um grupo para o campo endereço. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo endereço. --%>
                    <label>Endereço</label>
                    <%-- Campo de texto para editar o enedreço. --%>
                    <input
                        type="text"
                        name="endereco"
                        class="form-control"
                        value="<%=endereco%>"
                        required>
                    <%-- Fecha o grupo do campo endereço. --%>
                </div>
                <%-- Cria um grupo para o campo numero. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo numero. --%>
                    <label>Número</label>
                    <%-- Campo de texto para editar o número. --%>
                    <input
                        type="text"
                        name="numero"
                        class="form-control"
                        value="<%=numero%>"
                        required>
                    <%-- Fecha o grupo do campo numero. --%>
                </div>
                <%-- Cria um grupo para o campo bairro. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo bairro. --%>
                    <label>Bairro</label>
                    <%-- Campo de texto para editar o bairro. --%>
                    <input
                        type="text"
                        name="bairro"
                        class="form-control"
                        value="<%=bairro%>"
                        required>
                    <%-- Fecha o grupo do campo bairro. --%>
                </div>
                <%-- Cria um grupo para o campo cidade. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo cidade. --%>
                    <label>Cidade</label>
                    <%-- Campo de texto para editar a cidade. --%>
                    <input
                        type="text"
                        name="cidade"
                        class="form-control"
                        value="<%=cidade%>"
                        required>
                    <%-- Fecha o grupo do campo cidade. --%>
                </div>

                <%-- Cria um grupo para o campo estado. --%>
                <div class="form-group">

                    <%-- Exibe o texto do campo estado. --%>
                    <label>Estado</label>

                    <%-- Cria a lista de opções de estados. --%>
                    <select name="estado" class="form-control">

                        <%-- Opção RS. --%>
                        <option>RS</option>

                        <%-- Opção SC. --%>
                        <option>SC</option>

                        <%-- Opção PR. --%>
                        <option>PR</option>

                        <%-- Opção SP. --%>
                        <option>SP</option>

                        <%-- Fecha a lista de estados. --%>
                    </select>

                    <%-- Fecha o grupo do campo estado. --%>
                </div>
                <%-- Cria um grupo para o campo cep. --%>
                <div class="form-group">
                    <%-- Exibe o texto do campo cep. --%>
                    <label>CEP</label>
                    <%-- Campo de texto para editar o cep. --%>
                    <input
                        type="text"
                        name="cep"
                        class="form-control"
                        value="<%=cep%>"
                        required>
                    <%-- Fecha o grupo do campo cep. --%>
                </div>

                <%-- Cria o botão para atualizar os dados. --%>
                <button class="btn btn-primary">
                    Atualizar
                </button>

                <%-- Cria o botão para cancelar e voltar para a listagem. --%>
                <a href="listarUsuario.jsp" class="btn btn-secondary">
                    Cancelar
                </a>

                <%-- Fecha o formulário. --%>
            </form>

            <%-- Fecha o container. --%>
        </div>

        <%-- Fecha o corpo da página. --%>
    </body>

    <%-- Fecha o documento HTML. --%>
</html>

<%-- Retorna ao bloco de código Java da JSP. --%>
<%

    // Verifica se o ResultSet foi criado.
    if (rs != null) {

        // Fecha o ResultSet e libera memória.
        rs.close();

    }

    // Verifica se o PreparedStatement foi criado.
    if (ps != null) {

        // Fecha o PreparedStatement e libera recursos.
        ps.close();

    }

    // Verifica se a conexão foi aberta.
    if (con != null) {

        // Fecha a conexão com o banco de dados.
        con.close();

    }

%>