CREATE OR REPLACE 
PROCEDURE P_MAPINFOWIPETABLES IS
BEGIN
    delete from     HP_MAP;
    delete from     ISR_HP_TABLE;
    delete from     ISR_TABLE;
    delete from     LINE_MAP;
    delete from     LINE_TABLE;
    delete from     OA_MAP;
    delete from     OA_TABLE;
    delete from     SCHOOL;
    commit;
END; -- Procedure
/
