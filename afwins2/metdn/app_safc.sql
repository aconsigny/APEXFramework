--Méta
set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040200;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFC');
  sie$migrt$pkg.var_aplic(241) := sie_11_aplic_pkg.maj_aplic ('SAFC','SIE APEX Framework - Configuration',1000007, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(241),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFC');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), null, null, 1021);

merge into sie_11_versn t
                        using tc$11$versn tf
               on ((t.code = tf.code) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ) and (t.ref_plugn = tf.ref_plugn or (t.ref_plugn is null and tf.ref_plugn is null) or tf.ref_plugn is null ) and (t.ref_prodt = tf.ref_prodt or (t.ref_prodt is null and tf.ref_prodt is null) or tf.ref_prodt is null ))
when not matched then
              insert (t.code, t.dnr_ref_aplic, t.dnr_ref_prodt, t.indic_docmn_verl, t.nom, t.numr_versn_1, t.numr_versn_2, t.numr_versn_3, t.numr_versn_4, t.ref_aplic, t.ref_plugn, t.ref_prodt)
              values (tf.code, tf.dnr_ref_aplic, tf.dnr_ref_prodt, tf.indic_docmn_verl, tf.nom, tf.numr_versn_1, tf.numr_versn_2, tf.numr_versn_3, tf.numr_versn_4, tf.ref_aplic, tf.ref_plugn, tf.ref_prodt)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.dnr_ref_prodt = tf.dnr_ref_prodt, t.indic_docmn_verl = tf.indic_docmn_verl, t.nom = tf.nom, t.numr_versn_1 = tf.numr_versn_1, t.numr_versn_2 = tf.numr_versn_2, t.numr_versn_3 = tf.numr_versn_3, t.numr_versn_4 = tf.numr_versn_4
log errors into em$11_versn
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_11_versn');
  end if;
end;

select seqnc into sie$migrt$pkg.var_versn(1021) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select') and ref_plugn is null and ref_prodt is null;
--Fin - sie_11_versn
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_11_versn');
end;
/

--Debut - sie_13_page
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page');
delete from tc$13$page;

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52503);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52504);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52505);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52506);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Environnement', 1012, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52523);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Environnements', 1011, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 52524);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèles de capture', 1041, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53183);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèle de capture', 1042, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53184);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Définitions de capture', 1032, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53083);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Schéma', 1022, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53084);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Paramètres', 1051, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53303);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:25:48', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Paramètre', 1052, null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 53304);

merge into sie_13_page t
                        using tc$13$page tf
               on ((t.numr_apex = tf.numr_apex) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ))
when not matched then
              insert (t.date_dernr_maj_refrn_apex, t.descr, t.dnr_ref_aplic, t.indic_prise_charg_sie01, t.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18, t.indic_prise_charg_sie19, t.nom, t.numr_apex, t.prefx_mesg, t.ref_aplic)
              values (tf.date_dernr_maj_refrn_apex, tf.descr, tf.dnr_ref_aplic, tf.indic_prise_charg_sie01, tf.indic_prise_charg_sie04, tf.indic_prise_charg_sie13_confr, tf.indic_prise_charg_sie13_navgt, tf.indic_prise_charg_sie14_popup, tf.indic_prise_charg_sie18, tf.indic_prise_charg_sie19, tf.nom, tf.numr_apex, tf.prefx_mesg, tf.ref_aplic)
when matched then
              update set t.date_dernr_maj_refrn_apex = tf.date_dernr_maj_refrn_apex, t.descr = tf.descr, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_prise_charg_sie01 = tf.indic_prise_charg_sie01, t.indic_prise_charg_sie04 = tf.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr = tf.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt = tf.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup = tf.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18 = tf.indic_prise_charg_sie18, t.indic_prise_charg_sie19 = tf.indic_prise_charg_sie19, t.nom = tf.nom, t.prefx_mesg = tf.prefx_mesg
log errors into em$13_page
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page(52503) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(52504) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(52505) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(52506) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(52523) from sie_13_page where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(52524) from sie_13_page where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53183) from sie_13_page where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53184) from sie_13_page where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53083) from sie_13_page where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53084) from sie_13_page where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53303) from sie_13_page where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
select seqnc into sie$migrt$pkg.var_page(53304) from sie_13_page where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
--Fin - sie_13_page
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page');
end;
/

