-- every time we insert a dention row
    -- email will be sent to the guardian (enter a new row of data for
    -- gaurdian message )

    CREATE TRIGGER detention_notifer
        ON DETENTION
             -- specifying the name of the table which the trigger will fire for 
             -- when an event occurs 
        AFTER INSERT
        AS 
        BEGIN

            INSERT INTO 
                -- will want to make a new message_id
                -- and will also want to notify guardian
                -- 
                GUARDIAN_MESSAGE(
                    message_id,
                    guardian_id,
                )
            select 
                i.message_id
            FROM    
                INSERTED as i;
        END

    