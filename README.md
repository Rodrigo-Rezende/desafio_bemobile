# Desafio BeMobile

Este projeto foi criado como parte do teste prático Mobile BeTalent. Ele tem como objetivo desenvolver um aplicativo móvel utilizando Flutter, que apresenta uma tabela com dados obtidos de uma API simulada, incluindo a funcionalidade de pesquisa através de um campo de entrada.

## Sobre

A aplicação consiste em uma tabela que exibe imagens e nomes de funcionários. Ao clicar em uma linha da tabela, mais informações sobre o funcionário são expandidas, mostrando o cargo, data de admissão e telefone, formatados de acordo com as especificações fornecidas no Figma do projeto.

A pesquisa permite o usuário buscar por nome, função e telefone dos funcionários listados, assim atualizando a tabela de funcionários em tempo real.

## Como rodar o app

1. Clone este repositório para sua máquina.

```
git clone https://github.com/Rodrigo-Rezende/desafio_bemobile
```

2. Clone o repositório da database

```
https://github.com/BeMobile/desafio-mobile
```

3. Para simular a API é necessário ter o pacote
   [json_rest_server](https://pub.dev/packages/json_rest_server)

4. Com o json server rodando, execute o aplicativo

```
flutter pub get
```

```
flutter run
```
