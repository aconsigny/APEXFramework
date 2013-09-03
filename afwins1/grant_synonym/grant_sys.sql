/* Formatted on 6/3/2013 10:50:26 PM (QP5 v5.185.11230.41888) */
set define off;

grant dba to afw_040200;
grant connect to afw_040200;
grant resource to afw_040200;
  alter user afw_040200 default role all;
  -- 19 System Privileges for afw_040200
grant create procedure to afw_040200;
grant create table to afw_040200;
grant debug connect session to afw_040200;
grant create synonym to afw_040200;
grant alter session to afw_040200;
grant create operator to afw_040200;
grant create materialized view to afw_040200;
grant select any dictionary to afw_040200;
grant create type to afw_040200;
grant create sequence to afw_040200;
grant create any context to afw_040200;
grant create dimension to afw_040200;
grant create cluster to afw_040200;
grant create indextype to afw_040200;
grant select any table to afw_040200;
grant create job to afw_040200;
grant create trigger to afw_040200;
grant create view to afw_040200;
grant unlimited tablespace to afw_040200;

prompt privs on table flows_files.wwv_flow_file_objects$ to afw_040200;
grant alter, delete, index, insert, references, select, update,      on commit refresh, query rewrite, debug, flashback on flows_files.wwv_flow_file_objects$ to afw_040200;

   prompt privs on directory sys.data_pump_dir to afw_040200;
  grant read, write on directory sys.data_pump_dir to afw_040200 with grant option;
  prompt privs on view sys.dba_arguments to afw_040200;
grant select on sys.dba_arguments to afw_040200;
  prompt privs on view sys.dba_constraints to afw_040200;
grant select on sys.dba_constraints to afw_040200;
  prompt privs on view sys.dba_cons_columns to afw_040200;
grant select on sys.dba_cons_columns to afw_040200;
  prompt privs on view sys.dba_directories to afw_040200;
grant select on sys.dba_directories to afw_040200;
  prompt privs on view sys.dba_indexes to afw_040200;
grant select on sys.dba_indexes to afw_040200;
  prompt privs on view sys.dba_ind_columns to afw_040200;
grant select on sys.dba_ind_columns to afw_040200;
  prompt privs on view sys.dba_objects to afw_040200;
grant select on sys.dba_objects to afw_040200;
  prompt privs on view sys.dba_procedures to afw_040200;
grant select on sys.dba_procedures to afw_040200;
  prompt privs on view sys.dba_sequences to afw_040200;
grant select on sys.dba_sequences to afw_040200;
  prompt privs on view sys.dba_source to afw_040200;
grant select on sys.dba_source to afw_040200;
  prompt privs on view sys.dba_tables to afw_040200;
grant select on sys.dba_tables to afw_040200;
  prompt privs on view sys.dba_tab_cols to afw_040200;
grant select on sys.dba_tab_cols to afw_040200;
  prompt privs on package sys.dbms_crypto to afw_040200;
grant execute on sys.dbms_crypto to afw_040200;
  prompt privs on package sys.dbms_lock to afw_040200;
grant execute on sys.dbms_lock to afw_040200;
  prompt privs on package sys.dbms_rls to afw_040200;
grant execute on sys.dbms_rls to afw_040200;
  prompt privs on package sys.utl_http to afw_040200;
grant execute on sys.utl_http to afw_040200;
  prompt privs on view sys.v_$database to afw_040200;
grant select on sys.v_$database to afw_040200;