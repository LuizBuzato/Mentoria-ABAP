# SAP Build Apps - Consulta de Endereço via CEP

Este projeto é uma aplicação simples desenvolvida na plataforma SAP Build Apps que demonstra como consumir a API pública [ViaCEP](https://viacep.com.br/) para buscar um endereço completo a partir de um Código de Endereçamento Postal (CEP).

## Visão Geral

A interface do usuário é composta por:
- Um campo de entrada para o usuário digitar o CEP.
- Um botão para iniciar a busca.
- Campos de texto para exibir os resultados da busca (Logradouro, Bairro, Cidade e UF).


---

## Pré-requisitos

- Acesso a um ambiente SAP BTP (Business Technology Platform).
- Subscrição para o serviço SAP Build Apps.
- Conhecimento básico de como navegar e criar projetos no SAP Build Apps.

---

## Configuração

A configuração principal envolve a criação de uma fonte de dados (Data Source) que se conecta à API do ViaCEP e a configuração da lógica para chamar essa fonte de dados.

### 1. Configurar a Fonte de Dados (Data Entity)

Primeiro, é necessário adicionar a API do ViaCEP como uma fonte de dados REST.

1.  No seu projeto do SAP Build Apps, vá para a aba **Data**.
2.  Clique em **Add Integration** e selecione **REST API direct integration**.
3.  Preencha as informações da seguinte forma:
    -   **Resource URL**: `https://viacep.com.br/ws`
    -   Deixe as demais configurações, como cabeçalhos HTTP, como padrão.


### 2. Definir o Método GET

Após criar a fonte de dados, configure o método para a busca do CEP.

1.  Na fonte de dados recém-criada, adicione um novo método (`get record`).
2.  Configure o caminho relativo. O ViaCEP espera o CEP no formato `ws/{cep}/json`. Usaremos um parâmetro de URL para o CEP.
    -   **Relative path**: `"/" + query.additionalInputs.cep + "/json/"`
    -   Defina `cep` como um parâmetro de URL do tipo `text`.



3.  Execute um teste para garantir que a API está respondendo corretamente. Use um CEP válido (ex: 80010-010) e clique em **Run Test**. Se o teste for bem-sucedido, o schema da resposta (logradouro, bairro, etc.) será detectado automaticamente.



### 3. Lógica do Botão "Buscar"

A lógica para chamar a API é adicionada ao evento de clique (tap) do botão "Buscar".

1.  Selecione o botão na tela e abra o editor de lógica.
2.  Arraste o nó **Get record** para a tela de lógica.
3.  Vincule o parâmetro `cep` da fonte de dados a uma variável de página (`pageVars.cepInput`) que está ligada ao campo de entrada na tela.
4.  O resultado da chamada (saída do nó **Get record**) deve ser mapeado para outra variável de página (ex: `pageVars.addressResult`) que será usada para preencher os campos de resultado.

---

## Uso

1.  Abra a aplicação no modo de visualização (preview).
2.  Digite um CEP válido (apenas números) no campo de entrada.
3.  Clique no botão **"Buscar CEP"**.
4.  Aguarde a resposta. Os campos de Logradouro, Bairro, Localidade (Cidade) e UF serão preenchidos automaticamente com os dados retornados pela API.
