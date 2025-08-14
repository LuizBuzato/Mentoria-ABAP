@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true


define root view entity ZC_FE_TRAVEL_001158
  provider contract transactional_query
  as projection on ZI_FE_TRAVEL_001158 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90

      @EndUserText.label: 'Travel'
      @ObjectModel.text.element:  [ 'Description' ]
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName'] // muda o ID da agencia para o nome
      AgencyID,
      _Agency.Name       as AgencyName, // Auxilia a mudar para o nome da agencia

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }] // Insere tabela no campo de pesquisa
      CustomerID,
      _Customer.LastName as LastName,

      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['TravelStatusText']
      @UI.textArrangement: #TEXT_ONLY  //Configurou o formato do texto (só aparece o texto)
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_FE_STAT_001158', element: 'TravelStatusId'  } }]
      OverallStatus,
      _TravelStatus.TravelStatusText as TravelStatusText,
      
      OverallStatusCriticality,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_BOOKING_001158,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}
