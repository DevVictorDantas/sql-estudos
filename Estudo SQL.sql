/* Modelagem Básica - 

ENTIDADE=TABELA
CAMPOS = ATRIBUTOS */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM  */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE EXEMPLO

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

USE EXEMPLO;
SHOW TABLES;

USE PROJETO;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

-----

/*Tipos de dados */

Todos os bancos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela.
Para caracteres literais, temos char e varchar, para números temos int e float, para
objetos como fotos e documentos, temos o blob, para textos extensos, temos o text. 
A disciplina de banco de dados é tão fantástica que ao entendermos o porque das coisas,
podemos iniciar já em modo avançado e um bom exemplo disso são os tipos. Há uma profissão
dentro da área que é a do analista de performance ou tuning, esse profissional é responsável
por analisar o banco de dados e deixá-lo mais rápido. Parece algo avançado, e é! Porém,
com alguas atitudes simples, podemos deixar o banco sem a necessidade de atuação desse profissional.

Cada caracter no banco de dados, vale 1 byte. Sendo assim, se eu entro com o dado JOÃO,
estou entrando com 4 bytes no meu banco. E o que isso tem a ver com a tiagem de tabelas?

O banco de dados funciona como um download de dados da internet. Se baixamos um arquivo de 1 giga,
temos um temo maior que o download de 50 megas, considerando a mesma velocidade de conexão.

Ao tiparmos uma tabela de modo errado ou displicente, vamos aumentar a quantidade de dados que 
será baixada do banco de dados, prolongando assim o tempo de resposta.

Uma comparacao bem didatica é o tipo char e varchar
A palavra var, vem de variant, em ingles, ou seja, que é dinâmica. Logo, vimos que 1 caracter
é igual a 1 byte. Vejamos então a tipagem

varchar(10)
char(10)

entrando a palavra joao

total de bytes varchar(10) = 4 bytes
toal de bytes char(10) = 10 bytes

isso ocorre pois o char não varia. Os caracteres restantes serao preenchidos com espaço. 
eles nao ficam vazios. Enquanto que no varchar, o tipo varia conforme o dado.
Entao utilizo sempre o varchar? Não. O char é ligeiramente mais performatico, por nao
ter que gastar tempo variando de tamanho. Entao a regra é utilizar sempre o char quando
sabemos que o numero de caracteres naquela coluna nao vai variar nunca. Por exemplo,
unidade federativa, com dois digitos, sexo com um digito e assim por diante. Vista a diferença
que podemos fazer com uma tipagem correta de tabelas, na próxima aula detalharemos os tipos do mysql
e nos modulos específicos de cada banco, você entenderá os tipos correspondentes no sql server
e no oracle, que mudam muito pouco.

/*  Inserindo dados e valores nulos */

use projeto;

/* Mostrando as tabelas */
show tables

/* exibindo a estrutura de uma tabela */
desc cliente;

/* sintaxe basica de inserção - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES ('LILIAN', 'F', 'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 87774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES ('ANA', 'F', 'ANA@GLOBO.COM', 85548968, '548556985', 'PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
('CARLA', 'F', 'CARLA@TERATI.COM.BR', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/* O COMANDO SELECT
selecao projecao e juncao
*/

SELECT NOW() as DATA_HORA, 'VICTOR DANTAS' AS ALUNO;

SELECT 'VICTOR DANTAS';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT  EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

SELECT  EMAIL, SEXO, ENDERECO, NOMEn NOW() AS DATA_HORA FROM CLIENTE;


/* APENAS PARA FINS ACADEMICOS */

SELECT * FROM CLIENTE;

/* TABELA ERRADA - NAO DIGITE DIRETAMENTE NO BANCO */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),
);


SELECT * FROM CLIENTE;

/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

/* RESOLUÇÃO DA ATIVIDADE */

