CREATE TABLE COMTECOPSEQ
(
    TABLE_NAME            VARCHAR(60)  NOT NULL ,
    NEXT_ID               NUMERIC(30)  NULL ,
CONSTRAINT  COMTECOPSEQ_PK PRIMARY KEY (TABLE_NAME)
);




CREATE TABLE COMTCCMMNCLCODE
(
    CL_CODE               CHAR(3)  NOT NULL ,
    CL_CODE_NM            VARCHAR(180)  NULL ,
    CL_CODE_DC            VARCHAR(600)  NULL ,
    USE_AT                CHAR(1)  NULL ,
    FRST_REGIST_PNTTM     DATETIME  NULL ,
    FRST_REGISTER_ID      VARCHAR(60)  NULL ,
    LAST_UPDT_PNTTM       DATETIME  NULL ,
    LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
);




CREATE TABLE COMTCCMMNCODE
(
    CODE_ID               VARCHAR(18)  NOT NULL ,
    CODE_ID_NM            VARCHAR(180)  NULL ,
    CODE_ID_DC            VARCHAR(600)  NULL ,
    USE_AT                CHAR(1)  NULL ,
    CL_CODE               CHAR(3)  NULL ,
    FRST_REGIST_PNTTM     DATETIME  NULL ,
    FRST_REGISTER_ID      VARCHAR(60)  NULL ,
    LAST_UPDT_PNTTM       DATETIME  NULL ,
    LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNCODE_PK PRIMARY KEY (CODE_ID)
);




CREATE TABLE COMTCCMMNDETAILCODE
(
    CODE_ID               VARCHAR(18)  NOT NULL ,
    CODE                  VARCHAR(45)  NOT NULL ,
    CODE_NM               VARCHAR(180)  NULL ,
    CODE_DC               VARCHAR(600)  NULL ,
    USE_AT                CHAR(1)  NULL ,
    FRST_REGIST_PNTTM     DATETIME  NULL ,
    FRST_REGISTER_ID      VARCHAR(60)  NULL ,
    LAST_UPDT_PNTTM       DATETIME  NULL ,
    LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE)
);




CREATE TABLE COMTNAUTHORGROUPINFO
(
    GROUP_ID              CHAR(20)  NOT NULL ,
    GROUP_NM              VARCHAR(180)  NOT NULL ,
    GROUP_CREAT_DE        CHAR(40)  NOT NULL ,
    GROUP_DC              VARCHAR(300)  NULL ,
CONSTRAINT  COMTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
);




CREATE TABLE COMTNGNRLMBER
(
    MBER_ID               VARCHAR(60)  NOT NULL ,
    PASSWORD              VARCHAR(600)  NOT NULL ,
    PASSWORD_HINT         VARCHAR(300)  NULL ,
    PASSWORD_CNSR         VARCHAR(300)  NULL ,
    IHIDNUM               VARCHAR(600)  NULL ,
    MBER_NM               VARCHAR(150)  NOT NULL ,
    ZIP                   VARCHAR(18)  NOT NULL ,
    ADRES                 VARCHAR(300)  NOT NULL ,
    AREA_NO               VARCHAR(12)  NOT NULL ,
    MBER_STTUS            VARCHAR(45)  NULL ,
    DETAIL_ADRES          VARCHAR(300)  NULL ,
    END_TELNO             VARCHAR(12)  NOT NULL ,
    MBTLNUM               VARCHAR(60)  NOT NULL ,
    GROUP_ID              CHAR(20)  NULL ,
    MBER_FXNUM            VARCHAR(60)  NULL ,
    MBER_EMAIL_ADRES      VARCHAR(150)  NULL ,
    MIDDLE_TELNO          VARCHAR(12)  NOT NULL ,
    SBSCRB_DE             DATETIME  NULL ,
    SEXDSTN_CODE          CHAR(1)  NULL ,
    ESNTL_ID              CHAR(20)  NOT NULL ,
CONSTRAINT  COMTNGNRLMBER_PK PRIMARY KEY (MBER_ID)
);




CREATE TABLE COMTNORGNZTINFO
(
    ORGNZT_ID             CHAR(20)  NOT NULL ,
    ORGNZT_NM             VARCHAR(60)  NOT NULL ,
    ORGNZT_DC             VARCHAR(300)  NULL ,
CONSTRAINT  COMTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
);




