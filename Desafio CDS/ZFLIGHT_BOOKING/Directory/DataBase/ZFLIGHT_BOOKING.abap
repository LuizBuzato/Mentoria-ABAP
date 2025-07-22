@EndUserText.label : 'Tabela de voos'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zflight_booking {

  key client      : abap.clnt not null;
  key travel_id   : /dmo/travel_id not null;
  key booking_id  : /dmo/booking_id not null;
  customer_id     : /dmo/customer_id;
  connection_id   : /dmo/connection_id;
  airport_from_id : /dmo/airport_from_id;
  airport_to_id   : /dmo/airport_to_id;
  reserva_date    : abap.dats;
  created_by      : abp_creation_user;
  changed_by      : abp_lastchange_user;
  last_changed_at : abp_lastchange_tstmpl;
  loc_lastchg_at  : abp_locinst_lastchange_tstmpl;

}
