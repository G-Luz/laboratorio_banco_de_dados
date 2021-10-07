create trigger tg_hist_fun
before insert or update on funcionarios
for each row
begin
	insert into hfuncionarios values (:old.fun_id,:old.fun_nome,:old.fun_cargo,:old.fun_matricula, sysdate);
end;
/


create trigger tg_hist_ven
before insert or update on vendas
for each row
begin
	insert into hvendas values (:old.ven_id, ven_date, :old.ven_valor_final, :old.ven_valor_icms_total, :old.ven_cpf_comprador, :old.ven_cnpj_comprador, sysdate);
end;
/


create trigger tg_hist_vli
before insert or update on vendas_livros
for each row
begin
	insert into hvendas_livros values (:old.vlv_lvr_id, :old.vlv_id_ven, :old.vlv_ven_valor_icms_unitario , sysdate);
end;
/

create trigger tg_hist_cat
before insert or update on categorias
for each row
begin
    insert into hcategorias values (:old.cat_id,:old.cat_nome,sysdate);
end;
/

create trigger tg_hist_aut
before insert or update on autores
for each row
begin
    insert into hautores values (:old.aut_id,:old.aut_nome,sysdate);
end;
/

create trigger tg_hist_liv
before insert or update on livros
for each row
begin
    insert into hlivro values (:old.lvr_id,:old.lvr_nome,:old.preco_capa,:old.preco_venda,sysdate);
end;
/

create trigger tg_hist_lau
before insert or update on livros_autores
for each row
begin
    insert into hlivros_autores values (:old.lau_lvr_id,:old.lau_aut_id,sysdate);
end;
/

create trigger tg_hist_lca
before insert or update on livros_categorias
for each row
begin
    insert into hlivros_categorias values (:old.lau_lvr_id,:old.lau_aut_id,sysdate);
end;
/