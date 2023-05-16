-- lms_user
CREATE TABLE LMS_USER 
(
  USERID VARCHAR2(20) NOT NULL 
, PWD VARCHAR2(20) NOT NULL 
, PHONE VARCHAR2(50) NOT NULL unique 
, EMAIL VARCHAR2(50) NOT NULL unique
, PRIMARY KEY(userid)
);

INSERT into lms_user (userid,pwd,PHONE,EMAIL)
values('smith','1111','111-1111-1111','smith@naver.com');
-- lms_admin
CREATE TABLE lms_admin 
(
  USERID VARCHAR2(20) NOT NULL 
, PWD VARCHAR2(20) NOT NULL 
, PHONE VARCHAR2(50) NOT NULL unique 
, EMAIL VARCHAR2(50) NOT NULL unique
, PRIMARY KEY(userid)
);

SELECT * FROM lms_admin;

INSERT into lms_admin (userid,pwd,PHONE,EMAIL)
values('smith','1111','111-1111-1111','smith@naver.com');
-- lms_status
CREATE TABLE lms_status
( 
    userid VARCHAR2(20) NOT NULL
    , lvl_code NUMBER NOT NULL
    , lms_num VARCHAR2(20) NOT NULL  
    , test_date TIMESTAMP
    , lms_tnum varchar2(20) NOT NULL
    , lms_qid NUMBER NOT NULL  
    , lms_question VARCHAR2(1000) NOT NULL
    , LMS_AID NUMBER NOT NULL
    , LMS_ANUM VARCHAR2(1000) NOT NULL
    , t_feedback VARCHAR2(1000)
    , lms_scoring number
    , pass CHAR(2) DEFAULT '0'
);
SELECT * FROM lms_status;
SELECT * FROM lms_status WHERE userid='smith' AND lms_tnum = 1 AND pass=1 ORDER BY lms_num;

INSERT INTO lms_status (userid,lvl_code,lms_num,test_date,lms_tnum,lms_qid,lms_question,lms_aid,lms_anum,t_feedback,lms_scoring,pass) VALUES ('smith',1,'1.2',CURRENT_TIMESTAMP,1,1,'질문',1,'1.1','참잘했어요',80,1);

UPDATE lms_status SET lms_aid=?, lms_anum=?, test_date=localtimestamp WHERE userid='smith' AND lms_qid=?;
UPDATE lms_status SET t_feedback='피드백2', pass=1 WHERE lms_tnum =2 AND userid='smith';

DELETE FROM lms_status;
DROP TABLE lms_status;
-- lms_status group by
SELECT userid, lvl_code, lms_num,lms_tnum, test_date,t_feedback,pass FROM lms_status group by userid, lvl_code, lms_num,lms_tnum, test_date,t_feedback,pass order by test_date;
-- lms_lecture
CREATE TABLE "SCOTT"."LMS_LECTURE" 
   (	"LMS_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LVL_CODE" NUMBER, 
	"FNAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"DURATION" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100 BYTE) NOT NULL ENABLE,
    "VNAME" varchar2(100 byte) NOT NULL enable
   );
   
SELECT * FROM lms_lecture;

INSERT INTO LMS_LECTURE VALUES('1.1', 1 ,'https://www.youtube.com/embed/fJeGAx27-vU','05:59','아직도 파이썬을 이렇게 쓰고 있다고?','파이썬의 사용법');
INSERT INTO LMS_LECTURE VALUES('1.2', 1 ,'https://www.youtube.com/embed/1-O4O0z4tRQ','05:14','인기폭풍 파이썬의 비결.5분안에 정리해줌','파이썬의 비결');
INSERT INTO LMS_LECTURE VALUES('1.3', 1 ,'https://www.youtube.com/embed/hgmz0NJugEc','04:12','얼마나 빨라진거야? 파이썬 업그레이드 3분 정리','파이썬의 변화');

