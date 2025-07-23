@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.sapObjectNodeType.name: 'ZFLIGHT_BOOKING'
define root view entity ZR_FLIGHT_BOOKING
  as select from zflight_booking
{
  key travel_id as TravelId,
  key booking_id as BookingId,
  customer_id as CustomerId,
  connection_id as ConnectionId,
  airport_from_id as AirportFromId,
  airport_to_id as AirportToId,
  reserva_date as ReservaDate,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.user.lastChangedBy: true
  changed_by as ChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  loc_lastchg_at as LocLastchgAt
  
}
