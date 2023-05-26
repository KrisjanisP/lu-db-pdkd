
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