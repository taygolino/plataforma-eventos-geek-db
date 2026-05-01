CREATE TABLE Usuario (
	cpf VARCHAR(14) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	telefone VARCHAR(15),
	endereco VARCHAR(100)
);

CREATE TABLE Visitante (
	cpf VARCHAR(14) PRIMARY KEY,
	interesses VARCHAR(100),
	FOREIGN KEY(cpf) REFERENCES Usuario(cpf)

);

CREATE TABLE Organizador (
	cpf VARCHAR(14) PRIMARY KEY,
	cargo VARCHAR(50),
	nivelAcesso INT NOT NULL,
	FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);

CREATE TABLE Palestrante (
	cpf VARCHAR(14) PRIMARY KEY,
	formacao VARCHAR(50) NOT NULL,
	redeSocial VARCHAR(100),
	temaPrincipal VARCHAR(100),
	FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);

CREATE TABLE Cosplayer (
	cpf VARCHAR(14) PRIMARY KEY,
	cosplaysFeitos VARCHAR(100),
	FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);


CREATE TABLE Evento (
	idEvento INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	data DATE,
	local VARCHAR(100),
	capacidade INT
);

CREATE TABLE Jogo (
	idJogo INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	plataforma VARCHAR(100)
);

CREATE TABLE Atividade (
	idAtividade INT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(20) NOT NULL,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	descricao VARCHAR(100),
	idEvento INT NOT NULL,
	idJogo INT,
	FOREIGN KEY(idEvento) REFERENCES Evento(idEvento),
	FOREIGN KEY(idJogo) REFERENCES Jogo(idJogo)
);

CREATE TABLE Ingresso (
	idIngresso INT AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(20),
	dataEmissao DATE NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	cpfUsuario VARCHAR(14),
	idEvento INT,
	FOREIGN KEY(cpfUsuario) REFERENCES Usuario(cpf),
	FOREIGN KEY(idEvento) REFERENCES Evento(idEvento)
);

CREATE TABLE Participacao (
	idParticipacao INT AUTO_INCREMENT PRIMARY KEY,
	status VARCHAR(20) NOT NULL,
	pontuacao INT,
	dataParticipacao DATE,
	cpfUsuario VARCHAR(14),
	idAtividade INT,
	FOREIGN KEY(cpfUsuario) REFERENCES Usuario(cpf),
	FOREIGN KEY(idAtividade) REFERENCES Atividade(idAtividade)
);

INSERT INTO Usuario VALUES (
	'123.456.789-10',
	'Dusky',
	'email_qualquer@email.com',
	'(099)99999-9990',
	'Rua X, número Y - Bairro z'
	);

INSERT INTO Evento (nome, plataforma) VALUES (
	'League of Legends',
	'PC'
	);

INSERT INTO Jogo (nome, data, local, capacidade) VALUES (
	'Geek Fest',
	'2026-06-01',
	'Rio de Janeiro',
	500
	);

INSERT INTO Atividade (tipo, data, hora, descricao, idEvento, idJogo) VALUES (
	'Campeonato',
	'2026-06-01',
	'14:00:00',
	'Torneio de LoL',
	1,
	1
	);
