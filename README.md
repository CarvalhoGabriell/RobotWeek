# RobotWeek
   Testes automatizados utilizando e desenvolvendo com o RobotFramework, os testes vão de aplicações Web, passam por Aplicações mobile até testes em APIs. Curso ministrado pelo QAninja!!!.
  
  # Um pouco sobre o projeto...

- Na Web utilizando a LIBRARY do Selenium para automatizar os tests da aplicação NinhaChef.
  A aplicação Web por sua vez é a interface que utiliza pelo usuário que quer cozinhar e anunciar seus pratos para o cliente.
  Dessa forma ele consegue cadastrar seus melhores pratos e produtos , para poder vender.
  
- Na parte de Mobile, a LIBRARY do Appium foi consumida para realizar a automação.
  Esse app simula um cliente que deseja comer algum prato, dessa forma ele informa o prato desejado, assim como seu emial, faz a escolha do melhor prato
  e então realiza o pedido.
- Além disso foi criado um aparelho virtual a partir do Android Studio para simular um Celular Físico. Nele foi instalado um apk do aplicativo NinjaChef

- Depois que o cliente solicita o prepara do prato escolhido, o cozinheiro que possui esse prato cadastrado em sua conta pode aceitar ou rejeitar o preparo desse prato.
E então envia-lo ao destinatário.

- Para automatizar e validar essas consultas, requisições, é foi feito testes consumindo a API da aplicação. E com isso foi utilizada A LIBRARY Requests e Collections.
