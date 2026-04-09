
CREATE TABLE NetWorth
(
  id         INT            NOT NULL AUTO_INCREMENT,
  month      VARCHAR(255)   NOT NULL,
  year       INT            NOT NULL,
  value      DECIMAL(15, 2) NOT NULL,
  dateAdded  DATE           NOT NULL,
  addedBy    VARCHAR(255)   NOT NULL,
  updateDate DATE           NULL    ,
  updateBy   VARCHAR(255)   NULL    ,
  PRIMARY KEY (id)
);