--Debut - sie_13_page_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_lang');
delete from tc$13$page$lang;

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Paramètres', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53303, 'Insert'), 50344);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Schéma', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53084, 'Insert'), 50124);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Définitions de captures', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53083, 'Insert'), 50125);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Environnements', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52524, 'Insert'), 49564);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Environnement', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52523, 'Insert'), 49565);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Paramètre', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53304, 'Insert'), 50345);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Modèle de capture', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53184, 'Insert'), 50224);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Modèles de capture', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53183, 'Insert'), 50225);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Pilotage', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52506, 'Insert'), 49544);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Commentaire', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52505, 'Insert'), 49545);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52504, 'Insert'), 49546);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52503, 'Insert'), 49547);

merge into sie_13_page_lang t
                        using tc$13$page$lang tf
               on ((t.ref_lang = tf.ref_lang or (t.ref_lang is null and tf.ref_lang is null) or tf.ref_lang is null ) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.nom, t.ref_lang, t.ref_page)
              values (tf.dnr_ref_aplic, tf.nom, tf.ref_lang, tf.ref_page)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.nom = tf.nom
log errors into em$13_page_lang
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_lang');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page_lang(50344) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53303, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50124) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50125) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49564) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52524, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49565) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50345) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50224) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50225) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53183, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49544) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52506, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49545) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49546) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49547) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
--Fin - sie_13_page_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_lang');
end;
/

--Debut - sie_13_page_ir
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir');
delete from tc$13$page$ir;

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'N', null, 'Paramètres', 1, sie$migrt$pkg.obten_var_page(53303, 'Insert'), 25676, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'N', null, 'Liste des environnements', 1, sie$migrt$pkg.obten_var_page(52524, 'Insert'), 25296, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'N', null, 'Schemas', 1, sie$migrt$pkg.obten_var_page(52523, 'Insert'), 25596, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 'N', null, 'Liste des templates de capture', 1, sie$migrt$pkg.obten_var_page(53183, 'Insert'), 25616, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');

merge into sie_13_page_ir t
                        using tc$13$page$ir tf
               on ((t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.indic_forcr_ajust_page, t.largr_deft, t.libl_regn, t.nombr_page_largr, t.ref_page, t.unite_mesr_largr_deft)
              values (tf.dnr_ref_aplic, tf.indic_forcr_ajust_page, tf.largr_deft, tf.libl_regn, tf.nombr_page_largr, tf.ref_page, tf.unite_mesr_largr_deft)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_forcr_ajust_page = tf.indic_forcr_ajust_page, t.largr_deft = tf.largr_deft, t.libl_regn = tf.libl_regn, t.nombr_page_largr = tf.nombr_page_largr, t.unite_mesr_largr_deft = tf.unite_mesr_largr_deft
log errors into em$13_page_ir
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');
select seqnc into sie$migrt$pkg.var_page_ir(25676) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(53303, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25296) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52524, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25596) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25616) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(53183, 'Select');
--Fin - sie_13_page_ir
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir');
end;
/

--Debut - sie_13_page_ir_coln
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir_coln');
delete from tc$13$page$ir$coln;

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN_DEFN', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 486038528973174089, 'O', null, 'Captures', 4, sie$migrt$pkg.obten_var_page_ir(25596, 'Insert'), 265253, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455981820798048168, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25296, 'Insert'), 264873, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE_ESPAC_TRAVL_APEX', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455981923536048171, 'O', null, 'Espace travail APEX', 2, sie$migrt$pkg.obten_var_page_ir(25296, 'Insert'), 264874, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455982021255048171, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(25296, 'Insert'), 264875, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455982135261048171, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(25296, 'Insert'), 264876, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_NATR_ENVIR_FORMT', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455989141142111806, 'O', null, 'Nature', 5, sie$migrt$pkg.obten_var_page_ir(25296, 'Insert'), 264877, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487115012557474614, 'O', null, 'Nom', 2, sie$migrt$pkg.obten_var_page_ir(25616, 'Insert'), 265294, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487115139068474614, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(25616, 'Insert'), 265295, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487114932845474614, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25616, 'Insert'), 265293, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 510914531893831757, 'O', null, 'Code du paramètre', 2, sie$migrt$pkg.obten_var_page_ir(25676, 'Insert'), 265403, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 510914437357831740, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25676, 'Insert'), 265402, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485970425461731849, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25596, 'Insert'), 265233, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485970526931731854, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(25596, 'Insert'), 265234, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485970611278731854, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25596, 'Insert'), 265235, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');

