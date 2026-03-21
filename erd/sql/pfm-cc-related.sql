
CREATE TABLE CCConnectedApp
(
  id           INT          NOT NULL AUTO_INCREMENT,
  ccId         INT          NOT NULL,
  connectedApp VARCHAR(255) NOT NULL,
  subscription VARCHAR(255) NULL    ,
  autoDebit    VARCHAR(255) NULL    ,
  amount       VARCHAR(255) NULL    ,
  date         DATE         NULL    ,
  remarks      VARCHAR(255) NULL    ,
  dateAdded    DATE         NOT NULL,
  addedBy      VARCHAR(255) NULL    ,
  updateDate   DATE         NULL    ,
  updateBy     VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE CCDetails
(
  ccId        INT          NOT NULL AUTO_INCREMENT,
  ccName      VARCHAR(255) NOT NULL,
  ccLastDigit VARCHAR(255) NOT NULL,
  ccAcronym   VARCHAR(255) NOT NULL,
  dateAdded   DATE         NOT NULL,
  addedBy     VARCHAR(255) NOT NULL,
  updateDate  DATE         NULL    ,
  updateBy    VARCHAR(255) NULL    ,
  PRIMARY KEY (ccId)
);

CREATE TABLE CCRecordExpenseTracker
(
  ccExpId            INT          NOT NULL AUTO_INCREMENT,
  ccRecId            INT          NOT NULL,
  date               VARCHAR(255) NOT NULL,
  expenseDescription VARCHAR(255) NOT NULL,
  expenseValue       INT          NOT NULL,
  dateAdded          DATE         NOT NULL,
  addedBy            VARCHAR(255) NOT NULL,
  updateDate         DATE         NULL    ,
  updatedBy          VARCHAR(255) NULL    ,
  PRIMARY KEY (ccExpId)
);

CREATE TABLE CCRecordTracker
(
  ccRecId    INT          NOT NULL AUTO_INCREMENT,
  ccId       INT          NOT NULL,
  dateFrom   DATE         NOT NULL,
  dateTo     DATE         NOT NULL,
  dueDate    DATE         NOT NULL,
  status     VARCHAR(255) NOT NULL,
  dateAdded  DATE         NOT NULL,
  addedBy    VARCHAR(255) NOT NULL,
  updateDate DATE         NULL    ,
  updatedBy  VARCHAR(255) NULL    ,
  PRIMARY KEY (ccRecId)
);

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
  ON CCRecordExpenseTracker (ccExpId ASC);
