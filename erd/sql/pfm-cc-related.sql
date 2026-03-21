
CREATE TABLE CCConnectedApp
(
  id           NUMBER   NOT NULL AUTO_INCREMENT,
  ccId         NUMBER   NOT NULL,
  connectedApp VARCHAR2 NOT NULL,
  subscription VARCHAR2 NULL    ,
  autoDebit    VARCHAR2 NULL    ,
  amount       VARCHAR2 NULL    ,
  date         DATE     NULL    ,
  remarks      VARCHAR2 NULL    ,
  dateAdded    DATE     NOT NULL,
  addedBy      VARCHAR2 NULL    ,
  updateDate   DATE     NULL    ,
  updateBy     VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE CCConnectedApp
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE CCDetails
(
  ccId        NUMBER   NOT NULL AUTO_INCREMENT,
  ccName      VARCHAR2 NOT NULL,
  ccLastDigit VARCHAR2 NOT NULL,
  ccAcronym   VARCHAR2 NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE     NULL    ,
  updateBy    VARCHAR2 NULL    ,
  ccId        NUMBER   NOT NULL,
  PRIMARY KEY (ccId)
);

ALTER TABLE CCDetails
  ADD CONSTRAINT UQ_ccId UNIQUE (ccId);

CREATE TABLE CCRecordExpenseTracker
(
  id                 NUMBER   NOT NULL AUTO_INCREMENT,
  ccRecId            NUMBER   NOT NULL,
  date               VARCHAR2 NOT NULL,
  expenseDescription VARCHAR2 NOT NULL,
  expenseValue       NUMBER   NOT NULL,
  dateAdded          DATE     NOT NULL,
  addedBy            VARCHAR2 NOT NULL,
  updateDate         DATE     NULL    ,
  updatedBy          VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE CCRecordExpenseTracker
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE CCRecordTracker
(
  ccRecId    NUMBER   NOT NULL AUTO_INCREMENT,
  ccId       NUMBER   NOT NULL,
  dateFrom   DATE     NOT NULL,
  dateTo     DATE     NOT NULL,
  dueDate    DATE     NOT NULL,
  status     VARCHAR2 NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE     NULL    ,
  updatedBy  VARCHAR2 NULL    ,
  PRIMARY KEY (ccRecId)
);

ALTER TABLE CCRecordTracker
  ADD CONSTRAINT UQ_ccRecId UNIQUE (ccRecId);

ALTER TABLE CCConnectedApp
  ADD CONSTRAINT FK_CCDetails_TO_CCConnectedApp
    FOREIGN KEY (ccId)
    REFERENCES CCDetails (ccId);

ALTER TABLE CCRecordTracker
  ADD CONSTRAINT FK_CCDetails_TO_CCRecordTracker
    FOREIGN KEY (ccId)
    REFERENCES CCDetails (ccId);

ALTER TABLE CCRecordExpenseTracker
  ADD CONSTRAINT FK_CCRecordTracker_TO_CCRecordExpenseTracker
    FOREIGN KEY (ccRecId)
    REFERENCES CCRecordTracker (ccRecId);

CREATE UNIQUE INDEX IDX_CCRecordExpenseTracker
  ON CCRecordExpenseTracker (id ASC);
