@AbapCatalog.sqlViewName: 'Z_AIRPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filtro para airline'
@Metadata.ignorePropagatedAnnotations: true
define view ZAIRPORT as select from /dmo/airport
{
    @UI.lineItem: [{ position: 10, importance: #HIGH }]
    key airport_id as airport_id,

    @UI.lineItem: [{ position: 20, importance: #HIGH }]
    @Search.defaultSearchElement: true
    name as name
}
