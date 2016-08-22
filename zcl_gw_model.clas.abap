class ZCL_GW_MODEL definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !RUNTIME type ref to /IWBEP/IF_MGW_CONV_SRV_RUNTIME
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods GET_ABAP_FIELD_NAME
    importing
      !IV_ENTITY_NAME type STRING
      !IV_FIELD_NAME type STRING
    returning
      value(RV_ABAP_FIELD) type STRING .
  methods GET_SORTABLE_ABAP_FIELD_NAME
    importing
      !IV_ENTITY_NAME type STRING
      !IV_FIELD_NAME type STRING
    returning
      value(RV_ABAP_FIELD) type STRING .
  methods GET_FILTERABLE_ABAP_FIELD_NAME
    importing
      !IV_ENTITY_NAME type STRING
      !IV_FIELD_NAME type STRING
    returning
      value(RV_ABAP_FIELD) type STRING .
  PROTECTED SECTION.
private section.

  data MPC type ref to /IWBEP/IF_MGW_ODATA_RE_MODEL .

  methods GET_ENTITY_PROPERTIES
    importing
      !IV_NAME type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_INTERNAL_NAME
    returning
      value(RT_PROPERTIES) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_T_MED_PROPERTIES .
  methods GET_PROPERTY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_FIELD_NAME type STRING
    returning
      value(RS_PROPERTY) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_S_MED_PROPERTY .
ENDCLASS.



CLASS ZCL_GW_MODEL IMPLEMENTATION.


  METHOD constructor.

    DATA: lr_facade TYPE REF TO /iwbep/cl_mgw_dp_facade.
    lr_facade ?= runtime->get_dp_facade( ).

    mpc ?= lr_facade->/iwbep/if_mgw_dp_int_facade~get_model( ).

  ENDMETHOD.


  METHOD get_abap_field_name.

    rv_abap_field = get_property(
      iv_entity_name = iv_entity_name
      iv_field_name  = iv_field_name
         )-name.

  ENDMETHOD.


  METHOD get_entity_properties.

    DATA(entities) = mpc->get_entity_types( ).

    rt_properties = entities[ name = iv_name ]-properties.
  ENDMETHOD.


  METHOD get_filterable_abap_field_name.

    DATA(property) = get_property(
      iv_entity_name = iv_entity_name
      iv_field_name  = iv_field_name
      ).

    CHECK property-filterable = abap_true.

    rv_abap_field = property-name.

  ENDMETHOD.


  METHOD get_property.

    DATA(properties) = get_entity_properties( |{ iv_entity_name }| ).

    rs_property = properties[ external_name = iv_field_name ].

  ENDMETHOD.


  METHOD get_sortable_abap_field_name.

    DATA(property) = get_property(
      iv_entity_name = iv_entity_name
      iv_field_name  = iv_field_name
         ).

    CHECK property-sortable = abap_true.

    rv_abap_field = property-name.

  ENDMETHOD.
ENDCLASS.