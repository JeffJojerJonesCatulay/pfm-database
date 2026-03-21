
CREATE TABLE WantList
(
  id             NUMBER   NOT NULL AUTO_INCREMENT,
  dateWanted     DATE     NOT NULL,
  item           VARCHAR2 NOT NULL,
  estimatedPrice NUMBER   NOT NULL,
  afford         VARCHAR2 NOT NULL,
  remarks        VARCHAR2 NOT NULL,
  status         VARCHAR2 NOT NULL,
  dateAdded      DATE     NOT NULL,
  addedBy        VARCHAR2 NOT NULL,
  updateDate     DATE     NULL    ,
  updateBy       VARCHAR2 NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE WantList
  ADD CONSTRAINT UQ_id UNIQUE (id);
