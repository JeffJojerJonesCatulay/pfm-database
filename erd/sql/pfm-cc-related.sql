
CREATE TABLE CCConnectedApp
(
  id           NUMBER   NOT NULL,
  ccId         NUMBER   NOT NULL,
  connectedApp VARCHAR2 NOT NULL,
  subscription VARCHAR2,
  autoDebit    VARCHAR2,
  amount       VARCHAR2,
  date         DATE    ,
  remarks      VARCHAR2,
  dateAdded    DATE     NOT NULL,
  addedBy      VARCHAR2,
  updateDate   DATE    ,
  updateBy     VARCHAR2,
  CONSTRAINT PK_CCConnectedApp PRIMARY KEY (id)
);

ALTER TABLE CCConnectedApp
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_CCConnectedApp
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_CCConnectedApp
BEFORE INSERT ON CCConnectedApp
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_CCConnectedApp.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE CCDetails
(
  ccId        NUMBER   NOT NULL,
  ccName      VARCHAR2 NOT NULL,
  ccLastDigit VARCHAR2 NOT NULL,
  ccAcronym   VARCHAR2 NOT NULL,
  dateAdded   DATE     NOT NULL,
  addedBy     VARCHAR2 NOT NULL,
  updateDate  DATE    ,
  updateBy    VARCHAR2,
  ccId        NUMBER   NOT NULL,
  CONSTRAINT PK_CCDetails PRIMARY KEY (ccId)
);

ALTER TABLE CCDetails
  ADD CONSTRAINT UQ_ccId UNIQUE (ccId);

CREATE SEQUENCE SEQ_CCDetails
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_CCDetails
BEFORE INSERT ON CCDetails
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_CCDetails.NEXTVAL
  INTO: NEW.ccId
  FROM DUAL;
END;

CREATE TABLE CCRecordExpenseTracker
(
  id                 NUMBER   NOT NULL,
  ccRecId            NUMBER   NOT NULL,
  date               VARCHAR2 NOT NULL,
  expenseDescription VARCHAR2 NOT NULL,
  expenseValue       NUMBER   NOT NULL,
  dateAdded          DATE     NOT NULL,
  addedBy            VARCHAR2 NOT NULL,
  updateDate         DATE    ,
  updatedBy          VARCHAR2,
  CONSTRAINT PK_CCRecordExpenseTracker PRIMARY KEY (id)
);

ALTER TABLE CCRecordExpenseTracker
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_CCRecordExpenseTracker
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_CCRecordExpenseTracker
BEFORE INSERT ON CCRecordExpenseTracker
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_CCRecordExpenseTracker.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE CCRecordTracker
(
  ccRecId    NUMBER   NOT NULL,
  ccId       NUMBER   NOT NULL,
  dateFrom   DATE     NOT NULL,
  dateTo     DATE     NOT NULL,
  dueDate    DATE     NOT NULL,
  status     VARCHAR2 NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE    ,
  updatedBy  VARCHAR2,
  CONSTRAINT PK_CCRecordTracker PRIMARY KEY (ccRecId)
);

ALTER TABLE CCRecordTracker
  ADD CONSTRAINT UQ_ccRecId UNIQUE (ccRecId);

CREATE SEQUENCE SEQ_CCRecordTracker
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_CCRecordTracker
BEFORE INSERT ON CCRecordTracker
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_CCRecordTracker.NEXTVAL
  INTO: NEW.ccRecId
  FROM DUAL;
END;

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
