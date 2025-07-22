CLASS lhc_zr_flight_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrFlightBooking
        RESULT result,
      DataReserva FOR MODIFY
        IMPORTING keys FOR ACTION ZrFlightBooking~DataReserva RESULT result.
ENDCLASS.

CLASS lhc_zr_flight_booking IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD DataReserva.

    DATA:
      lt_booking        TYPE TABLE FOR READ RESULT zr_flight_booking,
      ls_booking        TYPE STRUCTURE FOR READ RESULT zr_flight_booking,
      lv_result_data    TYPE d,
      lt_update_booking TYPE TABLE FOR UPDATE zr_flight_booking,
      reported_record   LIKE LINE OF reported-ZrFlightBooking,
      failed_record     LIKE LINE OF failed-ZrFlightBooking.


* data atual do sistema
    lv_result_data = cl_abap_context_info=>get_system_date( ).

* Lê as entidades que foram acionadas pela ação
    READ ENTITIES OF zr_flight_booking
      IN LOCAL MODE
      ENTITY ZrFlightBooking
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT lt_booking.





    LOOP AT lt_booking INTO ls_booking.
      IF ls_booking-ReservaDate IS NOT INITIAL.
        failed_record-%tky = ls_booking-%tky.
        APPEND failed_record TO failed-ZrFlightBooking.

        reported_record-%tky = ls_booking-%tky.
        reported_record-%msg = new_message(
        id = 'ZFLIGHT_MSG'
        number = '002'
        severity = ms-error
        v1 = ls_booking-BookingId ).

        APPEND reported_record TO reported-ZrFlightBooking.

      ELSEIF ls_booking-ReservaDate IS INITIAL.

* Monta a tabela para atualização
      APPEND VALUE #( %tky = ls_booking-%tky
                      ReservaDate = lv_result_data ) TO lt_update_booking.

* Atualiza os registros
      MODIFY ENTITIES OF zr_flight_booking
        IN LOCAL MODE
        ENTITY ZrFlightBooking
        UPDATE FIELDS ( ReservaDate )
        WITH lt_update_booking.
*     REPORTED reported.

        ls_booking-ReservaDate = lv_result_data.

        reported_record-%tky = ls_booking-%tky.
        reported_record-%msg = new_message(
        id = 'ZFLIGHT_MSG'
        number = '001'
        severity = ms-success
        v1 = ls_booking-BookingId
        v2 = ls_booking-ReservaDate ).

        APPEND reported_record TO reported-ZrFlightBooking.
      ENDIF.
    ENDLOOP.

** Preencher o result
** O Result atualiza a página após alterar os dados
** tky é a chave técnica da instância da entidade que está sendo manipulada

    result = VALUE #( FOR ls_update IN lt_booking
         ( %tky = ls_update-%tky %param = ls_update ) ).

  ENDMETHOD.


ENDCLASS.
