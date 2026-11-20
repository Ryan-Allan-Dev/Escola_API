# API Escola

API ASP.NET Core para gerenciamento de cursos (Curso, Aluno, Professor, Matrícula), usando SQL Server LocalDB.

## Criando o banco de dados

O script do banco fica em [`sql/script_ESCOLA.sql`](sql/script_ESCOLA.sql). Ele cria as tabelas
**ALUNO**, **CURSO**, **PROFESSOR**, **ESPECIALIDADE_PROFESSOR** e **MATRICULA**, com chaves, constraints
e dados de exemplo.

### Passo a passo (SQL Server Management Studio)

1. Abra o **SSMS** e conecte no servidor `(localdb)\MSSQLLocalDB`
   (é o mesmo servidor da connection string em `appsettings.json`).
2. Crie o banco, já que o script começa com `USE [Escola]` e não cria o banco sozinho:
   ```sql
   CREATE DATABASE Escola;
   ```
3. Abra o arquivo `sql/script_ESCOLA.sql` (**File → Open → File...**, ou `Ctrl + O`).
4. Clique em **Execute** (ou aperte `F5`).
5. Confira se as tabelas aparecem em **Databases → Escola → Tables** (talvez precise dar **Refresh**).

> Também dá para fazer isso pelo Visual Studio: **View → SQL Server Object Explorer**, conecte no
> `(localdb)\MSSQLLocalDB`, crie o banco `Escola`, clique com o botão direito nele → **New Query**, cole o script e execute.

## Como rodar a API

1. Crie o banco de dados (veja a seção acima).
2. Abra a solução `API_ESCOLA_NOVO.slnx` no Visual Studio (ou use o terminal).
3. Rode com o perfil **https**:
   ```bash
   dotnet run --launch-profile https
   ```
4. A API vai responder em `https://localhost:7019` (e `http://localhost:5046`).

## Testando com o Postman

A collection do Postman fica em [`postman/Escola.postman_collection.json`](postman/Escola.postman_collection.json).

### Passo a passo para importar

1. Baixe o arquivo `postman/Escola.postman_collection.json` deste repositório
   (ou clone o repositório: `git clone https://github.com/LUCASDESENVOLVEDOR/api_pizza.git`).
2. Abra o **Postman**.
3. Clique no botão **Import**, no canto superior esquerdo (ou use `Ctrl + O`).
4. Arraste o arquivo `Escola.postman_collection.json` para a janela, ou clique em **files** e selecione o arquivo.
5. Confirme clicando em **Import**.
6. A collection **Escola** vai aparecer na aba **Collections**, na barra lateral esquerda.
7. Com a API rodando (veja acima), abra uma das requisições e clique em **Send**.

> **Erro de certificado SSL?** Se o Postman reclamar do certificado de `https://localhost:7019`, desative a verificação em
> **Settings → General → SSL certificate verification → OFF**, ou confie no certificado de desenvolvimento com
> `dotnet dev-certs https --trust`.

### Requisições disponíveis

| Nome         | Método | URL                                  | Body (JSON)                                  |
|--------------|--------|--------------------------------------|----------------------------------------------|
| Buscar Todos | GET    | `https://localhost:7019/api/curso`   | —                                            |
| ATUALIZAR    | PUT    | `https://localhost:7019/api/curso/1` | `{ "Nome": "C# 2", "CargaHoraria": 200 }`    |