INSERT INTO LMS_LECTURE VALUES('2.1', 2 ,'https://www.youtube.com/embed/Awex5glrD7M','04:03','테슬라 로봇 등장에 대해 싸해진 관객 반응','테슬라 로봇');
INSERT INTO LMS_LECTURE VALUES('2.2', 2 ,'https://youtu.be/KU0Z7Am7zmg','02:42','저렇게 작고 얇은 로봇이 통째로 차를 들어버린다','주차 로봇');
INSERT INTO LMS_LECTURE VALUES('2.3', 2 ,'https://youtu.be/Zf_w8jAndJM','01:56','3년 뒤엔 2800만 원 로봇, 인간형 로봇 시대 성큼','인간형 로봇');

INSERT INTO LMS_LECTURE VALUES('3.1', 3 ,'https://youtu.be/ctoYGzc_9hQ','01:47','NASA, 블랙홀 소리 포착…오싹 혹은 황홀','나사가 발표한 블랙홀');
INSERT INTO LMS_LECTURE VALUES('3.2', 3 ,'https://youtu.be/-iA15AXcirU','01.39','외계인 진짜 있을까…미국 나사도 UFO 조사 나선다 ','나사가 조사한 외계인');
INSERT INTO LMS_LECTURE VALUES('3.3', 3 ,'https://youtu.be/64WfbHW7M_Y','02:07','달에 꽤 많은 이것 발견"...나사가 발표한 새 연구 결과','나사가 달에서 발견한것');

DROP TABLE lms_lecture;
-- lms_subject
CREATE TABLE lms_subject (
    lvl_code NUMBER NOT NULL,
    subject_name varchar(100) NOT NULL,
    subject_description varchar(1000) NOT NULL
);

INSERT INTO lms_subject (lvl_code,subject_name,subject_description) VALUES (1,'파이썬','흥미진진한 파이썬');
INSERT INTO lms_subject (lvl_code,subject_name,subject_description) VALUES (2,'로봇','과거,현재,미래의 로봇');
INSERT INTO lms_subject (lvl_code,subject_name,subject_description) VALUES (3,'나사','우리는 나사에 대해 얼마나 알까?');

DROP TABLE lms_subject;
-- lms_history
 CREATE TABLE "SCOTT"."LMS_HISTORY" 
   (	"LMS_NUM" NUMBER NOT NULL ENABLE, 
	"USERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LVL_CODE" NUMBER NOT NULL ENABLE, 
	"LMS_START" TIMESTAMP (6) NOT NULL ENABLE, 
	"LMS_END" TIMESTAMP (6)
   );
SELECT * FROM lms_history;

