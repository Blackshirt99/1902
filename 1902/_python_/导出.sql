--------------------------------------------------------
--  文件已创建 - 星期一-九月-02-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_TYPES
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATION"."SEQ_TYPES"  MINVALUE 16 MAXVALUE 999 INCREMENT BY 1 START WITH 36 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATION"."SEQ_USERS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "LOCATION"."LOCATIONS" 
   (	"ID" NUMBER, 
	"TYPE_ID" NUMBER, 
	"NAME" NVARCHAR2(15), 
	"LATITUDE" NUMBER(13,10), 
	"LONGITUDE" NUMBER(13,10), 
	"DES" NVARCHAR2(200)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TYPES
--------------------------------------------------------

  CREATE TABLE "LOCATION"."TYPES" 
   (	"ID" NUMBER, 
	"TYPE_NAME" NVARCHAR2(6), 
	"PARENT_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "LOCATION"."USERS" 
   (	"USER_ID" NUMBER, 
	"USER_NAME" NVARCHAR2(20), 
	"PWD" CHAR(6 CHAR), 
	"IS_SUPER" NUMBER(1,0), 
	"ACCOUNT_STATE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into LOCATION.LOCATIONS
SET DEFINE OFF;
Insert into LOCATION.LOCATIONS (ID,TYPE_ID,NAME,LATITUDE,LONGITUDE,DES) values (1,13,'瑞幸咖啡',32.1566991236,118.6974692345,'瑞幸咖啡,首杯不要钱。');
Insert into LOCATION.LOCATIONS (ID,TYPE_ID,NAME,LATITUDE,LONGITUDE,DES) values (2,13,'便利蜂',32.1566991236,118.6974692345,'便利蜂，一个生产“蜂蜜的地方”。');
Insert into LOCATION.LOCATIONS (ID,TYPE_ID,NAME,LATITUDE,LONGITUDE,DES) values (3,13,'金元宝快餐厅',32.155627325,118.6971259117,'金元宝快餐厅');
Insert into LOCATION.LOCATIONS (ID,TYPE_ID,NAME,LATITUDE,LONGITUDE,DES) values (4,3,'江北龙湖天街',32.1577300367,118.696975708,'江北龙湖天街');
Insert into LOCATION.LOCATIONS (ID,TYPE_ID,NAME,LATITUDE,LONGITUDE,DES) values (5,2,'明康眼科医院',32.1652957642,118.7043678761,'明康眼科医院');
REM INSERTING into LOCATION.TYPES
SET DEFINE OFF;
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (17,'type1',null);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (1000,'分类',null);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (1,'美食',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (2,'医院',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (3,'购物',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (4,'公交',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (5,'加油站',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (6,'住宿',1000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (2000,'周边',null);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (7,'500米以内',2000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (8,'1公里以内',2000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (9,'2公里以内',2000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (10,'3公里以内',2000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (11,'5公里以内',2000);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (12,'小龙虾',1);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (13,'快餐',1);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (14,'烧烤',1);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (15,'火锅',1);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (18,'籇书',null);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (19,'type2',2);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (20,'sss',null);
Insert into LOCATION.TYPES (ID,TYPE_NAME,PARENT_ID) values (21,'xxxx',null);
REM INSERTING into LOCATION.USERS
SET DEFINE OFF;
Insert into LOCATION.USERS (USER_ID,USER_NAME,PWD,IS_SUPER,ACCOUNT_STATE) values (1,'wang','123456',1,1);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "LOCATION"."USERS" ADD CONSTRAINT "CK_PWD_LEN" CHECK (length(trim(pwd))=6) ENABLE;
  ALTER TABLE "LOCATION"."USERS" MODIFY ("USER_NAME" CONSTRAINT "CK_USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "LOCATION"."USERS" MODIFY ("PWD" NOT NULL ENABLE);
  ALTER TABLE "LOCATION"."USERS" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "LOCATION"."USERS" ADD CONSTRAINT "CK_USERS_STATE" CHECK (account_state in (0,1)) ENABLE;
  ALTER TABLE "LOCATION"."USERS" ADD CHECK (is_super in (0,1)) ENABLE;
