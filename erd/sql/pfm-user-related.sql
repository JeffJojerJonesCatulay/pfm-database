
CREATE TABLE UserAuth
(
  id         INT          NOT NULL AUTO_INCREMENT,
  username   VARCHAR(255) NOT NULL,
  password   VARCHAR(255) NOT NULL,
  dateAdded  DATE         NOT NULL,
  addedBy    VARCHAR(255) NOT NULL,
  updateDate DATE         NULL    ,
  updateBy   VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

ALTER TABLE UserAuth
  ADD CONSTRAINT UQ_username UNIQUE (username);
