CREATE DATABASE vendas;
USE vendas;
drop database vendas;
CREATE TABLE tb_loja(
	id_loja char(10) not null,
    cidade varchar(20),
    estado varchar(10),
    primary key(id_loja)
);

select*from tb_loja;
alter table tb_loja modify column estado varchar (20);
CREATE TABLE tb_produto(
	id_produto char(50) not null,
    nome_produto varchar(50),
    categoria varchar(50),
    segmento varchar(50),
    marca varchar(50),
    primary key(id_produto) 
);

select * from tb_vendedor;

CREATE TABLE tb_vendedor(
	id_vendedor char(10) not null,
    nome varchar(20),
    primary key(id_vendedor) 
);

CREATE TABLE tb_data(
	data_completa varchar(20),
    primary key (data_completa)
);
drop table tb_data;
CREATE TABLE tb_vendas(
    id_produto varchar(50),
    id_loja varchar(50),
    id_vendedor varchar(50),
    data_completa varchar(50),
    valor_venda double,
    foreign key(id_produto) references tb_produto(id_produto),
    foreign key(id_loja) references tb_loja(id_loja),
    foreign key(id_vendedor) references tb_vendedor(id_vendedor),
    foreign key(data_completa) references tb_data(data_completa)
);
drop table tb_vendas;
truncate tb_vendas;
SET FOREIGN_KEY_CHECKS = 0;
alter table tb_data modify column data_completa varchar(20) collate utf8_general_ci not null;
alter table tb_vendas modify column id_produto varchar(50);

select * from tb_vendas;

insert into tb_data values('04/10/2012'),
('01/01/2012'),
('02/02/2012'),
('03/03/2012'),
('04/04/2012'),
('04/05/2012'),
('04/06/2012'),
('04/07/2012'),
('04/08/2012'),
('04/09/2012'),
('04/11/2012'),
('04/12/2012'),
('02/01/2013'),
('02/02/2013'),
('02/03/2013'),
('02/04/2013'),
('02/05/2013'),
('02/06/2013'),
('02/07/2013'),
('02/08/2013'),
('02/09/2013'),
('02/10/2013'),
('02/11/2013'),
('02/12/2013'),
('01/02/2012'),
('01/03/2012'),
('01/04/2012'),
('01/05/2012'),
('01/06/2012'),
('01/07/2012'),
('01/08/2012'),
('01/09/2012'),
('01/10/2012'),
('01/11/2012'),
('01/12/2012'),
('09/01/2013'),
('10/01/2013'),
('11/02/2013'),
('12/03/2013'),
('13/03/2013'),
('14/03/2013'),
('15/04/2013'),
('16/04/2013'),
('17/05/2013'),
('18/05/2013'),
('19/05/2013'),
('20/06/2013'),
('21/07/2013'),
('22/07/2013'),
('23/09/2013'),
('24/10/2013'),
('25/11/2013'),
('26/11/2013'),
('27/11/2013'),
('04/10/2014'),
('01/01/2014'),
('02/02/2014'),
('03/03/2014'),
('04/04/2014'),
('04/05/2014'),
('04/06/2014'),
('04/07/2014'),
('04/08/2014'),
('04/09/2014'),
('04/11/2014'),
('04/12/2014'),
('02/01/2015'),
('02/02/2015'),
('02/03/2015'),
('02/04/2015'),
('02/05/2015'),
('02/06/2015'),
('02/07/2015'),
('02/08/2015'),
('02/09/2015'),
('02/10/2015'),
('02/11/2015'),
('02/12/2015'),
('01/02/2014'),
('01/03/2014'),
('01/04/2014'),
('01/05/2014'),
('01/06/2014'),
('01/07/2014'),
('01/08/2014'),
('01/09/2014'),
('01/10/2014'),
('01/11/2014'),
('01/12/2014'),
('09/01/2015'),
('10/01/2015'),
('11/02/2015'),
('12/03/2015'),
('13/03/2015'),
('14/03/2015'),
('15/04/2015'),
('16/04/2015'),
('17/05/2015'),
('18/05/2015'),
('19/05/2015'),
('20/06/2015'),
('21/07/2015'),
('22/07/2015'),
('23/09/2015'),
('24/10/2015'),
('25/11/2015'),
('26/11/2015'),
('27/11/2015')
;