CREATE TABLE COMTNEMPLYRINFO
(
    EMPLYR_ID             VARCHAR(60)  NOT NULL ,
    ORGNZT_ID             CHAR(20)  NULL ,
    USER_NM               VARCHAR(180)  NOT NULL ,
    PASSWORD              VARCHAR(600)  NOT NULL ,
    EMPL_NO               VARCHAR(60)  NULL ,
    IHIDNUM               VARCHAR(600)  NULL ,
    SEXDSTN_CODE          CHAR(1)  NULL ,
    BRTHDY                CHAR(20)  NULL ,
    FXNUM                 VARCHAR(60)  NULL ,
    HOUSE_ADRES           VARCHAR(300)  NOT NULL ,
    PASSWORD_HINT         VARCHAR(300)  NOT NULL ,
    PASSWORD_CNSR         VARCHAR(300)  NOT NULL ,
    HOUSE_END_TELNO       VARCHAR(12)  NOT NULL ,
    AREA_NO               VARCHAR(12)  NOT NULL ,
    DETAIL_ADRES          VARCHAR(300)  NULL ,
    ZIP                   VARCHAR(18)  NOT NULL ,
    OFFM_TELNO            VARCHAR(60)  NULL ,
    MBTLNUM               VARCHAR(60)  NULL ,
    EMAIL_ADRES           VARCHAR(150)  NULL ,
    OFCPS_NM              VARCHAR(180)  NULL ,
    HOUSE_MIDDLE_TELNO    VARCHAR(12)  NOT NULL ,
    GROUP_ID              CHAR(20)  NULL ,
    PSTINST_CODE          CHAR(8)  NULL ,
    EMPLYR_STTUS_CODE     CHAR(1)  NOT NULL ,
    ESNTL_ID              CHAR(20)  NOT NULL ,
    CRTFC_DN_VALUE        VARCHAR(300)  NULL ,
    SBSCRB_DE             DATETIME  NULL ,
CONSTRAINT  COMTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID)
);




CREATE TABLE COMTNENTRPRSMBER
(
    ENTRPRS_MBER_ID       VARCHAR(60)  NOT NULL ,
    ENTRPRS_SE_CODE       CHAR(8)  NULL ,
    BIZRNO                VARCHAR(30)  NULL ,
    JURIRNO               VARCHAR(39)  NULL ,
    CMPNY_NM              VARCHAR(180)  NOT NULL ,
    CXFC                  VARCHAR(150)  NULL ,
    ZIP                   VARCHAR(18)  NOT NULL ,
    ADRES                 VARCHAR(300)  NOT NULL ,
    ENTRPRS_MIDDLE_TELNO  VARCHAR(12)  NOT NULL ,
    FXNUM                 VARCHAR(60)  NULL ,
    INDUTY_CODE           CHAR(1)  NULL ,
    APPLCNT_NM            VARCHAR(150)  NOT NULL ,
    APPLCNT_IHIDNUM       VARCHAR(600)  NULL ,
    SBSCRB_DE             DATETIME  NULL ,
    ENTRPRS_MBER_STTUS    VARCHAR(45)  NULL ,
    ENTRPRS_MBER_PASSWORD  VARCHAR(600)  NULL ,
    ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(300)  NOT NULL ,
    ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(300)  NOT NULL ,
    GROUP_ID              CHAR(20)  NULL ,
    DETAIL_ADRES          VARCHAR(300)  NULL ,
    ENTRPRS_END_TELNO     VARCHAR(12)  NOT NULL ,
    AREA_NO               VARCHAR(12)  NOT NULL ,
    APPLCNT_EMAIL_ADRES   VARCHAR(150)  NOT NULL ,
    ESNTL_ID              CHAR(20)  NOT NULL ,
CONSTRAINT  COMTNENTRPRSMBER_PK PRIMARY KEY (ENTRPRS_MBER_ID)
);




CREATE TABLE COMTNFILE
(
    ATCH_FILE_ID          CHAR(20)  NOT NULL ,
    CREAT_DT              DATETIME  NOT NULL ,
    USE_AT                CHAR(1)  NULL ,
CONSTRAINT  COMTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
);




CREATE TABLE COMTNFILEDETAIL
(
    ATCH_FILE_ID          CHAR(20)  NOT NULL ,
    FILE_SN               NUMERIC(10)  NOT NULL ,
    FILE_STRE_COURS       VARCHAR(6000)  NOT NULL ,
    STRE_FILE_NM          VARCHAR(765)  NOT NULL ,
    ORIGNL_FILE_NM        VARCHAR(765)  NULL ,
    FILE_EXTSN            VARCHAR(60)  NOT NULL ,
    FILE_CN               STRING  NULL ,
    FILE_SIZE             NUMERIC(8)  NULL ,
CONSTRAINT  COMTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN)
);




CREATE TABLE COMTHEMAILDSPTCHMANAGE
(
    MSSAGE_ID             VARCHAR(60)  NOT NULL ,
    EMAIL_CN              STRING  NULL ,
    SNDR                  VARCHAR(150)  NOT NULL ,
    RCVER                 VARCHAR(150)  NOT NULL ,
    SJ                    VARCHAR(180)  NOT NULL ,
    SNDNG_RESULT_CODE     CHAR(1)  NULL ,
    DSPTCH_DT             CHAR(20)  NOT NULL ,
    ATCH_FILE_ID          CHAR(20)  NULL ,
CONSTRAINT  COMTHEMAILDSPTCHMANAGE_PK PRIMARY KEY (MSSAGE_ID)
);

CREATE TABLE COMTNINDVDLYRYCMANAGE
(
	OCCRRNC_YEAR          CHAR(4)  NOT NULL ,
	YRYC_OCCRRNC_CO       NUMERIC(5,1)  NULL ,
	USE_YRYC_CO           NUMERIC(5,1)  NULL ,
	REMNDR_YRYC_CO        NUMERIC(5,1)  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	USER_ID               VARCHAR(60)  NOT NULL ,
CONSTRAINT  COMTNINDVDLYRYCMANAGE_PK PRIMARY KEY (OCCRRNC_YEAR,USER_ID)
);
