
CREATE TABLE SalaryExpenseTracker
(
  id                 INT          NOT NULL AUTO_INCREMENT,
  salaryId           INT          NOT NULL,
  date               DATE         NOT NULL,
  expenseDescription VARCHAR(255) NOT NULL,
  expenseValue       INT          NOT NULL,
  expenseType        VARCHAR(255) NOT NULL,
  dateAdded          DATE         NOT NULL,
  addedBy            VARCHAR(255) NOT NULL,
  updateDate         DATE         NULL    ,
  updateBy           VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE SalaryTracker
(
  salaryId   INT          NOT NULL AUTO_INCREMENT,
  date       DATE         NOT NULL,
  salary     INT          NOT NULL,
  status     VARCHAR(255) NOT NULL,
  dateAdded  DATE         NOT NULL,
  addedBy    VARCHAR(255) NOT NULL,
  updateDate DATE         NULL    ,
  updateBy   VARCHAR(255) NULL    ,
  PRIMARY KEY (salaryId)
);

ALTER TABLE SalaryExpenseTracker
  ADD CONSTRAINT FK_SalaryTracker_TO_SalaryExpenseTracker
    FOREIGN KEY (salaryId)
    REFERENCES SalaryTracker (salaryId);
