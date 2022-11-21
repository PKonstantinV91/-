CREATE TABLE IF NOT EXISTS Musical_genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);


CREATE TABLE IF NOT EXISTS Performers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);


CREATE TABLE IF NOT EXISTS GenresPerformers (
	genres_id INTEGER NOT NULL REFERENCES Musical_genres(id),
	performers_id INTEGER NOT NULL REFERENCES Performers(id),
	CONSTRAINT gp PRIMARY KEY (genres_id, performers_id)
);


CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_issue DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS PerformersAlbums (
	performers_id INTEGER NOT NULL REFERENCES Performers(id),
	albums_id INTEGER NOT NULL REFERENCES Albums(id),
	CONSTRAINT pa PRIMARY KEY (performers_id, albums_id)
);


CREATE TABLE IF NOT EXISTS Trecks (
	id SERIAL PRIMARY KEY,
	albums_id INTEGER NOT NULL REFERENCES Albums(id),
	title VARCHAR(60) NOT NULL,
	duration TIME NOT NULL
);


CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_issue DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS CompilationTreck (
	id SERIAL PRIMARY KEY,
	compilation_id INTEGER NOT NULL REFERENCES Compilation(id),
	trecks_id INTEGER NOT NULL REFERENCES Trecks(id),
	solution TEXT NOT NULL
);
