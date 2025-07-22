managed implementation in class ZBP_R_FLIGHT_BOOKING unique;
strict ( 2 );
with draft;
extensible;
define behavior for ZR_FLIGHT_BOOKING alias ZrFlightBooking
persistent table ZFLIGHT_BOOKING
extensible
draft table ZFLIGHT_BOKING_D
etag master LocLastchgAt
lock master total etag LastChangedAt
authorization master( global )

{
  field ( mandatory : create )
   TravelId,
   BookingId;

  field ( readonly )
   CustomerId,
   ConnectionId,
   AirportFromId,
   AirportToId,
   ReservaDate,
   CreatedBy,
   ChangedBy,
   LastChangedAt,
   LocLastchgAt;

  field ( readonly : update )

   TravelId,
   BookingId;


  create;
  update;
  delete;

  draft action Activate optimized;
  draft action Discard;
  draft action Edit;
  draft action Resume;
  draft determine action Prepare;
  action DataReserva result[1] $self;

  mapping for ZFLIGHT_BOOKING corresponding extensible
  {
    TravelId = travel_id;
    BookingId = booking_id;
    CustomerId = customer_id;
    ConnectionId = connection_id;
    AirportFromId = airport_from_id;
    AirportToId = airport_to_id;
    ReservaDate = reserva_date;
    CreatedBy = created_by;
    ChangedBy = changed_by;
    LastChangedAt = last_changed_at;
    LocLastchgAt = loc_lastchg_at;
  }

}
