
CREATE TABLE AllocationMapping
(
  allocId     NUMBER   NOT NULL AUTO_INCREMENT,
  allocation  VARCHAR2 NOT NULL,
  type        VARCHAR2 NOT NULL,
  description VARCHAR2 NULL    ,
  status      VARCHAR2 NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE     NULL    ,
  updateBy    VARCHAR2 NULL    ,
  PRIMARY KEY (allocId)
);

ALTER TABLE AllocationMapping
  ADD CONSTRAINT UQ_allocId UNIQUE (allocId);

CREATE TABLE InvestmentsAndSavingsDay
(
  id          NUMBER   NOT NULL AUTO_INCREMENT,
  allocId     NUMBER   NOT NULL,
  date        DATE     NOT NULL,
  valueAdded  NUMBER   NOT NULL,
  marketValue NUMBER   NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE     NULL    ,
  updateBy    VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE InvestmentsAndSavingsDay
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE MonthlyGrowth
(
  id                NUMBER   NOT NULL AUTO_INCREMENT,
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
  updateDate        DATE     NULL    ,
  updateBy          VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE MonthlyGrowth
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE NetWorth
(
  id         NUMBER   NOT NULL AUTO_INCREMENT,
  allocId    NUMBER   NOT NULL,
  month      VARCHAR2 NOT NULL,
  year       NUMBER   NOT NULL,
  value      NUMBER   NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE     NULL    ,
  updateBy   VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE NetWorth
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE YearlyGrowth
(
  id                  NUMBER   NOT NULL AUTO_INCREMENT,
  allocId             NUMBER   NOT NULL,
  year                NUMBER   NOT NULL,
  totalContribution   NUMBER   NOT NULL,
  averageContribution NUMBER   NOT NULL,
  averageCurrentValue NUMBER   NOT NULL,
  averageGrowthRate   NUMBER   NOT NULL,
  dateAdded           DATE     NOT NULL,
  addedBy             VARCHAR2 NOT NULL,
  updateDate          DATE     NULL    ,
  updateBy            VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE YearlyGrowth
  ADD CONSTRAINT UQ_id UNIQUE (id);

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
