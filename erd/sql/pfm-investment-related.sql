
CREATE TABLE AllocationMapping
(
  allocId     NUMBER   NOT NULL,
  allocation  VARCHAR2 NOT NULL,
  type        VARCHAR2 NOT NULL,
  description VARCHAR2,
  status      VARCHAR2 NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE    ,
  updateBy    VARCHAR2,
  CONSTRAINT PK_AllocationMapping PRIMARY KEY (allocId)
);

ALTER TABLE AllocationMapping
  ADD CONSTRAINT UQ_allocId UNIQUE (allocId);

CREATE SEQUENCE SEQ_AllocationMapping
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_AllocationMapping
BEFORE INSERT ON AllocationMapping
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_AllocationMapping.NEXTVAL
  INTO: NEW.allocId
  FROM DUAL;
END;

CREATE TABLE InvestmentsAndSavingsDay
(
  id          NUMBER   NOT NULL,
  allocId     NUMBER   NOT NULL,
  date        DATE     NOT NULL,
  valueAdded  NUMBER   NOT NULL,
  marketValue NUMBER   NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE    ,
  updateBy    VARCHAR2,
  CONSTRAINT PK_InvestmentsAndSavingsDay PRIMARY KEY (id)
);

ALTER TABLE InvestmentsAndSavingsDay
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_InvestmentsAndSavingsDay
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_InvestmentsAndSavingsDay
BEFORE INSERT ON InvestmentsAndSavingsDay
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_InvestmentsAndSavingsDay.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE MonthlyGrowth
(
  id                NUMBER   NOT NULL,
  allocId           NUMBER   NOT NULL,
  month             VARCHAR2 NOT NULL,
  year              NUMBER   NOT NULL,
  contribution      NUMBER   NOT NULL,
  totalContribution NUMBER   NOT NULL,
  currentValue      NUMBER   NOT NULL,
  growthRate        NUMBER   NOT NULL,
  previousContrib   NUMBER   NOT NULL,
  dateAdded         DATE     NOT NULL,
  addedBy           VARCHAR2 NOT NULL,
  updateDate        DATE    ,
  updateBy          VARCHAR2,
  CONSTRAINT PK_MonthlyGrowth PRIMARY KEY (id)
);

ALTER TABLE MonthlyGrowth
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_MonthlyGrowth
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_MonthlyGrowth
BEFORE INSERT ON MonthlyGrowth
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_MonthlyGrowth.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE NetWorth
(
  id         NUMBER   NOT NULL,
  allocId    NUMBER   NOT NULL,
  month      VARCHAR2 NOT NULL,
  year       NUMBER   NOT NULL,
  value      NUMBER   NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE    ,
  updateBy   VARCHAR2,
  CONSTRAINT PK_NetWorth PRIMARY KEY (id)
);

ALTER TABLE NetWorth
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_NetWorth
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_NetWorth
BEFORE INSERT ON NetWorth
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_NetWorth.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE YearlyGrowth
(
  id                  NUMBER   NOT NULL,
  allocId             NUMBER   NOT NULL,
  year                NUMBER   NOT NULL,
  totalContribution   NUMBER   NOT NULL,
  averageContribution NUMBER   NOT NULL,
  averageCurrentValue NUMBER   NOT NULL,
  averageGrowthRate   NUMBER   NOT NULL,
  dateAdded           DATE     NOT NULL,
  addedBy             VARCHAR2 NOT NULL,
  updateDate          DATE    ,
  updateBy            VARCHAR2,
  CONSTRAINT PK_YearlyGrowth PRIMARY KEY (id)
);

ALTER TABLE YearlyGrowth
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_YearlyGrowth
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_YearlyGrowth
BEFORE INSERT ON YearlyGrowth
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_YearlyGrowth.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

ALTER TABLE InvestmentsAndSavingsDay
  ADD CONSTRAINT FK_AllocationMapping_TO_InvestmentsAndSavingsDay
    FOREIGN KEY (allocId)
    REFERENCES AllocationMapping (allocId);

ALTER TABLE MonthlyGrowth
  ADD CONSTRAINT FK_AllocationMapping_TO_MonthlyGrowth
    FOREIGN KEY (allocId)
    REFERENCES AllocationMapping (allocId);

ALTER TABLE NetWorth
  ADD CONSTRAINT FK_AllocationMapping_TO_NetWorth
    FOREIGN KEY (allocId)
    REFERENCES AllocationMapping (allocId);

ALTER TABLE YearlyGrowth
  ADD CONSTRAINT FK_AllocationMapping_TO_YearlyGrowth
    FOREIGN KEY (allocId)
    REFERENCES AllocationMapping (allocId);
