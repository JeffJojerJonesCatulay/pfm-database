
CREATE TABLE SalaryExpenseTracker
(
  id                 NUMBER   NOT NULL AUTO_INCREMENT,
  salaryId           NUMBER   NOT NULL,
  date               DATE     NOT NULL,
  expenseDescription VARCHAR2 NOT NULL,
  expenseValue       NUMBER   NOT NULL,
  expenseType        VARCHAR2 NOT NULL,
  dateAdded          DATE     NOT NULL,
  addedBy            VARCHAR2 NOT NULL,
  updateDate         DATE     NULL    ,
  updateBy           VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE SalaryExpenseTracker
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE TABLE SalaryTracker
(
  salaryId   NUMBER   NOT NULL AUTO_INCREMENT,
  date       DATE     NOT NULL,
  salary     NUMBER   NOT NULL,
  status     VARCHAR2 NOT NULL,
  dateAdded  DATE     NOT NULL,
  addedBy    VARCHAR2 NOT NULL,
  updateDate DATE     NULL    ,
  updateBy   VARCHAR2 NULL    ,
  PRIMARY KEY (salaryId)
);

ALTER TABLE SalaryTracker
  ADD CONSTRAINT UQ_salaryId UNIQUE (salaryId);

ALTER TABLE SalaryExpenseTracker
  ADD CONSTRAINT FK_SalaryTracker_TO_SalaryExpenseTracker
    FOREIGN KEY (salaryId)
    REFERENCES SalaryTracker (salaryId);
