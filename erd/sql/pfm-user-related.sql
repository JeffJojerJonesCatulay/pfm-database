
CREATE TABLE UserAuth
(
  id         INT          NOT NULL AUTO_INCREMENT,
  username   VARCHAR(255) NOT NULL,
  password   INT          NOT NULL,
  dateAdded  DATE         NOT NULL,
  addedBy    VARCHAR(255) NOT NULL,
  updateDate DATE         NULL    ,
  updateBy   VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);
