
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
  id          INT            NOT NULL AUTO_INCREMENT,
  allocId     INT            NOT NULL,
  date        DATE           NOT NULL,
  valueAdded  DECIMAL(15, 2) NOT NULL,
  marketValue DECIMAL(15, 2) NOT NULL,
  dateAdded   DATE           NOT NULL,
  addedBy     VARCHAR(255)   NOT NULL,
  updateDate  DATE           NULL    ,
  updateBy    VARCHAR(255)   NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE MonthlyGrowth
(
  id                INT            NOT NULL AUTO_INCREMENT,
  allocId           INT            NOT NULL,
  month             VARCHAR(255)   NOT NULL,
  year              INT            NOT NULL,
  contribution      DECIMAL(15, 2) NOT NULL,
  totalContribution DECIMAL(15, 2) NOT NULL,
  currentValue      DECIMAL(15, 2) NOT NULL,
  growthRate        DECIMAL(15, 2) NOT NULL,
  previousContrib   DECIMAL(15, 2) NOT NULL,
  dateAdded         DATE           NOT NULL,
  addedBy           VARCHAR(255)   NOT NULL,
  updateDate        DATE           NULL    ,
  updateBy          VARCHAR(255)   NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE NetWorth
(
  id         INT            NOT NULL AUTO_INCREMENT,
  allocId    INT            NOT NULL,
  month      VARCHAR(255)   NOT NULL,
  year       INT            NOT NULL,
  value      DECIMAL(15, 2) NOT NULL,
  dateAdded  DATE           NOT NULL,
  addedBy    VARCHAR(255)   NOT NULL,
  updateDate DATE           NULL    ,
  updateBy   VARCHAR(255)   NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE YearlyGrowth
(
  id                  INT            NOT NULL AUTO_INCREMENT,
  allocId             INT            NOT NULL,
  year                INT            NOT NULL,
  totalContribution   DECIMAL(15, 2) NOT NULL,
  averageContribution DECIMAL(15, 2) NOT NULL,
  averageCurrentValue DECIMAL(15, 2) NOT NULL,
  averageGrowthRate   DECIMAL(15, 2) NOT NULL,
  dateAdded           DATE           NOT NULL,
  addedBy             VARCHAR(255)   NOT NULL,
  updateDate          DATE           NULL    ,
  updateBy            VARCHAR(255)   NULL    ,
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
