CREATE TABLE bank_marketing (
    age        INT,
    job        TEXT,
    marital    TEXT,
    education  TEXT,
    "default"  TEXT,
    balance    INT,
    housing    TEXT,
    loan       TEXT,
    contact    TEXT,
    day        INT,
    month      TEXT,
    duration   INT,
    campaign   INT,
    pdays      INT,
    previous   INT,
    poutcome   TEXT,
    y          TEXT
);

COPY bank_marketing
FROM 'C:/Temp/bank-full.csv'
WITH (
    FORMAT csv,
    DELIMITER ';',
    HEADER true,
    QUOTE '"'
);

SELECT * from bank_marketing;

CREATE TABLE marketing_campaign (
    age              INT,
    job              TEXT,
    marital          TEXT,
    education        TEXT,
    "default"        TEXT,
    housing          TEXT,
    loan             TEXT,
    contact          TEXT,
    month            TEXT,
    day_of_week      TEXT,
    duration         INT,
    campaign         INT,
    pdays            INT,
    previous         INT,
    poutcome         TEXT,
    "emp.var.rate"   NUMERIC(5,2),
    "cons.price.idx" NUMERIC(6,3),
    "cons.conf.idx"  NUMERIC(5,2),
    euribor3m        NUMERIC(6,3),
    "nr.employed"    NUMERIC(7,1),
    y                TEXT
);

COPY marketing_campaign
FROM 'C:/Temp/bank-additional-full.csv'
WITH (
    FORMAT csv,
    DELIMITER ';',
    HEADER true,
    QUOTE '"'
);

SELECT *
FROM marketing_campaign;