CLASS zbooking DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbooking IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lt_booking TYPE HASHED TABLE OF zflight_booking WITH UNIQUE KEY travel_id booking_id.



  select
  a~travel_id,
  a~booking_id,
  a~customer_id,
  a~connection_id,
  b~airport_from_id,
  b~airport_to_id
  from /dmo/booking as a
  left join /dmo/connection as b
  on a~carrier_id = b~carrier_id
  and a~connection_id = b~connection_id
  into CORRESPONDING FIELDS OF TABLE @lt_booking.

  loop at lt_booking into data(ls_booking).

  MODIFY zflight_booking FROM @ls_booking.

  ENDLOOP.


  out->write( lt_booking ).




  ENDMETHOD.
ENDCLASS.
