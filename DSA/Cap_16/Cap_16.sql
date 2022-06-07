CREATE DATABASE RH;
USE RH;

CREATE TABLE TB_FUNC(
	id int not null,
    estado_civil varchar(15),
    grau_instrucao varchar(30),
    numero_filhos varchar(2),
    salario_hora double,
    idade int,
    reg_procedencia varchar(15),
    primary key (id)
);

select * from TB_FUNC order by id ASC;

-- LIMITANDO RETORNOS
SELECT * FROM TB_FUNC LIMIT 5;

-- RETORNANDO SEM DUPLICIDADE
SELECT DISTINCT * FROM TB_FUNC; 
SELECT DISTINCT numero_filhos FROM TB_FUNC;

-- RETORNANDO COM FILTROS
SELECT * FROM TB_FUNC WHERE numero_filhos = 2;
SELECT * FROM TB_FUNC WHERE idade > 30;
SELECT * FROM TB_FUNC WHERE idade <= 30;

-- RETORNANDO LINHAS
SELECT COUNT(*) FROM TB_FUNC;

-- RETORNANDO QUANTIDADE DE FUNCIONARIOS IDADE DIFERENTE DE 40 ANOS
SELECT COUNT(*) FROM TB_FUNC WHERE IDADE != 40;

-- OPERADORES LÓGICOS 'E', 'OU'
SELECT * FROM TB_FUNC WHERE idade < 30 AND estado_civil = 'casado';
SELECT * FROM TB_FUNC WHERE idade < 30 OR estado_civil = 'viuvo';

-- OPERADOR BETWEEN 'INCLUSIVE E ENTRE'
SELECT * FROM TB_FUNC WHERE idade BETWEEN 30 AND 35;

-- RETORNANDO VALOR NÃO EXATO
SELECT * FROM TB_FUNC WHERE grau_instrucao LIKE '%medio'; -- TERMINEM COM MEDIO
SELECT * FROM TB_FUNC WHERE grau_instrucao LIKE 'medio%'; -- COMECEM COM MEDIO
SELECT * FROM TB_FUNC WHERE grau_instrucao LIKE '%medio%'; -- TUDO QUE CONTENHA MEDIO

-- RETORNANDO VALOR DENTRO DO CONJUNTO
SELECT * FROM TB_FUNC WHERE idade IN (30, 40, 50);

-- RETORNANDO VALORES NULOS OU NÃO NULOS
SELECT * FROM TB_FUNC WHERE numero_filhos IS NULL;
SELECT * FROM TB_FUNC WHERE numero_filhos IS NOT NULL;

-- UPDATE
UPDATE TB_FUNC 
SET numero_filhos = NULL 
WHERE numero_filhos = 'NA';
COMMIT; -- SALVAR NO BANCO

-- SAFE UPDATES = 0
SET SQL_SAFE_UPDATES = 0;

-- APAGAR DADOS DA TABELA TODA
TRUNCATE TABLE TB_FUNC;

-- APAGAR RESGISTROS
DELETE FROM TB_FUNC WHERE numero_filhos = 'NA';
COMMIT;

-- ORDER BY
SELECT * FROM TB_FUNC ORDER BY salario_hora DESC;

-- MIN, MAX, AVG, COUNT, SUM
SELECT MIN(salario_hora), MAX(salario_hora), AVG(salario_hora), COUNT(*), SUM(salario_hora) FROM TB_FUNC;

-- GOUP BY
SELECT ROUND(AVG(salario_hora)), reg_procedencia 
FROM TB_FUNC
GROUP BY (reg_procedencia);

-- ex1
SELECT ROUND(AVG(idade)), numero_filhos, grau_instrucao
FROM TB_FUNC
WHERE reg_procedencia = 'capital' 
	AND estado_civil = 'casado'
	AND salario_hora > (SELECT AVG(salario_hora) FROM TB_FUNC) -- subquery
GROUP BY numero_filhos, grau_instrucao
ORDER BY ROUND(AVG(idade)) DESC;

-- ex2
SELECT * FROM TB_FUNC
WHERE numero_filhos = '2';

CREATE TABLE TB_ENDERECO
(
    id_end integer NOT NULL,
    rua varchar(30),
    numero varchar(30),
    bairro varchar(30),
    cep varchar(10),
    estado varchar(30),
    pais varchar(30),
    id_func integer,
    PRIMARY KEY (id_end)
);

INSERT INTO TB_ENDERECO(
	id_end, rua, numero, bairro, cep, estado, pais, id_func)
	VALUES (1001, 'Jaguar', 40, 'Tijuca', '24239-900', 'Rio de Janeiro', 'Brasil', 2);
	
INSERT INTO TB_ENDERECO(
	id_end, rua, numero, bairro, cep, estado, pais, id_func)
	VALUES (1002, 'Mercedes Benz', 140, 'Centro', '12098-900', 'Minas Gerais', 'Brasil', 6);

INSERT INTO TB_ENDERECO(
	id_end, rua, numero, bairro, cep, estado, pais, id_func)
	VALUES (1003, 'BMW', 20, 'Tijuca', '23232-900', 'Rio de Janeiro', 'Brasil', 3);
	
INSERT INTO TB_ENDERECO(
	id_end, rua, numero, bairro, cep, estado, pais, id_func)
	VALUES (1004, 'Ferrari', 32, 'Centro', '99872-900', 'Minas Gerais', 'Brasil', 11);

INSERT INTO TB_ENDERECO(
	id_end, rua, numero, bairro, cep, estado, pais, id_func)
	VALUES (1005, 'McLaren', 45, 'Centro', '43982-900', 'Minas Gerais', 'Brasil', 17);

SELECT ROUND(AVG(salario_hora)), estado
FROM TB_FUNC AS f
INNER JOIN TB_ENDERECO  AS e
WHERE f.id = e.id_func
GROUP BY estado;