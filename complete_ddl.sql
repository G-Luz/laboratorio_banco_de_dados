CREATE TABLE autores (
    aut_id   NUMBER(6) NOT NULL,
    aut_nome VARCHAR2(100 CHAR) NOT NULL
);

COMMENT ON COLUMN autores.aut_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN autores.aut_nome IS
    'Esta coluna armazena o nome do autor.';

ALTER TABLE autores ADD CONSTRAINT autores_pk PRIMARY KEY ( aut_id );

CREATE TABLE categorias (
    cat_id   NUMBER(6) NOT NULL,
    cat_nome VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN categorias.cat_id IS
    'Esta coluna é a pk da relação.';

COMMENT ON COLUMN categorias.cat_nome IS
    'Esta coluna armazena o nome das categorias de livros.';

ALTER TABLE categorias ADD CONSTRAINT categorias_pk PRIMARY KEY ( cat_id );

CREATE TABLE funcionarios (
    fun_id        NUMBER(6) NOT NULL,
    fun_nome      VARCHAR2(50 CHAR) NOT NULL,
    fun_cargo     VARCHAR2(50 CHAR) NOT NULL,
    fun_matricula VARCHAR2(30 CHAR) NOT NULL
);

COMMENT ON COLUMN funcionarios.fun_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN funcionarios.fun_nome IS
    'Esta coluna armazena o nome do funcionário.';

COMMENT ON COLUMN funcionarios.fun_cargo IS
    'Esta coluna armazena o cargo do funcionário.';

COMMENT ON COLUMN funcionarios.fun_matricula IS
    'Esta coluna armazena a matrícula do funcionário.';

ALTER TABLE funcionarios ADD CONSTRAINT funcionarios_pk PRIMARY KEY ( fun_id );

CREATE TABLE hautores (
    haut_id         NUMBER(6) NOT NULL,
    haut_nome       VARCHAR2(100 CHAR) NOT NULL,
    haut_dt_entrada DATE NOT NULL
);

COMMENT ON COLUMN hautores.haut_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN hautores.haut_nome IS
    'Esta coluna armazena o nome do autor.';

ALTER TABLE hautores ADD CONSTRAINT pk_haut PRIMARY KEY ( haut_id,
                                                          haut_dt_entrada );

CREATE TABLE hcategorias (
    hcat_id         NUMBER(6) NOT NULL,
    hcat_nome       VARCHAR2(50 CHAR) NOT NULL,
    hcat_dt_entrada DATE NOT NULL
);

COMMENT ON COLUMN hcategorias.hcat_id IS
    'Esta coluna é a pk da relação.';

COMMENT ON COLUMN hcategorias.hcat_nome IS
    'Esta coluna armazena o nome das categorias de livros.';

ALTER TABLE hcategorias ADD CONSTRAINT pk_hcat PRIMARY KEY ( hcat_id,
                                                             hcat_dt_entrada );

CREATE TABLE hfuncionarios (
    hfun_id         NUMBER(6) NOT NULL,
    hfun_nome       VARCHAR2(50 CHAR) NOT NULL,
    hfun_cargo      VARCHAR2(50 CHAR) NOT NULL,
    hfun_matricula  VARCHAR2(30 CHAR) NOT NULL,
    hfun_dt_entrada DATE NOT NULL
);

COMMENT ON COLUMN hfuncionarios.hfun_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN hfuncionarios.hfun_nome IS
    'Esta coluna armazena o nome do funcionário.';

COMMENT ON COLUMN hfuncionarios.hfun_cargo IS
    'Esta coluna armazena o cargo do funcionário.';

COMMENT ON COLUMN hfuncionarios.hfun_matricula IS
    'Esta coluna armazena a matrícula do funcionário.';

ALTER TABLE hfuncionarios ADD CONSTRAINT pk_hfun PRIMARY KEY ( hfun_id,
                                                               hfun_dt_entrada );

CREATE TABLE hlivros (
    hlvr_id          NUMBER(6) NOT NULL,
    hlvr_preco_capa  NUMBER(8, 2) NOT NULL,
    hlvr_preco_venda NUMBER(8, 2) NOT NULL,
    hlvr_nome        VARCHAR2(50 CHAR) NOT NULL,
    hlvr_dt_entrada  DATE NOT NULL
);

COMMENT ON COLUMN hlivros.hlvr_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN hlivros.hlvr_preco_capa IS
    'Esta coluna armazena o preço de capa do livro.';

COMMENT ON COLUMN hlivros.hlvr_preco_venda IS
    'Esta coluna armazena o preço de venda';

COMMENT ON COLUMN hlivros.hlvr_nome IS
    'Esta coluna armazena o nome dos livros.';

ALTER TABLE hlivros ADD CONSTRAINT pk_hlvr PRIMARY KEY ( hlvr_id,
                                                         hlvr_dt_entrada );

CREATE TABLE hlivros_autores (
    hlau_lvr_id     NUMBER(6) NOT NULL,
    hlau_aut_id     NUMBER(6) NOT NULL,
    hlau_dt_entrada DATE NOT NULL
);

COMMENT ON COLUMN hlivros_autores.hlau_lvr_id IS
    'Esta coluna relaciona a tabela livros com a tabela autores';

COMMENT ON COLUMN hlivros_autores.hlau_aut_id IS
    'Esta coluna relaciona a tabela livros  com a tabela autores';

ALTER TABLE hlivros_autores
    ADD CONSTRAINT pk_hlau PRIMARY KEY ( hlau_lvr_id,
                                         hlau_aut_id,
                                         hlau_dt_entrada );

CREATE TABLE hlivros_categorias (
    hlvc_lvr_id     NUMBER(6) NOT NULL,
    hlvc_cat_id     NUMBER(6) NOT NULL,
    hlvc_dt_entrada DATE NOT NULL
);

ALTER TABLE hlivros_categorias
    ADD CONSTRAINT pk_hlvc PRIMARY KEY ( hlvc_lvr_id,
                                         hlvc_cat_id,
                                         hlvc_dt_entrada );

CREATE TABLE hvendas (
    hven_id               NUMBER(6) NOT NULL,
    hven_data             DATE NOT NULL,
    hven_valor_final      NUMBER(8, 2) NOT NULL,
    hven_valor_icms_total NUMBER(8, 2) NOT NULL,
    hven_cpf_comprador    CHAR(11 CHAR),
    hven_cnpj_comprador   CHAR(14 CHAR),
    hven_dt_entrada       DATE NOT NULL
);

COMMENT ON COLUMN hvendas.hven_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN hvendas.hven_data IS
    'Esta coluna armazena a data das compras.';

COMMENT ON COLUMN hvendas.hven_valor_final IS
    'Esta coluna armazena o valor final das compras.';

COMMENT ON COLUMN hvendas.hven_valor_icms_total IS
    'Esta coluna armazena o valor total do ICMS da venda.';

COMMENT ON COLUMN hvendas.hven_cpf_comprador IS
    'Esta coluna armazena o CPF do comprador.';

COMMENT ON COLUMN hvendas.hven_cnpj_comprador IS
    '  Esta coluna armazena o CNPJ do comprador';

ALTER TABLE hvendas ADD CONSTRAINT pk_hven PRIMARY KEY ( hven_id,
                                                         hven_dt_entrada );

CREATE TABLE hvendas_livros (
    hvlv_lvr_id                  NUMBER NOT NULL,
    hvlv_id_ven                  NUMBER NOT NULL,
    hvlv_ven_valor_icms_unitario NUMBER(8, 2) NOT NULL,
    hvlv_dt_entrada              DATE NOT NULL
);

ALTER TABLE hvendas_livros
    ADD CONSTRAINT pk_vlv PRIMARY KEY ( hvlv_lvr_id,
                                        hvlv_id_ven,
                                        hvlv_dt_entrada );

CREATE TABLE livros (
    lvr_id          NUMBER(6) NOT NULL,
    lvr_preco_capa  NUMBER(8, 2) NOT NULL,
    lvr_preco_venda NUMBER(8, 2) NOT NULL,
    lvr_nome        VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN livros.lvr_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN livros.lvr_preco_capa IS
    'Esta coluna armazena o preço de capa do livro.';

COMMENT ON COLUMN livros.lvr_preco_venda IS
    'Esta coluna armazena o preço de venda';

COMMENT ON COLUMN livros.lvr_nome IS
    'Esta coluna armazena o nome dos livros.';

ALTER TABLE livros ADD CONSTRAINT livros_pk PRIMARY KEY ( lvr_id );

CREATE TABLE livros_autores (
    lau_lvr_id NUMBER(6) NOT NULL,
    lau_aut_id NUMBER(6) NOT NULL
);

COMMENT ON COLUMN livros_autores.lau_lvr_id IS
    'Esta coluna relaciona a tabela livros com a tabela autores';

COMMENT ON COLUMN livros_autores.lau_aut_id IS
    'Esta coluna relaciona a tabela livros  com a tabela autores';

ALTER TABLE livros_autores ADD CONSTRAINT relation_2_pk PRIMARY KEY ( lau_lvr_id,
                                                                      lau_aut_id );

CREATE TABLE livros_categorias (
    lvc_lvr_id NUMBER(6) NOT NULL,
    lvc_cat_id NUMBER(6) NOT NULL
);

ALTER TABLE livros_categorias ADD CONSTRAINT relation_1_pk PRIMARY KEY ( lvc_lvr_id,
                                                                         lvc_cat_id );

CREATE TABLE vendas (
    ven_id               NUMBER(6) NOT NULL,
    ven_data             DATE NOT NULL,
    ven_valor_final      NUMBER(8, 2) NOT NULL,
    ven_valor_icms_total NUMBER(8, 2) NOT NULL,
    ven_cpf_comprador    CHAR(11 CHAR),
    ven_cnpj_comprador   CHAR(14 CHAR),
    funcionarios_fun_id  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN vendas.ven_id IS
    'Esta coluna é a primary key da relação.';

COMMENT ON COLUMN vendas.ven_data IS
    'Esta coluna armazena a data das compras.';

COMMENT ON COLUMN vendas.ven_valor_final IS
    'Esta coluna armazena o valor final das compras.';

COMMENT ON COLUMN vendas.ven_valor_icms_total IS
    'Esta coluna armazena o valor total do ICMS da venda.';

COMMENT ON COLUMN vendas.ven_cpf_comprador IS
    'Esta coluna armazena o CPF do comprador.';

COMMENT ON COLUMN vendas.ven_cnpj_comprador IS
    '  Esta coluna armazena o CNPJ do comprador';

COMMENT ON COLUMN vendas.funcionarios_fun_id IS
    'Esta coluna é a foreign key da relação relacionada com Funcionarios..';

ALTER TABLE vendas ADD CONSTRAINT vendas_pk PRIMARY KEY ( ven_id );

CREATE TABLE vendas_livros (
    vlv_lvr_id                  NUMBER(6) NOT NULL,
    vlv_id_ven                  NUMBER(6) NOT NULL,
    vlv_ven_valor_icms_unitario NUMBER(8, 2) NOT NULL
);

ALTER TABLE vendas_livros ADD CONSTRAINT relation_6_pk PRIMARY KEY ( vlv_lvr_id,
                                                                     vlv_id_ven );

ALTER TABLE livros_categorias
    ADD CONSTRAINT relation_1_categorias_fk FOREIGN KEY ( lvc_cat_id )
        REFERENCES categorias ( cat_id );

ALTER TABLE livros_categorias
    ADD CONSTRAINT relation_1_livros_fk FOREIGN KEY ( lvc_lvr_id )
        REFERENCES livros ( lvr_id );

ALTER TABLE livros_autores
    ADD CONSTRAINT relation_2_autores_fk FOREIGN KEY ( lau_aut_id )
        REFERENCES autores ( aut_id );

ALTER TABLE livros_autores
    ADD CONSTRAINT relation_2_livros_fk FOREIGN KEY ( lau_lvr_id )
        REFERENCES livros ( lvr_id );

ALTER TABLE vendas_livros
    ADD CONSTRAINT relation_6_livros_fk FOREIGN KEY ( vlv_lvr_id )
        REFERENCES livros ( lvr_id );

ALTER TABLE vendas_livros
    ADD CONSTRAINT relation_6_vendas_fk FOREIGN KEY ( vlv_id_ven )
        REFERENCES vendas ( ven_id );

ALTER TABLE vendas
    ADD CONSTRAINT vendas_funcionarios_fk FOREIGN KEY ( funcionarios_fun_id )
        REFERENCES funcionarios ( fun_id );

CREATE SEQUENCE seq_aut START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tg_seq_aut BEFORE
    INSERT ON autores
    FOR EACH ROW
    WHEN ( new.aut_id IS NULL )
BEGIN
    :new.aut_id := seq_aut.nextval;
END;
/

CREATE SEQUENCE seq_cat START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tg_seq_cat BEFORE
    INSERT ON categorias
    FOR EACH ROW
    WHEN ( new.cat_id IS NULL )
BEGIN
    :new.cat_id := seq_cat.nextval;
END;
/

CREATE SEQUENCE seq_fun START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tg_seq_fun BEFORE
    INSERT ON funcionarios
    FOR EACH ROW
    WHEN ( new.fun_id IS NULL )
BEGIN
    :new.fun_id := seq_fun.nextval;
END;
/

CREATE OR REPLACE TRIGGER tg_seq_aut BEFORE
    INSERT ON hautores
    FOR EACH ROW
    WHEN ( new.haut_id IS NULL )
BEGIN
    :new.haut_id := seq_aut.nextval;
END;
/

CREATE OR REPLACE TRIGGER tg_seq_cat BEFORE
    INSERT ON hcategorias
    FOR EACH ROW
    WHEN ( new.hcat_id IS NULL )
BEGIN
    :new.hcat_id := seq_cat.nextval;
END;
/

CREATE OR REPLACE TRIGGER tg_seq_fun BEFORE
    INSERT ON hfuncionarios
    FOR EACH ROW
    WHEN ( new.hfun_id IS NULL )
BEGIN
    :new.hfun_id := seq_fun.nextval;
END;
/

CREATE SEQUENCE seq_lvr START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tg_seq_lvr BEFORE
    INSERT ON hlivros
    FOR EACH ROW
    WHEN ( new.hlvr_id IS NULL )
BEGIN
    :new.hlvr_id := seq_lvr.nextval;
END;
/

CREATE SEQUENCE seq_ven START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tg_seq_ven BEFORE
    INSERT ON hvendas
    FOR EACH ROW
    WHEN ( new.hven_id IS NULL )
BEGIN
    :new.hven_id := seq_ven.nextval;
END;
/

CREATE OR REPLACE TRIGGER tg_seq_lvr BEFORE
    INSERT ON livros
    FOR EACH ROW
    WHEN ( new.lvr_id IS NULL )
BEGIN
    :new.lvr_id := seq_lvr.nextval;
END;
/

CREATE OR REPLACE TRIGGER tg_seq_ven BEFORE
    INSERT ON vendas
    FOR EACH ROW
    WHEN ( new.ven_id IS NULL )
BEGIN
    :new.ven_id := seq_ven.nextval;
END;
/

create trigger tg_hist_funcionarios
before insert or update on funcionarios
for each row
begin
	insert into hfuncionarios values (:old.fun_id,:old.fun_nome,:old.fun_cargo,:old.fun_matricula, sysdate);
end;
/


create trigger tg_hist_vendas
before insert or update on vendas
for each row
begin
	insert into hvendas values (:old.ven_id, ven_date, :old.ven_valor_final, :old.ven_valor_icms_total, :old.ven_cpf_comprador, :old.ven_cnpj_comprador, sysdate);
end;
/

-- Create History Triggers (Temporal)

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