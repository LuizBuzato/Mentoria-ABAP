# ZFLIGHT_BOOKING

**Projeto ABAP RAP – Mentoria ABAP**  
**Autor:** Luiz Henrique Buzato da Silva  
**GitHub:** [LuizBuzato](https://github.com/LuizBuzato)  
**Repositório:** [Mentoria-ABAP](https://github.com/LuizBuzato/Mentoria-ABAP)

---

## 1. Objetivo

Este projeto tem como objetivo implementar, utilizando o modelo **RAP** (Restful ABAP Programming Model), uma aplicação baseada em **reservas de voos**, representada pela entidade `ZFLIGHT_BOOKING`.  
A implementação é voltada para ambientes **SAP S/4HANA** (On-Premise ou BTP), com exposição de dados via **CDS Views** e consumo por **Fiori Elements**.

---

## 2. Estrutura do Projeto

O projeto está localizado na seguinte estrutura do repositório:

📁 `/Desafio CDS/ZFLIGHT_BOOKING`

**Componentes principais:**

- `ZFLIGHT_BOOKING`: Entidade raiz  
- `Z_I_FLIGHT_BOOKING`: Interface CDS com elementos de negócio  
- `Z_C_FLIGHT_BOOKING`: Consumption View para exposição OData/Fiori  
- **Behavior Definition**: Declaração de comportamentos da entidade  
- **Behavior Implementation**: Lógica de manipulação (create, update, validations, etc.)  
- **Metadata Extension**: Labels, pesquisas e visibilidade para Fiori  

---

## 3. Funcionalidades

Consulta de reservas com filtros por:

- Companhia aérea (`carrier_id`)
- Conexão (`connection_id`)
- Data do voo (`flight_date`)

Outros recursos:

- Exibição de campos com ajuda de pesquisa (Value Help)
- Mensagens customizadas de erro (via `REPORTED`)
- Preparado para futuras **ações** (`action`) e **validações de dados**

---

## 4. Tecnologias Utilizadas

- ABAP RESTful Application Programming Model (**RAP**)
- **CDS Views** com anotações Fiori
- **OData V4** + **Fiori Elements**
- **Eclipse** com ABAP Development Tools (**ADT**)
- **SAP Gateway** / **SAP BTP ABAP Environment**

---

## 5. Pré-requisitos

- Sistema SAP com suporte ao modelo RAP (**S/4HANA ≥ 2020** ou **SAP BTP ABAP**)
- Autorização para criação de objetos Z
- Conjunto de tabelas de voo da SAP (ex: `/DMO/FLIGHT`, `SCARR`)
- Eclipse com ADT configurado e conexão ativa ao sistema SAP

---

## 6. Passos para Teste

1. Importar os artefatos via ADT no Eclipse  
2. Verificar a existência das tabelas de voo no sistema  
3. Ativar todas as entidades CDS, behaviors e views  
4. Publicar o serviço OData associado à consumption view `Z_C_FLIGHT_BOOKING`  
5. Executar o preview Fiori Elements via botão direito no serviço no ADT  
6. _(Opcional)_ Adicionar no Fiori Launchpad para uso final por usuários

---

## 7. Observações

- Este projeto tem **fins educacionais** e pode ser estendido com lógicas de negócio, autorizações e integrações.  
- As mensagens de erro seguem boas práticas RAP, utilizando `REPORTED`.  
- O código foi desenvolvido durante a **Mentoria ABAP**.

---

## 8. Possíveis Extensões Futuras

- Ações customizadas: confirmar, cancelar ou remarcar reservas  
- Integração com outras entidades, como passageiros ou companhias  
- Implementação de lógica de autorização  
- Inclusão de testes automatizados com **ABAP Unit**

---

## 9. Licença

Este projeto está licenciado sob a **Licença MIT**.  
Consulte o arquivo [`LICENSE`](./LICENSE) no repositório para mais informações.