create database livraria;
use livraria;
create table livros (
	nome_livro varchar(20),
	nome_autor varchar(30),
	sexo_autor char(8),
	num_pag int(3),
	nome_edit varchar(30),
	valor_livro float(5,2),
	uf_edit char(2),
	ano_pub char(4)
);

alter table livros modify sexo_autor char(9);

desc livros;

select * from livros;
insert into livros values ('Cavaleiro Real', 'Ana Claudia', 'Feminino', 465, 'Atlas', 49.9, 'RJ', '2009');
insert into livros values ('SQL para leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP', '2018'),
('Receitas Caseiras', 'Célia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ', '2008'),
('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ', '2018'),
('Habitos Saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ', '2019'),
('A Casa Marrom', 'Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG', '2016'),
('Estacio Querido', 'Geraldo Francisco', 'Masculino', 310, 'Insignia', 100, 'ES', '2015'),
('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insignia', 78.98, 'ES', '2011'),
('Copas Inesqueciveis', 'Marco Alcantara', 'Masculino', 200, 'Larson', 130.98, 'RS', '2018'),
('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'SP', '2017');

/* trazer todos os dados*/
select * from livros;

/* trazer o nome do livro e o noma da editora*/
select nome_livro, nome_edit from livros;

/* trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino*/

select nome_livro, uf_edit from livros where sexo_autor = 'Masculino';

/* trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino*/

select nome_livro, num_pag  from livros where sexo_autor = 'Feminino';

/*Trazer os valores dos livros das editoras de São Paulo*/

select valor_livro from livros where uf_edit = 'SP';

/*Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio)*/

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'SP'
OR UF = 'RJ';

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE 
(SEXO = 'M' AND UF = 'SP') OR UF = 'RJ';

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'SP'
AND paginas > 100;

/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/

/* OR - OU */

SHOW DATABASES;

USE PROJETO;

SELECT * FROM CLIENTE;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE
SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E */

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES
LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABLE */

SELECT COUNT(*) AS 'QUANTIDADE DE REGISTROS' FROM CLIENTE;


/* OPERADOR GROUP BY */

SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE;

/* PERFORMANCE EM OPERADORES LÓGICOS */

/* 1 MILHÃO DE REGISTROS

PARA CONTAR 
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU / OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE CIDADE = 'RJ' AND SEXO = 'F';


/* exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21	Filmes 53 roupas
-- como estamos trabalhando com OR e a segunda condição é opcional
--colocamos na primeira condição tem mais chances de uma saída 
--verdadeira, pois a segunda condição não será checada nesse caso.

select count(*), departamento 
from funcionarios f 
group by departamento 
order by 1;


select nome, departamento  
from funcionarios 
where departamento = 'roupas' 
or departamento = 'filmes';

--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *

--491	Feminino  |  52	Lar  |  21	Filmes

select count(*), sexo from funcionarios f group by sexo; 

select count(*), departamento  from funcionarios f group by departamento;

select nome, sexo, departamento  from funcionarios where (departamento = 'lar' and sexo = 'Feminino') or (departamento = 'filmes' and sexo = 'Feminino'); 

--Como estamos trabalhando com AND, colocamos
--o departamento primeiro, pois ele irá checar a
--segunda condicao um numero menor de vezez.

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

select count(*), sexo from funcionarios f group by sexo ; 
select nome, sexo, departamento from funcionarios f where sexo = 'M' or departamento = 'Jardim';

/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL = NULL;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NULL;


SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NOT NULL;

/* IS OU IS NOT NULL */

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL FROM CLIENTE;

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA PRA VIDA INTEIRA */

SELECT * FROM CLIENTE WHERE NOME = 'LILIAN';

UPDATE CLIENTE SET EMAIL = 'JOAO@IG.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL FROM CLIENTE;

UPDATE CLIENTE SET EMAIL = 'JORGE@IG.COM.BR'
WHERE NOME = 'JORGE';

/* COMMIT E ROLLBACK */

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

-- TOTAL 6

DELETE FROM CLIENTE;

