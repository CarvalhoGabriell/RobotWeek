***Settings***
Documentation          Suite de Teste para enviar prato escolhido

Resource                ../resources/base.robot
Test Setup              base.Login Session      gabiru@qa.com       Churrasco
Test Teardown           Close Session


***Test Cases***
Efetuando Pedido
    Dado que escolho meu prato "Churrasco"
    Quando eu seleciono a opção de pagamento em "dinheiro"
    Então devo vizualizar a mensagem "Pedido enviado para o Ninja Chef!"


***Keywords***

Dado que escolho meu prato "${prato}"
    Set Test Variable                   ${prato}
    Wait Until Page Contains            Fome de ${prato}      5 
    Click Text                          Quero

Quando eu seleciono a opção de pagamento em "${payments}"

    Wait Until Element Is Visible           accessibility_id=paymentInput       5
    Input Text                              accessibility_id=paymentInput       ${payments}
    Click Text                              Confirmar pedido
    
Então devo vizualizar a mensagem "${mensage_expect}"
    Wait Until Page Contains            ${mensage_expect}