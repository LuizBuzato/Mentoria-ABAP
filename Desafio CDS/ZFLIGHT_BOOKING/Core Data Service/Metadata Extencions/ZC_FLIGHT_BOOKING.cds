@Metadata.layer: #CORE
@UI: {
    headerInfo: {
    typeName: 'Lista de Reserva',
    typeNamePlural: 'Lista de Reservas'
  }
}
annotate view ZC_FLIGHT_BOOKING with
{
  @UI.facet: [ {
    id: 'idIdentification',
    type: #IDENTIFICATION_REFERENCE,
    label: 'Lista de Reserva',
    position: 10
  } ]
      @UI.lineItem: [
  { position: 10 },
  { type: #FOR_ACTION, dataAction: 'DataReserva', label: 'Confirmação Reserva' }
]
  
//  @UI: { lineItem: [ { exclude: true } ,
//  { type: #FOR_ACTION,
//    dataAction: 'DataReserva' ,
//    label: 'Confirmação Reserva' } ] ,
//identification: [ { position: 1, label: 'ID' } ,
//  { type: #FOR_ACTION,
//    dataAction: 'DataReserva',
//    label: 'Confirmação Reserva' } ] }

    @UI.hidden: true 
    TravelId;
  
  @UI.identification: [ {
    position: 30 
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 30 
  } ]
//  @UI.selectionField: [ {
//    position: 30 
//  } ]
  BookingId;
  
  @UI.identification: [ {
    position: 45 
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 45 
  } ]
  @UI.selectionField: [ {
    position: 45 
  } ]
  CustomerId;
  
  @UI.identification: [ {
    position: 60 
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 60 
  } ]
  @UI.selectionField: [ {
    position: 60 
  } ]
  ConnectionId;
  
  @UI.identification: [ {
    position: 75 
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 75 
  } ]
  @UI.selectionField: [ {
    position: 75 
  } ]
  @Consumption.valueHelpDefinition: [{
  entity: { name: 'ZAIRPORT', element: 'airport_id' }
}]
  AirportFromId;
  
  @UI.identification: [ {
    position: 90 
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 90 
  } ]
  @UI.selectionField: [ {
    position: 90 
  } ]
@Consumption.valueHelpDefinition: [{
  entity: { name: 'ZAIRPORT', element: 'airport_id' }
}]
  AirportToId;
  
  @EndUserText.label: 'Data Reserva'
  @UI.identification: [ {
    position: 105 , 
    label: 'ReservaDate'
  } ]
  @UI.lineItem: [ {
  importance: #MEDIUM,
    position: 105 , 
    label: 'ReservaDate'
  } ]
  @UI.selectionField: [ {
    position: 105 
  } ]
  ReservaDate;
  
  @UI.hidden: true
  CreatedBy;
  
  @UI.hidden: true
  ChangedBy;
  
  @UI.hidden: true
  LastChangedAt;
  
  @UI.hidden: true
  LocLastchgAt;
}