merge into sie_13_page_ir_coln t
                        using tc$13$page$ir$coln tf
               on ((t.coln_table = tf.coln_table) and (t.ref_page_ir = tf.ref_page_ir or (t.ref_page_ir is null and tf.ref_page_ir is null) or tf.ref_page_ir is null ))
when not matched then
              insert (t.coln_table, t.dnr_ref_aplic, t.id_apex, t.indic_exprt, t.largr, t.libl, t.ordre_afich, t.ref_page_ir, t.type_largr)
              values (tf.coln_table, tf.dnr_ref_aplic, tf.id_apex, tf.indic_exprt, tf.largr, tf.libl, tf.ordre_afich, tf.ref_page_ir, tf.type_largr)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_exprt = tf.indic_exprt, t.largr = tf.largr, t.libl = tf.libl, t.ordre_afich = tf.ordre_afich, t.type_largr = tf.type_largr
log errors into em$13_page_ir_coln
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265253) from sie_13_page_ir_coln where coln_table = 'LIEN_DEFN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264873) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264874) from sie_13_page_ir_coln where coln_table = 'CODE_ESPAC_TRAVL_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264875) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264876) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264877) from sie_13_page_ir_coln where coln_table = 'REF_DV_NATR_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265294) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265295) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265293) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265403) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25676, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265402) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25676, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265233) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265234) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265235) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
--Fin - sie_13_page_ir_coln
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir_coln');
end;
/

--Debut - sie_13_page_prefr_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_prefr_navgt');
delete from tc$13$page$prefr$navgt;

--Fin - sie_13_page_prefr_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_prefr_navgt');
end;
/

--Debut - sie_13_liste_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_liste_navgt');
delete from tc$13$liste$navgt;

--Fin - sie_13_liste_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_liste_navgt');
end;
/

