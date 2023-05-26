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