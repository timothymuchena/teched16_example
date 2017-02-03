CLASS zcl_demo_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_demo_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    DATA model TYPE REF TO zcl_gw_model .

    METHODS get_model
      RETURNING
        VALUE(model) TYPE REF TO zcl_gw_model
      RAISING
        /iwbep/cx_mgw_tech_exception .

    METHODS customers_get_entity
         REDEFINITION .
    METHODS customers_get_entityset
         REDEFINITION .
    METHODS salesorderitems_get_entityset
         REDEFINITION .
    METHODS salesorders_get_entity
         REDEFINITION .
    METHODS salesorders_get_entityset
         REDEFINITION .
    METHODS salesorderitems_get_entity
         REDEFINITION .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEMO_DPC_EXT IMPLEMENTATION.


  METHOD customers_get_entity.
    zcl_demo_customer=>zif_gw_methods~get_entity(
      EXPORTING
        iv_entity_name          = iv_entity_name
        iv_entity_set_name      = iv_entity_set_name
        iv_source_name          = iv_source_name
        it_key_tab              = it_key_tab
        io_request_object       = io_request_object
        io_tech_request_context = io_tech_request_context
        it_navigation_path      = it_navigation_path
        io_model                = get_model( )
        io_message_container    = mo_context->get_message_container( )
      IMPORTING
        er_entity               = er_entity
        es_response_context     = es_response_context ).
  ENDMETHOD.


  METHOD customers_get_entityset.
    zcl_demo_customer=>zif_gw_methods~get_entityset(
      EXPORTING
        iv_entity_name           = iv_entity_name
        iv_entity_set_name       = iv_entity_set_name
        iv_source_name           = iv_source_name
        it_filter_select_options = it_filter_select_options
        is_paging                = is_paging
        it_key_tab               = it_key_tab
        it_navigation_path       = it_navigation_path
        it_order                 = it_order
        iv_filter_string         = iv_filter_string
        iv_search_string         = iv_search_string
        io_tech_request_context  = io_tech_request_context
        io_model                 = get_model( )
        io_message_container     = mo_context->get_message_container( )
      IMPORTING
        et_entityset             = et_entityset
        es_response_context      = es_response_context ).
  ENDMETHOD.


  METHOD get_model.

    IF me->model IS NOT BOUND.
      CREATE OBJECT me->model
        EXPORTING
          runtime = me.
    ENDIF.

    model = me->model.

  ENDMETHOD.


  METHOD salesorderitems_get_entity.
    zcl_demo_salesorderitem=>zif_gw_methods~get_entity(
      EXPORTING
        iv_entity_name          = iv_entity_name
        iv_entity_set_name      = iv_entity_set_name
        iv_source_name          = iv_source_name
        it_key_tab              = it_key_tab
        io_request_object       = io_request_object
        io_tech_request_context = io_tech_request_context
        it_navigation_path      = it_navigation_path
        io_model                = get_model( )
        io_message_container    = mo_context->get_message_container( )
      IMPORTING
        er_entity               = er_entity
        es_response_context     = es_response_context ).
  ENDMETHOD.


  METHOD salesorderitems_get_entityset.
    zcl_demo_salesorderitem=>zif_gw_methods~get_entityset(
      EXPORTING
        iv_entity_name           = iv_entity_name
        iv_entity_set_name       = iv_entity_set_name
        iv_source_name           = iv_source_name
        it_filter_select_options = it_filter_select_options
        is_paging                = is_paging
        it_key_tab               = it_key_tab
        it_navigation_path       = it_navigation_path
        it_order                 = it_order
        iv_filter_string         = iv_filter_string
        iv_search_string         = iv_search_string
        io_tech_request_context  = io_tech_request_context
        io_model                 = get_model( )
        io_message_container     = mo_context->get_message_container( )
      IMPORTING
        et_entityset             = et_entityset
        es_response_context      = es_response_context ).
  ENDMETHOD.


  METHOD salesorders_get_entity.
    zcl_demo_salesorder=>zif_gw_methods~get_entity(
      EXPORTING
        iv_entity_name          = iv_entity_name
        iv_entity_set_name      = iv_entity_set_name
        iv_source_name          = iv_source_name
        it_key_tab              = it_key_tab
        io_request_object       = io_request_object
        io_tech_request_context = io_tech_request_context
        it_navigation_path      = it_navigation_path
        io_model                = get_model( )
        io_message_container    = mo_context->get_message_container( )
      IMPORTING
        er_entity               = er_entity
        es_response_context     = es_response_context ).
  ENDMETHOD.


  METHOD salesorders_get_entityset.
    zcl_demo_salesorder=>zif_gw_methods~get_entityset(
      EXPORTING
        iv_entity_name           = iv_entity_name
        iv_entity_set_name       = iv_entity_set_name
        iv_source_name           = iv_source_name
        it_filter_select_options = it_filter_select_options
        is_paging                = is_paging
        it_key_tab               = it_key_tab
        it_navigation_path       = it_navigation_path
        it_order                 = it_order
        iv_filter_string         = iv_filter_string
        iv_search_string         = iv_search_string
        io_tech_request_context  = io_tech_request_context
        io_model                 = get_model( )
        io_message_container     = mo_context->get_message_container( )
      IMPORTING
        et_entityset             = et_entityset
        es_response_context      = es_response_context ).
  ENDMETHOD.
ENDCLASS.
