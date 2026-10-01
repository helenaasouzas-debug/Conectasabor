<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,
              initial-scale=1.0">
        <title>Cadastro de Funcionário</title>
        <link rel="icon" href="assets/img/logo.png">
        <link rel="stylesheet" href="assets/css/style.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.m
            in.css"
            rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstra
            p-icons.min.css"
            rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- SIDEBAR -->
            <aside class="sidebar-red d-flex flex-column text-white">
                <div class="sidebar-header p-3 text-center">
                    <img src="assets/img/logo.png"
                         alt="Logo"
                         class="img-fluid logo-img">
                </div>
                <ul class="nav nav-pills flex-column mb-auto mt-2">
                    <li>
                        <a href="#" class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-people nav-icon me-3"></i>
                            <span class="nav-text">Fornecedores</span>
                        </a>
                    </li>
                    <li>
                        <a href="cadastro-funcionario.html"
                           class="nav-link text-white d-flex
                           align-items-center active">
                            <i class="bi bi-people-fill nav-icon me-3"></i>
                            <span class="nav-text">Funcionários</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-scooter nav-icon me-3"></i>
                            <span class="nav-text">Entregadores</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-cup-hot nav-icon me-3"></i>
                            <span class="nav-text">Comidas</span>
                        </a>
                    </li>
                    <li>
                        <a href="editar-funcionario.html"
                           class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-pencil nav-icon me-3"></i>
                            <span class="nav-text">Editar</span>
                        </a>
                    </li>
                    <li>
                        <a href="exclusao-funcionario.html"
                           class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-x-lg nav-icon me-3"></i>
                            <span class="nav-text">Excluir</span>
                        </a>
                    </li>
                    <li>
                        <a href="consulta-funcionario.html"
                           class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-eye nav-icon me-3"></i>
                            <span class="nav-text">Visualizar</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-white d-flex
                           align-items-center">
                            <i class="bi bi-gear nav-icon me-3"></i>
                            <span class="nav-text">Configurações</span>
                        </a>
                    </li>
                </ul>
                <div class="p-3 border-top border-light border-opacity-25
                     mt-auto">
                    <a href="#" class="nav-link text-white d-flex
                       align-items-center">
                        <i class="bi bi-box-arrow-left nav-icon me-3"></i>
                        <span class="nav-text">Sair</span>
                    </a>
                </div>
            </aside>
            <!-- ÁREA PRINCIPAL -->
            <div class="main-content flex-grow-1 d-flex flex-column">
                <!-- NAVBAR -->
                <nav class="navbar text-white bg-red px-4 d-flex
                     justify-content-end align-items-center">
                    <div class="d-flex align-items-center gap-4">
                        <div class="dropdown">
                            <a href="#"
                               class="d-flex align-items-center
                               dropdown-toggle text-white text-decoration-none"
                               data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle fs-2
                                   me-2"></i>
                                <span class="fw-bold me-1 text-white fs-6">
                                    Usuário desconhecido
                                </span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end
                                shadow">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        Usuário
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li>
                                    <a class="dropdown-item text-danger"
                                       href="#">
                                        Sair do usuário
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- CONTEÚDO -->
                <main class="p-4 bg-white flex-grow-1 min-vh-100">
                    <div class="d-flex justify-content-between
                         align-items-center mb-4">
                        <div>
                            <h2 class="fw-bold mb-1 title-page">
                                Cadastro de funcionários
                            </h2>
                            <p class="text-muted mb-0 subtitle-page">
                                Preencha os dados abaixo para cadastrar um
                                novo funcionário.
                            </p>
                        </div>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 custom-breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="#">Início</a>
                                </li>
                                <li class="breadcrumb-item"
                                    aria-current="page">
                                    Funcionários
                                </li>
                                <li class="breadcrumb-item active">
                                    <a
                                        href="consulta-funcionario.html">Cadastrar</a>
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <!-- FORMULÁRIO -->
                    <form id="formCadastroFuncionario" action="#"
                          method="POST">
                        <!-- Dados pessoais -->
                        <div class="mb-4">
                            <h5 class="section-title fw-bold mb-3">
                                Dados pessoais
                            </h5>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label for="nome" class="form-label
                                           fw-semibold">
                                        Nome completo <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="nome"
                                           name="nome"
                                           placeholder="Digite o nome
                                           completo">
                                </div>
                                <div class="col-md-3">
                                    <label for="cpf" class="form-label
                                           fw-semibold">
                                        CPF <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="cpf"
                                           name="cpf"
                                           placeholder="000.000.000-00">
                                </div>
                                <div class="col-md-3">
                                    <label for="dataNascimento"
                                           class="form-label fw-semibold">
                                        Data de nascimento <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="dataNascimento"
                                           name="dataNascimento"
                                           placeholder="DD/MM/AAAA">
                                </div>
                                <div class="col-md-3">
                                    <label for="genero" class="form-label
                                           fw-semibold">
                                        Gênero
                                    </label>
                                    <select class="form-select"
                                            id="genero"
                                            name="genero">
                                        <option selected
                                                disabled>Selecione</option>
                                        <option
                                            value="M">Masculino</option>
                                        <option value="F">Feminino</option>
                                        <option value="O">Outro</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="rg" class="form-label
                                           fw-semibold">
                                        RG
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="rg"
                                           name="rg"
                                           placeholder="00.000.000-0">
                                </div>
                                <div class="col-md-3">
                                    <label for="orgaoEmissor"
                                           class="form-label fw-semibold">
                                        Órgão emissor
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="orgaoEmissor"
                                           name="orgaoEmissor"
                                           placeholder="Digite o órgão
                                           emissor">
                                </div>
                                <div class="col-md-3">
                                    <label for="dataEmissao"
                                           class="form-label fw-semibold">
                                        Data de emissão
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="dataEmissao"
                                           name="dataEmissao"
                                           placeholder="DD/MM/AAAA">
                                </div>
                                <div class="col-md-3">
                                    <label for="estadoCivil"
                                           class="form-label fw-semibold">
                                        Estado civil
                                    </label>
                                    <select class="form-select"
                                            id="estadoCivil"
                                            name="estadoCivil">
                                        <option selected
                                                disabled>Selecione</option>
                                        <option
                                            value="solteiro">Solteiro(a)</option>
                                        <option
                                            value="casado">Casado(a)</option>
                                        <option
                                            value="divorciado">Divorciado(a)</option>
                                        <option
                                            value="viuvo">Viúvo(a)</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- Dados de contato -->
                        <div class="mb-4">
                            <h5 class="section-title fw-bold mb-3">
                                Dados de contato
                            </h5>
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label for="telefone" class="form-label
                                           fw-semibold">
                                        Telefone <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="telefone"
                                           name="telefone"
                                           placeholder="(00) 00000-0000">
                                </div>
                                <div class="col-md-3">
                                    <label for="email" class="form-label
                                           fw-semibold">
                                        E-mail <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="email"
                                           class="form-control"
                                           id="email"
                                           name="email"
                                           placeholder="exemplo@exemplo.com">
                                </div>
                                <div class="col-md-3">
                                    <label for="endereco" class="form-label
                                           fw-semibold">
                                        Endereço <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="endereco"
                                           name="endereco"
                                           placeholder="Digite o endereço">
                                </div>
                                <div class="col-md-3">
                                    <label for="numero" class="form-label
                                           fw-semibold">
                                        Número <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="numero"
                                           name="numero"
                                           placeholder="Digite o número">
                                </div>
                                <div class="col-md-3">
                                    <label for="bairro" class="form-label
                                           fw-semibold">
                                        Bairro <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="bairro"
                                           name="bairro"
                                           placeholder="Digite o bairro">
                                </div>
                                <div class="col-md-3">
                                    <label for="cidade" class="form-label
                                           fw-semibold">
                                        Cidade <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="cidade"
                                           name="cidade"
                                           placeholder="Digite a cidade">
                                </div>
                                <div class="col-md-3">
                                    <label for="estado" class="form-label
                                           fw-semibold">
                                        Estado <span
                                            class="text-danger">*</span>
                                    </label>
                                    <select class="form-select"
                                            id="estado"
                                            name="estado">
                                        <option selected
                                                disabled>Selecione</option>
                                        <option value="SP">São
                                            Paulo</option>
                                        <option value="RJ">Rio de
                                            Janeiro</option>
                                        <option value="MG">Minas
                                            Gerais</option>
                                        <option value="RS">Rio Grande do
                                            Sul</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="cep" class="form-label
                                           fw-semibold">
                                        CEP <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text"
                                           class="form-control"
                                           id="cep"
                                           name="cep"
                                           placeholder="00000-000">
                                </div>
                            </div>
                        </div>
                        <!-- Botões -->
                        <div class="d-flex justify-content-end gap-3 mt-5">
                            <button type="button"
                                    class="btn btn-cancelar px-5 py-2">
                                Cancelar
                            </button>
                            <button type="submit"
                                    class="btn btn-salvar px-5 py-2">
                                Salvar
                            </button>
                        </div>
                    </form>
                </main>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bun
        dle.min.js"></script>
    </body>
</html>
