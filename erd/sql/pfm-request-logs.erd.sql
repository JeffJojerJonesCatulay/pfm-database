
CREATE TABLE APIRequestLogs
(
  id              INT          NOT NULL AUTO_INCREMENT,
  apiMethod       VARCHAR(255) NULL    ,
  requestMethod   VARCHAR(255) NULL    ,
  endpoint        VARCHAR(255) NULL    ,
  requestDetails  LONGTEXT     NULL    ,
  requestResponse LONGTEXT     NULL    ,
  statusCode      INT          NULL    ,
  statusResponse  VARCHAR(255) NULL    ,
  timestamp       VARCHAR(255) NULL    ,
  tps             VARCHAR(255) NULL    ,
  dateAdded       DATE         NULL    ,
  addedBy         VARCHAR(255) NULL    ,
  updateDate      DATE         NULL    ,
  updateBy        VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE INDEX requestLogIndex
  ON APIRequestLogs (apiMethod ASC, requestMethod ASC, statusCode ASC, endpoint ASC);
