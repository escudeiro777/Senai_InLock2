CREATE DATABASE inlock_games_tarde;
GO

USE inlock_games_tarde;
GO

--DDL

CREATE TABLE estudios(
idEstudio SMALLINT PRIMARY KEY IDENTITY (1,1),
nomeEstudio VARCHAR (100) NOT NULL
);
GO

CREATE TABLE jogos(
idJogo INT PRIMARY KEY IDENTITY (1,1),
nomeJogo VARCHAR (100) NOT NULL,
descricao VARCHAR (256),
dataLancamento DATE,
valor DECIMAL,
idEstudio SMALLINT FOREIGN KEY REFERENCES estudios (idEstudio)
);
GO

CREATE TABLE tipoUsuarios(
idTipoUsuario INT PRIMARY KEY IDENTITY (1,1),
titulo VARCHAR (15)
);
GO

CREATE TABLE usuarios (
idUsuario INT PRIMARY KEY IDENTITY (1,1),
email VARCHAR (256),
senha VARCHAR (25),
idTipoUsuario INT FOREIGN KEY REFERENCES tipoUsuarios (idTipoUsuario)
);
GO

--DML

INSERT INTO estudios (nomeEstudio)
VALUES ('Blizzard'),('Rockstar Studios'), ('Square Enix');
GO

INSERT INTO jogos (nomeJogo, dataLancamento, descricao,idEstudio, valor)
VALUES 
('Diablo 3', '15/05/2012', '� um jogo que cont�m bastante a��o e � viciante, seja voc� um novato ou um f�.', 1, '99'),

('Red Dead Redemption II', '26/10/2018','Jogo eletr�nico de a��o-aventura western.',2,'120');
GO

INSERT INTO tipoUsuarios (titulo)
VALUES ('ADM'),('CLIENTE');
GO

INSERT INTO usuarios (email, senha, idTipoUsuario)
VALUES ('admin@admin.com', 'admin', 1),('cliente@cliente.com', 'cliente', 2)

--DQL

--Listar todos os est�dios;
SELECT * FROM estudios;
GO
--Listar todos os tipos de usu�rios
SELECT * FROM tipoUsuarios;
GO
--Listar todos os usu�rios;
SELECT * FROM usuarios;
GO
--Listar todos os jogos;
SELECT * FROM jogos;
GO
--Listar todos os jogos e seus respectivos est�dios;
SELECT nomeJogo AS 'JOGO',nomeEstudio AS 'ESTUDIO' FROM jogos
INNER JOIN estudios
ON jogos.idEstudio = estudios.IdEstudio

--Buscar e trazer na lista todos os est�dios com os respectivos jogos.
SELECT nomeEstudio AS 'ESTUDIO', nomeJogo AS 'JOGO' FROM estudios
LEFT JOIN jogos
ON  estudios.idEstudio = jogos.idEstudio

--Buscar um usu�rio por e-mail e senha (login);
SELECT email, senha FROM usuarios
WHERE email = 'admin@admin.com'
AND senha = 'admin'

--Buscar um jogo por idJogo;
SELECT nomeJogo FROM jogos
WHERE idJogo = 2

--Buscar um est�dio por idEstudio;
SELECT nomeEstudio FROM estudios
WHERE idEstudio = 2