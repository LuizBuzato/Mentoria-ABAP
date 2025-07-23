# ZFLIGHT_BOOKING – Projeto ABAP RAP

Este projeto demonstra a construção de uma aplicação SAP utilizando o **ABAP RESTful Application Programming Model (RAP)**, tendo como entidade principal a **ZFLIGHT_BOOKING**, que representa reservas de voos.

Foi desenvolvido para ambientes **SAP S/4HANA (≥ 2020)** ou **SAP BTP ABAP Environment**, com exposição de dados via **CDS Views** e consumo por **Fiori Elements**.

---

## 🗂 Estrutura do Projeto

Todos os artefatos estão na pasta:

```plaintext
ZFLIGHT_BOOKING/
├── Core Data Services
│   ├── Data Definitions
│   │   ├── ZAIRPORT
│   │   ├── ZC_FLIGHT_BOOKING
│   │   └── ZR_FLIGHT_BOOKING
│   ├── Behavior Definitions
│   │   ├── ZC_FLIGHT_BOOKING (Projection)
│   │   └── ZR_FLIGHT_BOOKING (Root)
│   └── Metadata Extensions
│       └── ZC_FLIGHT_BOOKING
├── Dictionary
│   ├── Database Tables
│   │   ├── ZFLIGHT_BOOKING
│   │   └── ZFLIGHT_BOOKING_D
│   └── Views
│       └── Z_AIRPORT
├── Classes
│   ├── ZBOOKING
│   ├── ZBP_C_FLIGHT_BOOKING
│   └── ZBP_R_FLIGHT_BOOKING
└── Texts
    └── Message Classes
        └── ZFLIGHT_MSG
```

## 🔧 Funcionalidades

- Consulta de reservas com filtros:
  - Companhia aérea (carrier_id)
  - Conexão (connection_id)
  - Data do voo (flight_date)
- Exibição com ajuda de pesquisa (Value Help)
- Mensagens customizadas de erro usando REPORTED
- Preparado para futuras ações (actions) e validações de dados

---

## 🧰 Tecnologias Utilizadas

- ABAP RAP (Restful Application Programming Model)
- CDS Views com anotações Fiori
- OData V2 + Fiori Elements
- Eclipse com ABAP Development Tools (ADT)
- SAP Gateway / SAP BTP ABAP Environment

---

## 📋 Pré-requisitos

- Sistema SAP S/4HANA (versão ≥ 2020) ou SAP BTP ABAP Environment
- Permissão para criação de objetos Z
- Tabelas de voo disponíveis (ex: /DMO/FLIGHT, SCARR)
- Eclipse com ADT configurado

---

## ▶️ Passos para Teste

1. Importe os artefatos no Eclipse (ADT).
2. Verifique se as tabelas de voo existem no sistema.
3. Ative todas as entidades CDS, behaviors e views.
4. Publique o serviço OData associado à Z_C_FLIGHT_BOOKING.
5. Execute o preview Fiori Elements (botão direito no serviço no ADT).
6. (Opcional) Adicione ao Fiori Launchpad para uso por usuários finais.

---

## 📌 Observações

- Projeto com fins educacionais, podendo ser expandido com lógicas de negócio e integrações.
- Mensagens de erro seguem boas práticas RAP com uso de REPORTED.
- Desenvolvido durante a Mentoria ABAP.

---

## 🚀 Possíveis Extensões Futuras

- Ações customizadas: confirmar, cancelar, remarcar
- Integração com entidades como passageiros e companhias
- Implementação de autorização por papel
- Testes automatizados com ABAP Unit
 
