# Teste API ROBOT
![View](image/Robot.png)
## The Originals  - API :rocket:

Projeto de automação de API com o ```Robot Framework```.

Projeto voluntário supervisionado pela Qa.Coders para Testes de API executado pela equipe The Originals

## Instalação

*Instalando o Python*

[Python](https://python.org.br/instalacao-windows/)

*Instalando o Pip*

```bash
  pip -m pip install --upgrade pip
  pip -m pip --version
```

*Instalando as tecnologias e libs necessárias do projeto*

[Instalação do Robot](https://robotframework.org/?tab=1#getting-started)

```bash
  pip install robotframework
```

*Demais Libraries para os testes de API*

```bash
  pip install robotframework-requests
```

Para validar todas as instalações

```bash
  pip list
  pip freeze
```

## Stacks utilizada

**Libraries**: Collections, String, RequestsLibrary

**Automação:** Robot Framework

## Rodando localmente

Clone o projeto:

```bash
  git clone  https://github.com/rpatricia/theoriginals-academy-api-robot.git
```

Entre no diretório do projeto

```bash
  cd theoriginals-academy-api-robot
```
Para rodar os testes, rode o seguinte comando

```bash
  robot -d ./logs ./test
```

## Equipe

- [Bruna Brito]()
- [Luciano Sírio]()
- [Renata Patrícia](https://github.com/rpatricia)