-- VAICĀJUMS PIE DARBINIEKA INFORMĀCIJAS PIEVIENO VIDĒJO VECUMU UZŅĒMUMĀ
SELECT vards,
    uzvards,
    vecums,
    u.nosaukums as uznemums,
    AVG(CAST(vecums AS FLOAT)) OVER(PARTITION BY darbavieta) AS videjais_vecums_uznemuma
FROM darbinieks
    LEFT JOIN uznemums u on darbinieks.darbavieta = u.ID