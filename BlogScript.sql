BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ROLE" (
	"Id_rol"	INT,
	"role"	VARCHAR(50),
	PRIMARY KEY("Id_rol")
);
CREATE TABLE IF NOT EXISTS "USER" (
	"Id_user"	INT,
	"first_name"	VARCHAR(50),
	"last_name"	VARCHAR(50),
	"email"	VARCHAR(100),
	"mdp"	VARCHAR(50),
	"Id_rol"	INT NOT NULL,
	PRIMARY KEY("Id_user"),
	FOREIGN KEY("Id_rol") REFERENCES "ROLE"("Id_rol") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "CATEGORY" (
	"Id_cat"	INT,
	"name_cat"	VARCHAR(50),
	"id_SubCat"	INT,
	PRIMARY KEY("Id_cat"),
	FOREIGN KEY("id_SubCat") REFERENCES "CATEGORY"("Id_cat") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "ARTICLE" (
	"Id_art"	INT,
	"title"	VARCHAR(100),
	"publishedAT"	DATE,
	"updatedAT"	DATE,
	"summary"	TEXT,
	"Id_cat"	INT,
	"Id_user"	INT,
	PRIMARY KEY("Id_art"),
	FOREIGN KEY("Id_user") REFERENCES "USER"("Id_user"),
	FOREIGN KEY("Id_cat") REFERENCES "CATEGORY"("Id_cat") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "COMMENTS" (
	"Id_com"	INT,
	"content"	TEXT,
	"createdAT"	DATE,
	"updatedAT"	DATE,
	"Id_art"	INT,
	"Id_user"	INT,
	PRIMARY KEY("Id_com"),
	FOREIGN KEY("Id_art") REFERENCES "ARTICLE"("Id_art") ON DELETE CASCADE,
	FOREIGN KEY("Id_user") REFERENCES "USER"("Id_user")
);
INSERT INTO "ROLE" ("Id_rol","role") VALUES (1,'Administrator'),
 (2,'User'),
 (3,'User'),
 (4,'User'),
 (5,'User');
INSERT INTO "USER" ("Id_user","first_name","last_name","email","mdp","Id_rol") VALUES (1,'ex1','tst1','test1@example.com','password123',1),
 (2,'ex2','tst2','test2@example.com','password123',2),
 (3,'ex3','tst3','test3@example.com','password123',3),
 (4,'ex4','tst4','test4@example.com','password123',4),
 (5,'ex5','tst5','test5@example.com','password123',5);
INSERT INTO "CATEGORY" ("Id_cat","name_cat","id_SubCat") VALUES (1,'Technology',NULL),
 (2,'Science',NULL),
 (3,'Programming',1),
 (4,'Health',NULL),
 (5,'Business',NULL),
 (6,'Sport',NULL),
 (7,'Football',6),
 (8,'Basketball',6);
INSERT INTO "ARTICLE" ("Id_art","title","publishedAT","updatedAT","summary","Id_cat","Id_user") VALUES (1,'Introduction to SQL','2024-04-01','2024-04-05','Summary1',3,1),
 (2,' Programming Basics','2024-03-15','2024-03-20','Summary2',3,1),
 (3,'Technology','2024-05-01','2024-05-02','Summary3',1,1),
 (4,'Health ','2024-04-10','2024-04-15','Summary4',4,1),
 (5,'Marketing','2024-03-20','2024-03-25','Summary5',5,1),
 (6,'World Cup','2024-03-20','2024-03-25','Summary6',7,1);
INSERT INTO "COMMENTS" ("Id_com","content","createdAT","updatedAT","Id_art","Id_user") VALUES (1,'Great article!','2024-04-02','2024-04-02',1,3),
 (2,'Great article!.','2024-04-03','2024-04-03',2,4),
 (3,'Great article!','2024-05-01','2024-05-01',3,2),
 (4,'Great article!','2024-04-12','2024-04-12',4,4),
 (5,'Great article!','2024-03-22','2024-03-22',5,5);
COMMIT;
