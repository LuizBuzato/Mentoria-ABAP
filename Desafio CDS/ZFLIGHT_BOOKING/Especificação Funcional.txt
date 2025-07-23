Consulta Consolidada de Reservas de Voos

ID da Funcionalidade: FIORI-FLT-001

Data: 19/07/2025

Versão: 1.0

1. Objetivo

Desenvolver uma aplicação Fiori Elements com base em um CDS View, que consolide dados de reservas de voo, voos, companhias aéreas, clientes e aeroportos, permitindo que o usuário visualize as reservas realizadas, com informações detalhadas do voo e dos passageiros.

A aplicação também deve possuir:

`	`• Um hiperlink no campo de cliente que redireciona para uma aplicação externa ou outra tela de cliente.

`	`• Um botão de ação que exibe uma mensagem de confirmação da reserva.

`	`• O campo Reserva data deve ser preenchido com a data atual

`	`• Se já contar data no campo não pode ser atualizado, deve emitir uma mensagem de erro.


1. Escopo

A aplicação será baseada em dados contidos nas seguintes tabelas:

Tabela	Descrição

ZFLIGHT\_BOOKING	Reservas de voo (custom)

/DMO/FLIGHT	Informações do voo

/DMO/AIRLINE	Companhia aérea

/DMO/AIRPORT	Aeroportos (origem/destino)

/DMO/CUSTOMER	Cliente da reserva


1. Regras de Negócio

`	`• A reserva deve conter obrigatoriamente um voo válido.

`	`• O cliente deve estar registrado na base /DMO/CUSTOMER.

`	`• A companhia aérea, origem e destino do voo devem ser extraídos a partir dos campos da tabela /DMO/FLIGHT.

1. Requisitos Funcionais

RF001 – Visualização da Reserva

O sistema deve exibir os seguintes campos:

Campo	Fonte



key travel\_id              /dmo/travel\_id not null;

key booking\_id          /dmo/booking\_id not null;

customer\_id               /dmo/customer\_id;

connection\_id            /dmo/connection\_id;

airport\_from\_id         /dmo/airport\_from\_id;

airport\_to\_id              /dmo/airport\_to\_id;

reserva\_date              /abap.dats;


RF002 – Ação de Hiperlink

`	`• O nome do cliente deve ser apresentado como hiperlink.

`	`• Ao clicar, o usuário será redirecionado para um link genérico como:

bash

CopiarEditar

/sap/bc/ui5\_ui5/sap/ZCUSTOMER\_APP/index.html?cust\_id=<customer\_id>

RF003 – Ação com Mensagem

`	`• Um botão "Confirmar Reserva" estará disponível na linha da tabela.

`	`• Ao ser clicado, deverá exibir a seguinte mensagem:

Reserva para o voo <flight\_id> confirmada para <booking\_date>.

1. Requisitos Técnicos

RT001 – CDS View com JOIN

A CDS View consolidará os dados via INNER JOIN, conforme estrutura abaixo:

`	`• ZFLIGHT\_BOOKING LEFT JOIN /DMO/BOOKING ON  /DMO/CONNECTION

RT002 – Anotações Fiori

Usar anotações:

`	`• @UI.lineItem para montar a lista de colunas.

`	`• @UI.identification para o hiperlink no cliente.

`	`• @UI.action para o botão de ação.

RT003 – Behavior Definition

Criar Behavior Definition e Behavior Implementation para tratar a ação "Confirmar Reserva".


1. Observações

`	`• O projeto deve seguir a arquitetura RESTful ABAP (RAP).

`	`• Todas as entidades devem ser ativadas para consumo via serviço OData V4.

`	`• A implementação será read-only, sem persistência de alterações via UI.
