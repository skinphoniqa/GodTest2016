CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR2(20)  NOT NULL ,
	NEXT_ID               NUMBER(30)  NULL ,
CONSTRAINT  COMTECOPSEQ_PK PRIMARY KEY (TABLE_NAME)
);




CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3)  NOT NULL ,
	CL_CODE_NM            VARCHAR2(60)  NULL ,
	CL_CODE_DC            VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
CONSTRAINT  COMTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
);




CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR2(6)  NOT NULL ,
	CODE_ID_NM            VARCHAR2(60)  NULL ,
	CODE_ID_DC            VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	CL_CODE               CHAR(3)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
CONSTRAINT  COMTCCMMNCODE_PK PRIMARY KEY (CODE_ID),
CONSTRAINT  COMTCCMMNCODE_FK1 FOREIGN KEY (CL_CODE) REFERENCES COMTCCMMNCLCODE(CL_CODE) ON DELETE CASCADE
);

CREATE INDEX COMTCCMMNCODE_i01 ON COMTCCMMNCODE
(CL_CODE  ASC);



CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR2(6)  NOT NULL ,
	CODE                  VARCHAR2(15)  NOT NULL ,
	CODE_NM               VARCHAR2(60)  NULL ,
	CODE_DC               VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
CONSTRAINT  COMTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE),
CONSTRAINT  COMTCCMMNDETAILCODE_FK1 FOREIGN KEY (CODE_ID) REFERENCES COMTCCMMNCODE(CODE_ID)
);

CREATE INDEX COMTCCMMNDETAILCODE_i01 ON COMTCCMMNDETAILCODE
(CODE_ID  ASC);



CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20)  NOT NULL ,
	GROUP_NM              VARCHAR2(60)  NOT NULL ,
	GROUP_CREAT_DE        CHAR(20)  NOT NULL ,
	GROUP_DC              VARCHAR2(100)  NULL ,
CONSTRAINT  COMTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
);




CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20)  NOT NULL ,
	ORGNZT_NM             VARCHAR2(20)  NOT NULL ,
	ORGNZT_DC             VARCHAR2(100)  NULL ,
CONSTRAINT  COMTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
);




CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR2(20)  NOT NULL ,
	ORGNZT_ID             CHAR(20)  NULL ,
	USER_NM               VARCHAR2(60)  NOT NULL ,
	PASSWORD              VARCHAR2(200)  NOT NULL ,
	EMPL_NO               VARCHAR2(20)  NULL ,
	IHIDNUM               VARCHAR2(200)  NULL ,
	SEXDSTN_CODE          CHAR(1)  NULL ,
	BRTHDY                CHAR(20)  NULL ,
	FXNUM                 VARCHAR2(20)  NULL ,
	HOUSE_ADRES           VARCHAR2(100)  NOT NULL ,
	PASSWORD_HINT         VARCHAR2(100)  NOT NULL ,
	PASSWORD_CNSR         VARCHAR2(100)  NOT NULL ,
	HOUSE_END_TELNO       VARCHAR2(4)  NOT NULL ,
	AREA_NO               VARCHAR2(4)  NOT NULL ,
	DETAIL_ADRES          VARCHAR2(100)  NULL ,
	ZIP                   VARCHAR2(6)  NOT NULL ,
	OFFM_TELNO            VARCHAR2(20)  NULL ,
	MBTLNUM               VARCHAR2(20)  NULL ,
	EMAIL_ADRES           VARCHAR2(50)  NULL ,
	OFCPS_NM              VARCHAR2(60)  NULL ,
	HOUSE_MIDDLE_TELNO    VARCHAR2(4)  NOT NULL ,
	GROUP_ID              CHAR(20)  NULL ,
	PSTINST_CODE          CHAR(8)  NULL ,
	EMPLYR_STTUS_CODE     CHAR(1)  NOT NULL ,
	ESNTL_ID              CHAR(20)  NOT NULL ,
	CRTFC_DN_VALUE        VARCHAR2(100)  NULL ,
	SBSCRB_DE             DATE  NULL ,
CONSTRAINT  COMTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID),
CONSTRAINT  COMTNEMPLYRINFO_FK2 FOREIGN KEY (ORGNZT_ID) REFERENCES COMTNORGNZTINFO(ORGNZT_ID) ON DELETE CASCADE,
CONSTRAINT  COMTNEMPLYRINFO_FK1 FOREIGN KEY (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID) ON DELETE CASCADE
);

CREATE INDEX COMTNEMPLYRINFO_i01 ON COMTNEMPLYRINFO
(ORGNZT_ID  ASC);
CREATE INDEX COMTNEMPLYRINFO_i02 ON COMTNEMPLYRINFO
(GROUP_ID  ASC);



CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20)  NOT NULL ,
	CREAT_DT              DATE  NOT NULL ,
	USE_AT                CHAR(1)  NULL ,
CONSTRAINT  COMTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
);




