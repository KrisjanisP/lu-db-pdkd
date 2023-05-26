USE pdkd;


IF EXISTS (
    SELECT *
    FROM sys.foreign_keys
    WHERE name = 'FK_uznemums_direktors'
)
ALTER TABLE uznemums DROP CONSTRAINT FK_uznemums_direktors;


IF EXISTS (
    SELECT *
    FROM sys.foreign_keys
    WHERE name = 'FK_darbinieks_darbavieta'
)
ALTER TABLE darbinieks DROP CONSTRAINT FK_darbinieks_darbavieta;


IF OBJECT_ID('dbo.darbinieks', 'U') IS NOT NULL DROP TABLE darbinieks;


IF OBJECT_ID('dbo.uznemums', 'U') IS NOT NULL DROP TABLE uznemums;


CREATE TABLE uznemums (
    ID INT PRIMARY KEY,
    nosaukums NVARCHAR(255),
    direktors INT NULL
);


CREATE TABLE darbinieks (
    ID INT PRIMARY KEY,
    vards NVARCHAR(255),
    uzvards NVARCHAR(255),
    vecums INT,
    darbavieta INT NULL
);


ALTER TABLE uznemums
ADD CONSTRAINT FK_uznemums_direktors FOREIGN KEY (direktors) REFERENCES darbinieks(ID);


ALTER TABLE darbinieks
ADD CONSTRAINT FK_darbinieks_darbavieta FOREIGN KEY (darbavieta) REFERENCES uznemums(ID);


INSERT INTO uznemums (ID, nosaukums, direktors)
VALUES (1, 'Latvijas Dzelzceļš', NULL),
    (2, 'Latvenergo', NULL),
    (3, 'Mikrotīkls', NULL),
    (4, 'Air Baltic', NULL),
    (5, 'Rimi Baltic', NULL);


INSERT INTO darbinieks (ID, vards, uzvards, vecums, darbavieta)
VALUES (1, 'Jānis', 'Berzins', 45, NULL),
    (2, 'Anna', 'Kalnina', 32, NULL),
    (3, 'Peteris', 'Ozols', 40, NULL),
    (4, 'Linda', 'Liepa', 35, NULL),
    (5, 'Juris', 'Jansons', 38, NULL),
    (6, 'Kristine', 'Krumina', 42, NULL),
    (7, 'Mārtiņš', 'Vītols', 50, NULL),
    (8, 'Inese', 'Priede', 33, NULL),
    (9, 'Ilze', 'Ozola', 40, NULL),
    (10, 'Edgars', 'Zariņš', 36, NULL),
    (11, 'Laura', 'Kalniņa', 30, NULL),
    (12, 'Kristaps', 'Zvaigzne', 41, NULL),
    (13, 'Eva', 'Kaleja', 38, NULL),
    (14, 'Viktors', 'Liepiņš', 47, NULL),
    (15, 'Agnese', 'Priede', 45, NULL),
    (16, 'Aivars', 'Birznieks', 43, NULL),
    (17, 'Sandra', 'Kaleja', 31, NULL),
    (18, 'Raitis', 'Zariņš', 39, NULL),
    (19, 'Ieva', 'Kalnina', 28, NULL),
    (20, 'Gatis', 'Liepiņš', 35, NULL);

MERGE INTO uznemums AS target
USING (VALUES
    (1, 'Latvijas Dzelzceļš', 1),
    (2, 'Latvenergo', 5),
    (3, 'Mikrotīkls', 9),
    (4, 'Air Baltic', 13),
    (5, 'Rimi Baltic', 17)
) AS source (ID, nosaukums, direktors)
ON target.ID = source.ID
WHEN MATCHED THEN UPDATE SET direktors = source.direktors;

MERGE INTO darbinieks AS target
USING (VALUES
    (1, 'Jānis', 'Berzins', 45, 1),
    (2, 'Anna', 'Kalnina', 32, 1),
    (3, 'Peteris', 'Ozols', 40, 1),
    (4, 'Linda', 'Liepa', 35, 1),
    (5, 'Juris', 'Jansons', 38, 2),
    (6, 'Kristine', 'Krumina', 42, 2),
    (7, 'Mārtiņš', 'Vītols', 50, 2),
    (8, 'Inese', 'Priede', 33, 2),
    (9, 'Ilze', 'Ozola', 40, 3),
    (10, 'Edgars', 'Zariņš', 36, 3),
    (11, 'Laura', 'Kalniņa', 30, 3),
    (12, 'Kristaps', 'Zvaigzne', 41, 3),
    (13, 'Eva', 'Kaleja', 38, 4),
    (14, 'Viktors', 'Liepiņš', 47, 4),
    (15, 'Agnese', 'Priede', 45, 4),
    (16, 'Aivars', 'Birznieks', 43, 4),
    (17, 'Sandra', 'Kaleja', 31, 5),
    (18, 'Raitis', 'Zariņš', 39, 5),
    (19, 'Ieva', 'Kalnina', 28, 5),
    (20, 'Gatis', 'Liepiņš', 35, 5)
) AS source (ID, vards, uzvards, vecums, darbavieta)
ON target.ID = source.ID
WHEN MATCHED THEN UPDATE SET darbavieta = source.darbavieta;

IF EXISTS (
    SELECT *
    FROM sys.foreign_keys
    WHERE name = 'FK_uznemums_direktors'
)
ALTER TABLE uznemums DROP CONSTRAINT FK_uznemums_direktors;


IF EXISTS (
    SELECT *
    FROM sys.foreign_keys
    WHERE name = 'FK_darbinieks_darbavieta'
)
ALTER TABLE darbinieks DROP CONSTRAINT FK_darbinieks_darbavieta;


IF OBJECT_ID('dbo.darbinieks', 'U') IS NOT NULL DROP TABLE darbinieks;
IF OBJECT_ID('dbo.uznemums', 'U') IS NOT NULL DROP TABLE uznemums;