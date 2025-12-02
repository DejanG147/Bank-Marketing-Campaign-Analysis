ALTER TABLE bank_marketing
ADD COLUMN call_id SERIAL;

select *
FROM bank_marketing;

ALTER TABLE bank_marketing
ADD COLUMN country_id INT;

UPDATE bank_marketing
SET country_id = (floor(random() * 10 + 1))::INT;

select *
from bank_marketing;

ALTER TABLE bank_marketing
RENAME COLUMN country_id TO location_id;

CREATE TABLE bank_marketing_new AS (SELECT 
    call_id,
    location_id,
    age ,
    job        ,
    marital    ,
    education  ,
    "default" ,
    balance   ,
    housing   ,
    loan     ,
    contact    ,
    day      ,
    month     ,
    duration   ,
    campaign   ,
    pdays      ,
    previous   ,
    poutcome   ,
    y          
FROM bank_marketing)

DROP TABLE bank_marketing;
ALTER TABLE bank_marketing_new RENAME TO bank_marketing;

ALTER TABLE bank_marketing
ADD PRIMARY KEY (call_id);

SELECT *
FROM bank_marketing;