--Debut - sie_13_page_item
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item');
delete from tc$13$page$item;

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 486041515869274314, 'O', null, null, null, null, 'N', null, 'Schéma', 'P1032_REF_SCHEM', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585168, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 486042126089315149, 'O', null, null, null, null, 'N', null, 'Évènement', 'P1032_REF_EVENM', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585169, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482456030877028060, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585170, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482455910905028060, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585171, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487180336690263432, 'O', null, null, null, null, 'N', null, 'Modèle de capture', 'P1032_REF_DEFNT_CAPTR_DEFT', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585468, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 488774441734454117, 'O', null, null, null, null, 'N', null, 'Concilier', 'P1032_CONCILIER', sie$migrt$pkg.obten_var_page(53083, 'Insert'), 585469, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 488836643706839445, 'O', null, null, null, null, 'O', null, 'Modèle de capture', 'P1022_REF_DEFNT_CAPTR_DEFT', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585470, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487170143401924834, 'O', null, null, null, null, 'N', null, 'Évènement', 'P1042_REF_EVENM', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585471, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483546913832679717, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585472, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 507327428403565088, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(53303, 'Insert'), 585574, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 510919132732910683, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1052_SEQNC', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585575, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 510919322216910705, 'O', null, null, null, null, 'O', null, 'Code du paramètre', 'P1052_CODE', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585576, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 510919523392910706, 'O', null, null, null, null, 'O', null, 'Valeur', 'P1052_VALR', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585577, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 507329111987599141, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585578, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 507328906672599141, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585579, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 507328817419599141, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585580, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 507328718753599141, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(53304, 'Insert'), 585581, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485995741829936464, 'O', null, null, null, null, 'O', null, 'Code', 'P1022_CODE', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585128, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485995924465936467, 'O', null, null, null, null, 'O', null, 'Nom', 'P1022_NOM', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585129, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485996136725936467, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1022_REF_ENVIR', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585130, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485996324608936467, 'O', null, null, null, null, 'O', null, 'Capture DDL', 'P1022_INDIC_CAPTR_DDL', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585131, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485996523691936469, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1022_SEQNC', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585132, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482406027935624932, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585133, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482406223719624932, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585134, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482406429579624933, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585135, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482406603923624933, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(53084, 'Insert'), 585136, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 485967626586709139, 'O', null, null, null, null, 'N', null, '[P1012_MODE]', 'P1012_MODE', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 585117, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 482393729634571954, 'N', null, null, null, null, 'N', null, 'Ajouter', 'AJOUT_SCHEM', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 585118, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1147379557725079856, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584196, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1219092891382140799, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584197, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073568907124709450, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584198, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073569115508709451, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584199, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073569304839709451, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584200, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073569507392709451, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584201, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073569707356709452, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584202, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073569900837709452, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(52504, 'Insert'), 584203, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476810215066044819, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584204, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476810718890044822, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584205, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476811198817044822, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584206, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476811415743044823, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584207, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476811913838044824, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584208, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476812121780044824, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584209, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1476812621551044824, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584210, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1473223908467733293, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(52505, 'Insert'), 584211, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1073270127125152298, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584188, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1102815126408233206, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584189, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1102815353882233208, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584190, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1102815528872233208, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584191, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1103154347293852689, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584192, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1124638831284909353, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584193, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1147379147682076986, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584194, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 1147379352877078509, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(52503, 'Insert'), 584195, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455979116395048139, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1012_SEQNC', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584228, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455979317818048147, 'O', null, null, null, null, 'O', null, 'Espace travail APEX', 'P1012_CODE_ESPAC_TRAVL_APEX', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584229, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455979512122048148, 'O', null, null, null, null, 'O', null, 'Code', 'P1012_CODE', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584230, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455979717357048148, 'O', null, null, null, null, 'O', null, 'Nom', 'P1012_NOM', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584231, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455979933699048149, 'O', null, null, null, null, 'O', null, 'Description', 'P1012_DESCR', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584232, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 455980143700048149, 'O', null, null, null, null, 'O', null, 'Nature environnement', 'P1012_REF_DV_NATR_ENVIR', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584233, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 452389104643736573, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584234, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 452388924530736572, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584235, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 452388830862736572, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584236, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 452388701638736572, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52523, 'Insert'), 584237, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 452393516794736641, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52524, 'Insert'), 584238, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483526708254177064, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(53183, 'Insert'), 585308, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487118728939627939, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1042_SEQNC', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585309, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487118940468627948, 'O', null, null, null, null, 'O', null, 'Nom', 'P1042_NOM', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585310, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 487119125782627949, 'O', null, null, null, null, 'O', null, 'Code', 'P1042_CODE', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585311, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483528701573316397, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585312, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483528522695316397, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585313, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483528431747316397, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585314, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(241, 'Insert'), 483528304333316397, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(53184, 'Insert'), 585315, 'BOUTN');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');

merge into sie_13_page_item t
                        using tc$13$page$item tf
               on ((t.nom_apex = tf.nom_apex) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.depsm_alias_coln, t.dnr_ref_aplic, t.id_apex, t.indic_confr_sauvg, t.indic_creat, t.indic_en_creat, t.indic_en_modfc, t.indic_modfc, t.indic_rechr, t.indic_suprs, t.libl, t.nom_apex, t.ref_page, t.type_item)
              values (tf.depsm_alias_coln, tf.dnr_ref_aplic, tf.id_apex, tf.indic_confr_sauvg, tf.indic_creat, tf.indic_en_creat, tf.indic_en_modfc, tf.indic_modfc, tf.indic_rechr, tf.indic_suprs, tf.libl, tf.nom_apex, tf.ref_page, tf.type_item)
when matched then
              update set t.depsm_alias_coln = tf.depsm_alias_coln, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_confr_sauvg = tf.indic_confr_sauvg, t.indic_creat = tf.indic_creat, t.indic_en_creat = tf.indic_en_creat, t.indic_en_modfc = tf.indic_en_modfc, t.indic_modfc = tf.indic_modfc, t.indic_rechr = tf.indic_rechr, t.indic_suprs = tf.indic_suprs, t.libl = tf.libl, t.type_item = tf.type_item
