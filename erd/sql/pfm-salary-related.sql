
CREATE TABLE SalaryExpenseTracker
(
  id                 NUMBER   NOT NULL,
  salaryId           NUMBER   NOT NULL,
  date               DATE     NOT NULL,
  expenseDescription VARCHAR2 NOT NULL,
  expenseValue       NUMBER   NOT NULL,
  expenseType        VARCHAR2 NOT NULL,
  dateAdded          DATE     NOT NULL,
  addedBy            VARCHAR2 NOT NULL,
  updateDate         DATE    ,
  updateBy           VARCHAR2,
  CONSTRAINT PK_SalaryExpenseTracker PRIMARY KEY (id)
);

ALTER TABLE SalaryExpenseTracker
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_SalaryExpenseTracker
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_SalaryExpenseTracker
BEFORE INSERT ON SalaryExpenseTracker
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_SalaryExpenseTracker.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;

CREATE TABLE SalaryTracker
(
  salaryId   NUMBER   NOT NULL,
  date       DATE     NOT NULL,
  salary     NUMBER   NOT NULL,
  status     VARCHAR2 NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE    ,
  updateBy   VARCHAR2,
  CONSTRAINT PK_SalaryTracker PRIMARY KEY (salaryId)
);

ALTER TABLE SalaryTracker
  ADD CONSTRAINT UQ_salaryId UNIQUE (salaryId);

CREATE SEQUENCE SEQ_SalaryTracker
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_SalaryTracker
BEFORE INSERT ON SalaryTracker
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_SalaryTracker.NEXTVAL
  INTO: NEW.salaryId
  FROM DUAL;
END;

ALTER TABLE SalaryExpenseTracker
  ADD CONSTRAINT FK_SalaryTracker_TO_SalaryExpenseTracker
    FOREIGN KEY (salaryId)
    REFERENCES SalaryTracker (salaryId);