CREATE TABLE COMTNFILEDETAIL
(
	ATCH_FILE_ID          CHAR(20)  NOT NULL ,
	FILE_SN               NUMBER(10)  NOT NULL ,
	FILE_STRE_COURS       VARCHAR2(2000)  NOT NULL ,
	STRE_FILE_NM          VARCHAR2(255)  NOT NULL ,
	ORIGNL_FILE_NM        VARCHAR2(255)  NULL ,
	FILE_EXTSN            VARCHAR2(20)  NOT NULL ,
	FILE_CN               CLOB  NULL ,
	FILE_SIZE             NUMBER(8)  NULL ,
CONSTRAINT  COMTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
CONSTRAINT  COMTNFILEDETAIL_FK1 FOREIGN KEY (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
);

CREATE INDEX COMTNFILEDETAIL_i01 ON COMTNFILEDETAIL
(ATCH_FILE_ID  ASC);



CREATE TABLE COMTNNOTE
(
	NOTE_ID               CHAR(20)  NOT NULL ,
	NOTE_SJ               VARCHAR2(255)  NULL ,
	NOTE_CN               VARCHAR2(4000)  NULL ,
	ATCH_FILE_ID          CHAR(20)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNNOTE_PK PRIMARY KEY (NOTE_ID)
);




CREATE TABLE COMTNNOTETRNSMIT
(
	NOTE_ID               CHAR(20)  NOT NULL ,
	NOTE_TRNSMIT_ID       CHAR(20)  NOT NULL ,
	TRNSMITER_ID          CHAR(20)  NULL ,
	DELETE_AT             CHAR(8)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNNOTETRNSMIT_PK PRIMARY KEY (NOTE_ID,NOTE_TRNSMIT_ID),
CONSTRAINT  COMTNNOTETRNSMIT_FK1 FOREIGN KEY (NOTE_ID) REFERENCES COMTNNOTE(NOTE_ID)
);

CREATE INDEX COMTNNOTETRNSMIT_i01 ON COMTNNOTETRNSMIT
(NOTE_ID  ASC);



CREATE TABLE COMTNNOTERECPTN
(
	NOTE_ID               CHAR(20)  NOT NULL ,
	NOTE_TRNSMIT_ID       CHAR(20)  NOT NULL ,
	NOTE_RECPTN_ID        CHAR(20)  NOT NULL ,
	RCVER_ID              CHAR(20)  NULL ,
	OPEN_YN               CHAR(1)  NULL ,
	RECPTN_SE             CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNNOTERECPTN_PK PRIMARY KEY (NOTE_ID,NOTE_TRNSMIT_ID,NOTE_RECPTN_ID),
CONSTRAINT  COMTNNOTERECPTN_FK1 FOREIGN KEY (NOTE_ID,NOTE_TRNSMIT_ID) REFERENCES COMTNNOTETRNSMIT(NOTE_ID,NOTE_TRNSMIT_ID)
);

CREATE INDEX COMTNNOTERECPTN_i01 ON COMTNNOTERECPTN
(NOTE_ID  ASC,NOTE_TRNSMIT_ID  ASC);

CREATE TABLE COMTNBNDTMANAGE
(
	BNDT_ID               VARCHAR2(20)  NOT NULL ,
	BNDT_DE               CHAR(8)  NOT NULL ,
	RM                    VARCHAR2(2500)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNBNDTMANAGE_PK PRIMARY KEY (BNDT_ID,BNDT_DE)
);



CREATE TABLE COMTNBNDTCECKMANAGE
(
	BNDT_CECK_SE          CHAR(2)  NOT NULL ,
	BNDT_CECK_CODE        VARCHAR2(10)  NOT NULL ,
	BNDT_CECK_CODE_NM     VARCHAR2(255)  NOT NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNBNDTCECKMANAGE_PK PRIMARY KEY (BNDT_CECK_CODE,BNDT_CECK_SE)
);



CREATE TABLE COMTNBNDTDIARY
(
	BNDT_ID               VARCHAR2(20)  NOT NULL ,
	BNDT_DE               CHAR(8)  NOT NULL ,
	BNDT_CECK_SE          CHAR(2)  NOT NULL ,
	BNDT_CECK_CODE        VARCHAR2(10)  NOT NULL ,
	CHCK_STTUS            VARCHAR2(1000)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
CONSTRAINT  COMTNBNDTDIARY_PK PRIMARY KEY (BNDT_ID,BNDT_DE,BNDT_CECK_SE,BNDT_CECK_CODE),
CONSTRAINT  COMTNBNDTDIARY_FK2 FOREIGN KEY (BNDT_ID,BNDT_DE) REFERENCES COMTNBNDTMANAGE(BNDT_ID,BNDT_DE),
CONSTRAINT  COMTNBNDTDIARY_FK1 FOREIGN KEY (BNDT_CECK_CODE,BNDT_CECK_SE) REFERENCES COMTNBNDTCECKMANAGE(BNDT_CECK_CODE,BNDT_CECK_SE)
);

