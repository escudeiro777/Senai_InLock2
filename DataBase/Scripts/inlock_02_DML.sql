USE inlock_games_tarde;
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

