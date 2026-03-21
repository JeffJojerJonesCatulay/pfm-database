
CREATE TABLE AllocationMapping
(
  allocId     INT          NOT NULL AUTO_INCREMENT,
  allocation  VARCHAR(255) NOT NULL,
  type        VARCHAR(255) NOT NULL,
  description VARCHAR(255) NULL    ,
  status      VARCHAR(255) NOT NULL,
  dateAdded   DATE         NOT NULL,
  addedBy     VARCHAR(255) NOT NULL,
  updateDate  DATE         NULL    ,
  updateBy    VARCHAR(255) NULL    ,
  PRIMARY KEY (allocId)
);

CREATE TABLE InvestmentsAndSavingsDay
(
  id          INT          NOT NULL AUTO_INCREMENT,
  allocId     INT          NOT NULL,
  date        DATE         NOT NULL,
  valueAdded  INT          NOT NULL,
  marketValue INT          NOT NULL,
  dateAdded   DATE         NOT NULL,
  addedBy     VARCHAR(255) NOT NULL,
  updateDate  DATE         NULL    ,
  updateBy    VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE MonthlyGrowth
(
  id                INT          NOT NULL AUTO_INCREMENT,
  allocId           INT          NOT NULL,
  month             VARCHAR(255) NOT NULL,
  year              INT          NOT NULL,
  contribution      INT          NOT NULL,
  totalContribution INT          NOT NULL,
  currentValue      INT          NOT NULL,
  growthRate        INT          NOT NULL,
  previousContrib   INT          NOT NULL,
  dateAdded         DATE         NOT NULL,
  addedBy           VARCHAR(255) NOT NULL,
  updateDate        DATE         NULL    ,
  updateBy          VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE NetWorth
(
  id         INT          NOT NULL AUTO_INCREMENT,
  allocId    INT          NOT NULL,
  month      VARCHAR(255) NOT NULL,
  year       INT          NOT NULL,
  value      INT          NOT NULL,
  dateAdded  DATE         NOT NULL,
  addedBy    VARCHAR(255) NOT NULL,
  updateDate DATE         NULL    ,
  updateBy   VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE YearlyGrowth
(
  id                  INT          NOT NULL AUTO_INCREMENT,
  allocId             INT          NOT NULL,
  year                INT          NOT NULL,
  totalContribution   INT          NOT NULL,
  averageContribution INT          NOT NULL,
  averageCurrentValue INT          NOT NULL,
  averageGrowthRate   INT          NOT NULL,
  dateAdded           DATE         NOT NULL,
  addedBy             VARCHAR(255) NOT NULL,
  updateDate          DATE         NULL    ,
  updateBy            VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

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