-- lms_test
CREATE TABLE "SCOTT"."LMS_TEST" 
   (	"LMS_QID" NUMBER NOT NULL ENABLE, 
	"LMS_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LMS_TNUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LMS_QUESTION" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"USERID" VARCHAR2(20 BYTE), 
	"LVL_CODE" NUMBER, 
	"TEST_DATE" TIMESTAMP (6), 
	 CONSTRAINT "LMS_TEST_PK" PRIMARY KEY ("LMS_QID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
DROP TABLE lms_test;

INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('1', '1.1', '-1', '파이썬의 설명으로 옳은것은?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('2', '1.1', '-2', '강사의 이름을 입력하세요', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('3', '1.1', '-3', 'type hint 에 관한 설명으로 옳은것은?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('4', '1.2', '-1', '스택오버플로우 개발자설문에서 있었던 일중에  틀린것은?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('5', '1.2', '-2', '파이썬이 가장 많이 활용되는 3가지를 서술하세요', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('6', '1.2', '-3', '영상에서 설명하지 않은 파이썬이 인기가 많은 이유는?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('7', '1.3', '-1', '파이썬 3.11에 대한 설명으로 틀린것은?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('8', '1.3', '-2', 'Cpython이 하는 일을 서술하세요', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('9', '1.3', '-3', 'Faster Cpython Project 에 대하여 옳은것은 ?', '1');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('10', '2.1', '-1', '테슬라 AI 데이가 개최된 날짜는?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('11', '2.1', '-2', '테슬라의 인공지는 로봇 이름은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('12', '2.1', '-3', '테슬라로봇이 받지 않은 평가는?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('13', '2.2', '-1', '영상에서 소개한 로봇이 하는 일은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('14', '2.2', '-2', '영상에서 소개한 로봇의 이름은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('15', '2.2', '-3', '로봇을 작동하는데 옳은것은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('16', '2.3', '-1', '뉴스에서 설명한 인간형로봇을 활용하는 분야로 틀린것은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('17', '2.3', '-2', '뉴스에서 어떻게 테슬라의 로봇을 평가하였나요?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('18', '2.3', '-3', '로봇에 뛰어든 기업중 틀린것은?', '2');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('19', '3.1', '-1', '나사가 포착한 블랙홀 소리는 어느 매채를 통해 공개되었나요?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('20', '3.1', '-2', '소리를 포착한 블랙홀은 어디에 있는것인가요?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('21', '3.1', '-3', '나사가 소리를 포착한 방법으로 틀린것은? ', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('22', '3.2', '-1', '미국해군 촬영영상에 대한 설명으로 옳지 않은것은?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('23', '3.2', '-2', '어떤 우려로 인해 나사가 미확인 비행현상에 대한 연구에 착수했나요?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('24', '3.2', '-3', '나사가 진행할 연구에 관해 옳지 않은것은?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('25', '3.3', '-1', '나사가 달 표면에서 발견한 것으로 옳은것은?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('26', '3.3', '-2', '우주에서 발견한것으로 우주인이 활용할수 있는 분야는?', '3');
INSERT INTO "SCOTT"."LMS_TEST" (LMS_QID, LMS_NUM, LMS_TNUM, LMS_QUESTION, LVL_CODE) VALUES ('27', '3.3', '-3', '영상에서 설명하지 않은 내용은?', '3');
-- lms_answer
CREATE TABLE "SCOTT"."LMS_ANSWER" 
   (	"LMS_AID" NUMBER NOT NULL ENABLE, 
	"LMS_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LMS_TNUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LMS_ANUM" VARCHAR2(1000 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

DELETE FROM lms_answer;

INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('1', '1.1', '-1', '데이터 유형을 반드시 입력해야한다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('2', '1.1', '-1', '동적방식으로 입력되는 언어이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('3', '1.1', '-1', '파이썬은 정적방식 입력으로 변화 할 것이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('4', '1.1', '-1', '상대적으로 초보자가 배우기 어려운 언어다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('5', '1.1', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('6', '1.1', '-3', '코드를 빨리 읽고 이해하는 것에 도움을 준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('7', '1.1', '-3', 'type hint에 위배되는 상황에는 파이썬이 실행되지 않는다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('8', '1.1', '-3', 'type hint는 틀린 실행문을 수정해준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('9', '1.1', '-3', '파이썬 실행시에 반드시 설치해야하는 시스템이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('10', '1.2', '-1', '올해 파이썬이 자바를 이겼다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('11', '1.2', '-1', '작년에 파이썬이 C#을 이겼다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('12', '1.2', '-1', '재작년에 파이썬이 PHP를 앞질럿다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('13', '1.2', '-1', '올해 파이썬이 C++을 이겼다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('14', '1.2', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('15', '1.2', '-3', '파이썬 언어가 한국어와 닮아 있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('16', '1.2', '-3', '파이썬이 여러 활용법을 갖고 있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('17', '1.2', '-3', '파이썬은 멀티목적 수행이가능한 언어이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('18', '1.2', '-3', '파이썬은 방대한 커뮤니티 규모를 가지고 있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('19', '1.3', '-1', '3.10보다 최대 10~60% 빠르다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('20', '1.3', '-1', 'tomllib라는 모듈을 제공하지 않는다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('21', '1.3', '-1', '예외 노트라는 것을 가지고 있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('22', '1.3', '-1', '더 나은 에러메시지를 갖고있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('23', '1.3', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('24', '1.3', '-3', '파이썬을 15배 더 빠르게 하고자하는 프로젝트다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('25', '1.3', '-3', '파이썬의 창시자 Guido van Rossum이 독단적으로 진행한다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('26', '1.3', '-3', '연간 2.5배 성능향상을 계획한다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('27', '1.3', '-3', '순수 파이썬 코드를 사용하는 도구의 경우 성능향상이 뛰어나다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('28', '2.1', '-1', '2022년 10월 01일');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('29', '2.1', '-1', '2022년 04월 29일');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('30', '2.1', '-1', '2021년 11월 11일');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('31', '2.1', '-1', '2021년 07월 05일');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('32', '2.1', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('33', '2.1', '-3', '90세 노인만큼 빠르고 안정적으로 걷습니다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('34', '2.1', '-3', '원형에 손가락이 다섯개라니!');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('35', '2.1', '-3', '너무 아름다운 외형과 목소리!');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('36', '2.1', '-3', '보스턴 다이내믹스 문닫을 걱정은 안해도되겠네.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('37', '2.2', '-1', '주차에 도움을 준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('38', '2.2', '-1', '차량유지보수에 도움을 준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('39', '2.2', '-1', '차량 속도에 가속을 준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('40', '2.2', '-1', '타이어 마모를 줄여준다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('41', '2.2', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('42', '2.2', '-3', '사람이 간단히 조작한다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('43', '2.2', '-3', '시스템 제어가 불가능하다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('44', '2.2', '-3', '사람이 수동으로 제어가 불가능하다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('45', '2.2', '-3', '강아지가 조작이 가능하다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('46', '2.3', '-1', '개인 비서');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('47', '2.3', '-1', '노약자돌봄');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('48', '2.3', '-1', '대면서비스');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('49', '2.3', '-1', '교통수단');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('50', '2.3', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('51', '2.3', '-3', '현대');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('52', '2.3', '-3', '테슬라');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('53', '2.3', '-3', '영국엔지니어드아치');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('54', '2.3', '-3', '엘지');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('55', '3.1', '-1', '트위터');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('56', '3.1', '-1', '페이스북');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('57', '3.1', '-1', '인스타그램');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('58', '3.1', '-1', '네이버');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('59', '3.1', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('60', '3.1', '-3', '나사가 파동을 소리로 변환했다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('61', '3.1', '-3', '나사가 블랙홀의 음향신호를 68옥타브를 높였다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('62', '3.1', '-3', '인간이 들을 수 있는 소리로 재합성했다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('63', '3.1', '-3', '원래주파수의 28경 8천조 배 높은소리로 제작했다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('64', '3.2', '-1', '바람을 거슬러 올라가고 있다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('65', '3.2', '-1', '바람이 서쪽으로 불고있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('66', '3.2', '-1', '바람이 120노트로 불고있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('67', '3.2', '-1', '2007년에 촬영된 영상이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('68', '3.2', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('69', '3.2', '-3', '정부, 민간, 기업의 UFO자료를 모은다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('70', '3.2', '-3', '올 가을부터 9달동안 진행한다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('71', '3.2', '-3', '보고서는 모두 공개될 예정이다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('72', '3.2', '-3', '보고서 열람시 비용이 청구된다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('73', '3.3', '-1', '물');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('74', '3.3', '-1', '토끼');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('75', '3.3', '-1', '절구');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('76', '3.3', '-1', '방앗간');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('77', '3.3', '-2', '답');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('78', '3.3', '-3', '달의 남반구에 물분자가 100~410ppm 정도로 존재한다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('79', '3.3', '-3', '콜드트랩이 과거 추정치의 두배가 넘는 4만제곱km에 걸쳐 형성되어있다.');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('80', '3.3', '-3', '토끼가 찹쌀떡을 만들고 있었다');
INSERT INTO "SCOTT"."LMS_ANSWER" (LMS_AID, LMS_NUM, LMS_TNUM, LMS_ANUM) VALUES ('81', '3.3', '-3', '콜드트랩안에 실제얼음이 있는지와 물에 접근, 추출하는 방법은 입증하지 못했다.');
  -- lms_test & lms_answer join
  CREATE OR REPLACE VIEW get_lms AS
SELECT *FROM 
(
    SELECT t.lms_qid,t.lms_num, t.lms_tnum, lms_question, lms_anum, a.lms_aid 
    FROM lms_test t
    RIGHT OUTER JOIN lms_answer a
    ON t.lms_tnum = a.lms_tnum AND t.lms_num = a.lms_num
    ORDER BY  lms_num,a.lms_aid 
)t1;

SELECT * FROM get_lms;