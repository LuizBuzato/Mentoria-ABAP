Integração de Consulta de CEP com SAP Integration Suite (CPI)
Visão Geral
Este projeto descreve uma iFlow (Integration Flow) desenvolvida no SAP Integration Suite (Cloud Platform Integration) que atua como um serviço intermediário para consulta de endereços a partir de um Código de Endereçamento Postal (CEP) brasileiro.

A integração é projetada para receber uma requisição HTTP contendo um CEP, validá-lo e, em seguida, consultar a API pública ViaCEP para obter os detalhes do endereço correspondente, retornando a informação ao solicitante.

Arquitetura da Solução
A solução utiliza uma arquitetura desacoplada, onde o sistema de origem (neste caso, uma aplicação Node-RED) consome um endpoint exposto pela iFlow no CPI. O CPI orquestra a chamada para o serviço externo (ViaCEP), agregando uma camada de validação e transformação de dados.

Sistema de Origem: Node-RED (ou qualquer outro cliente HTTP capaz de enviar JSON).

Middleware: SAP Integration Suite - Cloud Platform Integration (CPI).

Serviço Externo: API ViaCEP (https://viacep.com.br).

(Sugestão: substitua este link pela imagem image_4dfc99.png que você forneceu, após subi-la para o repositório)

Fluxo do Processo (iFlow)
A iFlow é modelada com os seguintes passos:

Entrada (Start):

Sender: A iFlow é iniciada por uma chamada HTTP POST.

Adapter: HTTPS.

Payload Esperado (JSON):

JSON

{
  "cep": "01001000"
}
Conversão de Formato:

Ação: O payload JSON de entrada é convertido para o formato XML para facilitar a manipulação e leitura dos dados dentro do CPI.

Componente: JSON to XML Converter.

Validação do CEP:

Ação: Uma validação é executada para garantir que o CEP fornecido contém exatamente 8 dígitos.

Componente: Router.

Lógica da Rota:

Condição (XPath): string-length(//cep) = 8

Caminho 1 (CEP Válido): Segue o fluxo principal.

Caminho 2 (Default - CEP Inválido): O fluxo é direcionado para uma etapa de tratamento de erro, que retorna uma mensagem padrão.

Payload de Erro (XML):
xml <root> <error>CEP inválido. O CEP deve conter 8 dígitos.</error> </root> 

Armazenamento do CEP:

Ação: O número do CEP é extraído do payload e armazenado em uma propriedade (property._cep) para ser usado dinamicamente na URL da API externa.

Componente: Content Modifier.

Propriedade (XPath):

Nome: _cep

Tipo: XPath

Valor: //cep

Chamada à API ViaCEP:

Ação: Uma requisição HTTP GET é enviada para a API ViaCEP. O endpoint é construído dinamicamente usando a propriedade _cep.

Componente: Request Reply.

Adapter: HTTP.

Endereço: https://viacep.com.br/ws/${property._cep}/json/

Processamento da Resposta:

Ação: A resposta JSON da API ViaCEP é convertida para XML.

Componente: JSON to XML Converter.

Ação: O conteúdo da resposta é armazenado em uma nova propriedade (property.msg) para verificação.

Componente: Content Modifier.

Validação da Resposta da API:

Ação: Uma verificação é feita para identificar se a API retornou um erro (o ViaCEP retorna {"erro": true} para CEPs inexistentes).

Componente: Router.

Lógica da Rota:

Condição (XPath): //erro = 'true'

Caminho 1 (Com Erro): Direciona para uma etapa que formata uma mensagem de CEP não encontrado.

Caminho 2 (Default - Sucesso): Segue o fluxo para retornar os dados do endereço.

Saída (End):

A iFlow finaliza, retornando o payload XML resultante (seja de sucesso ou de erro) para o cliente que iniciou a requisição.

Pré-requisitos para Execução
Uma subscrição ativa do SAP Integration Suite.

Um cliente HTTP (como Postman, cURL ou Node-RED) para realizar as chamadas ao endpoint da iFlow.

Como Utilizar
Faça o deploy da iFlow no seu tenant do SAP Integration Suite.

Obtenha o endpoint HTTPS gerado para a iFlow.

Envie uma requisição POST para o endpoint com o seguinte formato no corpo da mensagem:

JSON

{
  "cep": "SEU_CEP_AQUI"
}
A resposta será um XML contendo os dados do endereço ou uma mensagem de erro.