log errors into em$13_page_item
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(585168) from sie_13_page_item where nom_apex = 'P1032_REF_SCHEM' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585169) from sie_13_page_item where nom_apex = 'P1032_REF_EVENM' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585170) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585171) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585468) from sie_13_page_item where nom_apex = 'P1032_REF_DEFNT_CAPTR_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585469) from sie_13_page_item where nom_apex = 'P1032_CONCILIER' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585470) from sie_13_page_item where nom_apex = 'P1022_REF_DEFNT_CAPTR_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585471) from sie_13_page_item where nom_apex = 'P1042_REF_EVENM' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585472) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585574) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53303, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585575) from sie_13_page_item where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585576) from sie_13_page_item where nom_apex = 'P1052_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585577) from sie_13_page_item where nom_apex = 'P1052_VALR' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585578) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585579) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585580) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585581) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585128) from sie_13_page_item where nom_apex = 'P1022_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585129) from sie_13_page_item where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585130) from sie_13_page_item where nom_apex = 'P1022_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585131) from sie_13_page_item where nom_apex = 'P1022_INDIC_CAPTR_DDL' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585132) from sie_13_page_item where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585133) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585134) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585135) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585136) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585117) from sie_13_page_item where nom_apex = 'P1012_MODE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585118) from sie_13_page_item where nom_apex = 'AJOUT_SCHEM' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584196) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584197) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584198) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584199) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584200) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584201) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584202) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584203) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584204) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584205) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584206) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584207) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584208) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584209) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584210) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584211) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584188) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584189) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584190) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584191) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584192) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584193) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584194) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584195) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584228) from sie_13_page_item where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584229) from sie_13_page_item where nom_apex = 'P1012_CODE_ESPAC_TRAVL_APEX' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584230) from sie_13_page_item where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584231) from sie_13_page_item where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584232) from sie_13_page_item where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584233) from sie_13_page_item where nom_apex = 'P1012_REF_DV_NATR_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584234) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584235) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584236) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584237) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(584238) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52524, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585308) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53183, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585309) from sie_13_page_item where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585310) from sie_13_page_item where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585311) from sie_13_page_item where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585312) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585313) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585314) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585315) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
--Fin - sie_13_page_item
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item');
end;
/

--Debut - sie_13_page_item_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item_lang');
delete from tc$13$page$item$lang;

--Fin - sie_13_page_item_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item_lang');
end;
/

--Debut - sie_13_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_condt_piltb');
delete from tc$13$condt$piltb;

--Fin - sie_13_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_condt_piltb');
end;
/

--Debut - sie_13_lien_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_lien_condt_piltb');
delete from tc$13$lien$condt$piltb;

--Fin - sie_13_lien_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_lien_condt_piltb');
end;
/

--Debut - sie_13_regn_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb');
delete from tc$13$regn$piltb;

--Fin - sie_13_regn_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb');
end;
/

--Debut - sie_13_regn_piltb_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb_lang');
delete from tc$13$regn$piltb$lang;

--Fin - sie_13_regn_piltb_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb_lang');
end;
/

--Debut - sie_13_prefr
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_prefr');
delete from tc$13$prefr;

--Fin - sie_13_prefr
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_prefr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14342, 'Update') where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14342, 'Update') where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14663, 'Update') where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14662, 'Update') where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(241, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN_DEFN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE_ESPAC_TRAVL_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_NATR_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25296, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25616, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25676, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25676, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25596, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_prefr_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_SCHEM' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_EVENM' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_DEFNT_CAPTR_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_CONCILIER' and ref_page = sie$migrt$pkg.obten_var_page(53083, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_DEFNT_CAPTR_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_REF_EVENM' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53303, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_VALR' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53304, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_INDIC_CAPTR_DDL' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53084, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_MODE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_SCHEM' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52504, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(52505, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(52503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE_ESPAC_TRAVL_APEX' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_REF_DV_NATR_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52523, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52524, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53183, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53184, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_lien_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_prefr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_aplic
                       set ref_versn = sie$migrt$pkg.obten_var_versn(1021, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(5, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(52504, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(241);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFC - SIE APEX Framework - Configuration');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(241),'O');
  end if;
end;
/

