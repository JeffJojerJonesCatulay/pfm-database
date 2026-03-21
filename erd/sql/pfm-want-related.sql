
CREATE TABLE WantList
(
  id             NUMBER   NOT NULL,
  dateWanted     DATE     NOT NULL,
  item           VARCHAR2 NOT NULL,
  estimatedPrice NUMBER   NOT NULL,
  afford         VARCHAR2 NOT NULL,
  remarks        VARCHAR2 NOT NULL,
  status         VARCHAR2 NOT NULL,
  dateAdded      DATE     NOT NULL,
  addedBy        VARCHAR2 NOT NULL,
  updateDate     DATE    ,
  updateBy       VARCHAR2,
  CONSTRAINT PK_WantList PRIMARY KEY (id)
);

ALTER TABLE WantList
  ADD CONSTRAINT UQ_id UNIQUE (id);

CREATE SEQUENCE SEQ_WantList
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SEQ_TRG_WantList
BEFORE INSERT ON WantList
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
  SELECT SEQ_WantList.NEXTVAL
  INTO: NEW.id
  FROM DUAL;
END;
