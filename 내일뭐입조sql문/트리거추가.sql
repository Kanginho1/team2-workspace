CREATE OR REPLACE TRIGGER TRG_ILC
BEFORE INSERT ON TB_LOCATION
FOR EACH ROW 
BEGIN
    IF (:NEW.LOC_YN = 'Y')
        THEN 
            UPDATE TB_LOCATION
            SET LOC_YN = 'N'
            WHERE MEM_NO = :NEW.MEM_NO;
    END IF;
END;
/ 