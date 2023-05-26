-- VAICĀJUMS ATROD DARBINIEKU DARBAVIETAS UN TO DIREKTORUS
SELECT d1.vards as darbinieka_vards, d1.uzvards as darbinieka_uzvards, u.nosaukums as uznemuma_nosaukums, d2.vards AS direktora_vards, d2.uzvards AS direktora_uzvards
FROM darbinieks d1
LEFT JOIN uznemums u ON d1.darbavieta = u.ID
LEFT JOIN darbinieks d2 ON u.direktors = d2.ID;