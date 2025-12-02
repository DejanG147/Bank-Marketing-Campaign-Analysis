ALTER TABLE marketing_campaign
ADD COLUMN call_id SERIAL;

ALTER TABLE marketing_campaign
ADD COLUMN location_id INT;

UPDATE marketing_campaign
SET location_id = (floor(random() * 10 + 1))::INT;


CREATE TABLE marketing_campaign_new AS (SELECT 
    call_id,
    location_id,
    age,
    job,
    marital,
    education,
    "default",
    housing,
    loan,
    contact,
    month,
    day_of_week,
    duration,
    campaign,
    pdays,
    previous,
    poutcome,
    "emp.var.rate",
    "cons.price.idx",
    "cons.conf.idx",
    euribor3m,
    "nr.employed",
    y
FROM marketing_campaign);

DROP TABLE marketing_campaign;
ALTER TABLE marketing_campaign_new RENAME TO marketing_campaign;

ALTER TABLE marketing_campaign
ADD PRIMARY KEY (call_id);

SELECT *
FROM marketing_campaign;

UPDATE marketing_campaign
SET job = INITCAP(job),
marital = INITCAP(marital),
education = INITCAP(education),
"default" = INITCAP("default"),
housing = INITCAP (housing),
loan = INITCAP (loan),
contact = INITCAP (contact),
month = INITCAP (month),
day_of_week = INITCAP (day_of_week),
poutcome = INITCAP(poutcome),
y = INITCAP (y)
WHERE call_id IS NOT NULL;

SELECT DISTINCT education
FROM marketing_campaign;

UPDATE marketing_campaign
SET education = REPLACE (education, '.',' ')
WHERE education LIKE '%.%';

UPDATE marketing_campaign
SET education = REPLACE (education, 'y', 'years')
WHERE education LIKE '%y';

UPDATE marketing_campaign
SET education = REGEXP_REPLACE(education, '([0-9])years', '\1 years', 'g')
WHERE education ~ '[0-9]years';
