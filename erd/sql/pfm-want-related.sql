
CREATE TABLE WantList
(
  id             INT          NOT NULL AUTO_INCREMENT,
  dateWanted     DATE         NOT NULL,
  item           VARCHAR(255) NOT NULL,
  estimatedPrice INT          NOT NULL,
  afford         VARCHAR(255) NOT NULL,
  remarks        VARCHAR(255) NOT NULL,
  status         VARCHAR(255) NOT NULL,
  dateAdded      DATE         NOT NULL,
  addedBy        VARCHAR(255) NOT NULL,
  updateDate     DATE         NULL    ,
  updateBy       VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);
