-- ���̺� �����
DROP TABLE TB_FILE;
DROP TABLE TB_HASHTAG;
DROP TABLE TB_REPORT;
DROP TABLE TB_COURSE;
--DROP TABLE TB_NOTICE;
DROP TABLE TB_ANSWER;
DROP TABLE TB_QUESTION;
DROP TABLE TB_VISIT;
--DROP TABLE TB_REVIEW;
--DROP TABLE TB_REPLY;
DROP TABLE TB_REVIEW_REPLY;

DROP TABLE TB_BOARD;
DROP TABLE TB_LIKE;
DROP TABLE TB_PLACE;
DROP TABLE TB_MEMBER;
DROP TABLE TB_GRADE;
DROP TABLE TB_CATEGORY;
DROP TABLE TB_LOCATION;




-- ������ �����
DROP SEQUENCE SEQ_FILE; -- �ΰ� ������
DROP SEQUENCE SEQ_CNO; -- ī�װ� ������
DROP SEQUENCE SEQ_LNO; -- �����̼� ������
DROP SEQUENCE SEQ_PNO; -- ��� ������
DROP SEQUENCE SEQ_BNO; -- �Խ��� ������
DROP SEQUENCE SEQ_MNO; -- ��� ������
--DROP SEQUENCE SEQ_NNO;  -- ���� ������
DROP SEQUENCE SEQ_QNO;  -- ���� ��ȣ ������
DROP SEQUENCE SEQ_ANO;  -- �亯 ��ȣ �߻���ų ������
DROP SEQUENCE SEQ_RENO; -- �Ű��ȣ �߻���ų ������
DROP SEQUENCE SEQ_CONO; -- �ڽ���ȣ �߻���ų ������
--DROP SEQUENCE SEQ_RVNO; -- ���� ������
--DROP SEQUENCE SEQ_RPNO; -- ��� ������
DROP SEQUENCE SEQ_RVRP;



---------------------------------------------------------
---------------------- ���̺� ������ ----------------------
---------------------------------------------------------

-- ���ƿ� ���̺�
CREATE TABLE TB_LIKE(
    MEM_NO VARCHAR2(100) NOT NULL,
    BOARD_NO VARCHAR2(300) NOT NULL,
    PRIMARY KEY (MEM_NO, BOARD_NO)
);
COMMENT ON COLUMN TB_LIKE.MEM_NO IS '���ƿ� ���� ���';
COMMENT ON COLUMN TB_LIKE.BOARD_NO IS '���ƿ� �����Խñ�';


-- ��ġ ���̺�
CREATE TABLE TB_LOCATION (
    LOCATION_NO NUMBER PRIMARY KEY,
    LOCATION_NAME VARCHAR2(15) NOT NULL
);
COMMENT ON COLUMN TB_LOCATION.LOCATION_NO IS '��ġ�ڵ�';
COMMENT ON COLUMN TB_LOCATION.LOCATION_NAME IS '��ġ��(OO��)';

CREATE SEQUENCE SEQ_LNO NOCACHE;


-- ī�װ� ���̺�
CREATE TABLE TB_CATEGORY (
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NO IS 'ī�װ���ȣ';
COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NAME IS 'ī�װ���';

CREATE SEQUENCE SEQ_CNO NOCACHE;


-- ��� ���̺�
CREATE TABLE TB_GRADE (
GRADE VARCHAR2(30) PRIMARY KEY,
MEDAL VARCHAR2(500) NOT NULL,
MINPOINT NUMBER NOT NULL,
MAXPOINT NUMBER NOT NULL
);
COMMENT ON COLUMN TB_GRADE.GRADE IS '����̸�';
COMMENT ON COLUMN TB_GRADE.MEDAL IS '�޴޻���÷������';


-- ȸ�� ���̺�
CREATE TABLE TB_MEMBER (
    MEM_NO VARCHAR2(100) PRIMARY KEY,
    GRADE VARCHAR2(30) DEFAULT '����' NOT NULL,
    FOREIGN KEY (GRADE) REFERENCES TB_GRADE,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    NICKNAME VARCHAR2(30) NOT NULL UNIQUE,
    EMAIL VARCHAR2(100),
    MBTI VARCHAR(4),
    MEM_PHONE VARCHAR2(13) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    MEM_STATUS CHAR(1) DEFAULT 'U' NOT NULL,
    MEM_VISIT DATE DEFAULT SYSDATE,
    MEM_BIRTHDAY DATE,
    MEM_POINT NUMBER DEFAULT 0 NOT NULL
);
COMMENT ON COLUMN TB_MEMBER.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.GRADE IS 'ȸ�����';
COMMENT ON COLUMN TB_MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN TB_MEMBER.MEM_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBER.MEM_NAME IS 'ȸ����';
COMMENT ON COLUMN TB_MEMBER.NICKNAME IS '�г���';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN TB_MEMBER.MBTI IS 'MBTI';
COMMENT ON COLUMN TB_MEMBER.MEM_PHONE IS '�޴�����ȣ';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS 'ȸ��������';
COMMENT ON COLUMN TB_MEMBER.MEM_STATUS IS 'U(�Ϲݻ����)B(���������)A(������)';
COMMENT ON COLUMN TB_MEMBER.MEM_VISIT IS '�ֱ����ӽð�';
COMMENT ON COLUMN TB_MEMBER.MEM_BIRTHDAY IS '������� 8��';
COMMENT ON COLUMN TB_MEMBER.MEM_POINT IS 'ȸ������Ʈ';

CREATE SEQUENCE SEQ_MNO NOCACHE;

-- ��� ���̺�
CREATE TABLE TB_PLACE(
PLACE_NO VARCHAR2(100) NOT NULL PRIMARY KEY,
PLACE_TITLE VARCHAR2(500) NOT NULL,
CATEGORY_NO NUMBER NOT NULL REFERENCES TB_CATEGORY,
WRITER VARCHAR2(100) NOT NULL REFERENCES TB_MEMBER,
LOCATION_NO NUMBER NOT NULL REFERENCES TB_LOCATION,
MAKE_DATE DATE DEFAULT SYSDATE NOT NULL,
STATUS VARCHAR2(1)DEFAULT 'Y' NOT NULL,
PHONE VARCHAR2(15) NOT NULL ,
ADDRESS VARCHAR2(4000) NOT NULL,
PLACE_CONTENT VARCHAR2(4000) NOT NULL,
START_TIME VARCHAR2(10) NOT NULL,
END_TIME VARCHAR2(10) NOT NULL,
STAR_POINT NUMBER DEFAULT 0 NOT NULL ,
PLACE_URL VARCHAR2(4000),
VIEW_COUNT NUMBER,
USE_TIME NUMBER NOT NULL,
USE_PRICE NUMBER NOT NULL,
BEST_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(BEST_STATUS IN('Y','N')),
LIKECOUNT NUMBER DEFAULT 0 
);
COMMENT ON COLUMN TB_PLACE.PLACE_NO IS '����ڵ� SEQ_PNO';
COMMENT ON COLUMN TB_PLACE.PLACE_TITLE IS '�������';
COMMENT ON COLUMN TB_PLACE.CATEGORY_NO IS 'ī�װ� ��ȣ';
COMMENT ON COLUMN TB_PLACE.WRITER IS '�ۼ���';
COMMENT ON COLUMN TB_PLACE.LOCATION_NO IS '��ġ�ڵ�';
COMMENT ON COLUMN TB_PLACE.MAKE_DATE IS '�ۼ���¥';
COMMENT ON COLUMN TB_PLACE.STATUS IS '�ۻ��� Y N';
COMMENT ON COLUMN TB_PLACE.PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN TB_PLACE.ADDRESS IS '���ּ�';
COMMENT ON COLUMN TB_PLACE.PLACE_CONTENT IS '�󼼳���';
COMMENT ON COLUMN TB_PLACE.START_TIME IS '�������۽ð�';
COMMENT ON COLUMN TB_PLACE.END_TIME IS '��������ð�';
COMMENT ON COLUMN TB_PLACE.STAR_POINT IS '����';
COMMENT ON COLUMN TB_PLACE.PLACE_URL IS '������������';
COMMENT ON COLUMN TB_PLACE.VIEW_COUNT IS '��ȸ��';
COMMENT ON COLUMN TB_PLACE.USE_TIME IS '�ҿ�ð�';
COMMENT ON COLUMN TB_PLACE.USE_PRICE IS '�ҿ䰡��';
COMMENT ON COLUMN TB_PLACE.BEST_STATUS IS '����Ʈ�Խù�����';

CREATE SEQUENCE  SEQ_PNO
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    INCREMENT BY 1
    START WITH 1
    NOCACHE
    NOORDER
    NOCYCLE ;


-- �����Խ��� ���̺�
CREATE TABLE TB_BOARD(
    BOARD_NO VARCHAR2(100) PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    WRITER VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0 NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOARD_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (BOARD_STATUS IN('Y','N')),
    BOARD_UP VARCHAR2(1) DEFAULT 'N',
    FOREIGN KEY(WRITER) REFERENCES TB_MEMBER(MEM_NO)
);
COMMENT ON COLUMN TB_BOARD.BOARD_NO IS '�Խñ۹�ȣ(SEQ_FBNO)';
COMMENT ON COLUMN TB_BOARD.BOARD_TITLE IS '�Խñ�����';
COMMENT ON COLUMN TB_BOARD.WRITER IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_BOARD.BOARD_CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN TB_BOARD.BOARD_COUNT IS '��ȸ��';
COMMENT ON COLUMN TB_BOARD.CREATE_DATE IS '�ۼ���';
COMMENT ON COLUMN TB_BOARD.BOARD_STATUS IS '�ۻ���(Y(�Խ�)|N(����)';

CREATE SEQUENCE SEQ_BNO
NOCACHE;


-- ��� ���̺�
--CREATE TABLE TB_REPLY (
--   REPLY_NO VARCHAR2(100) PRIMARY KEY,
--   REPLY_WRITER VARCHAR2(100) NOT NULL,
--   BOARD_NO VARCHAR2(100)   NOT NULL,
--   REPLY_CONTENT VARCHAR2(4000) NOT NULL,
--   REPLY_LIKE NUMBER DEFAULT 0 NOT NULL,
--   REPLY_DATE DATE DEFAULT SYSDATE NOT NULL,
--   REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (REPLY_STATUS IN('Y','N')),
--   FOREIGN KEY (REPLY_WRITER) REFERENCES TB_MEMBER,
--   FOREIGN KEY (BOARD_NO) REFERENCES TB_BOARD
--);
--COMMENT ON COLUMN TB_REPLY.REPLY_NO IS '�۹�ȣ';
--COMMENT ON COLUMN TB_REPLY.REPLY_WRITER IS '����ۼ���';
--COMMENT ON COLUMN TB_REPLY.BOARD_NO IS '�Խñ۹�ȣ';
--COMMENT ON COLUMN TB_REPLY.REPLY_CONTENT IS '�۳���';
--COMMENT ON COLUMN TB_REPLY.REPLY_LIKE IS '���ƿ�';
--COMMENT ON COLUMN TB_REPLY.REPLY_DATE IS '�ۼ���';
--COMMENT ON COLUMN TB_REPLY.REPLY_STATUS IS '�ۻ��� Y(�Խ�) | N(����)';
--
--CREATE SEQUENCE SEQ_RPNO NOCACHE;

CREATE TABLE TB_REVIEW_REPLY(
    RE_NO VARCHAR2(255) PRIMARY KEY,
    RE_REF_NO VARCHAR2(100) NOT NULL,
    RE_WRITER VARCHAR2(100) NOT NULL,
--    RE_ORIGIN_WRITER VARCHAR2(100) NOT NULL,
    RE_CONTENT VARCHAR2(4000) NOT NULL,
    RE_LIKE_STAR NUMBER DEFAULT 0 NOT NULL,
    RE_REF_STAR NUMBER DEFAULT 1 NOT NULL,
    RE_DATE DATE DEFAULT SYSDATE NOT NULL,
--    RE_LEVEL VARCHAR2(1) NOT NULL,
    RE_STATUS VARCHAR2(1) DEFAULT 'N' NOT NULL
    );

CREATE SEQUENCE SEQ_RVRP NOCACHE;
    
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_NO IS '����(RV)/����(RP) ��ȣ';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_REF_NO IS '���/�� ��ȣ';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_WRITER IS '���/�� �����ۼ���';
--COMMENT ON COLUMN TB_REVIEW_REPLY.RE_ORIGIN_WRITER IS '���/�� �ۼ���';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_CONTENT IS '����/���� ����';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_LIKE_STAR IS '����/���ƿ�';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_DATE IS '�ۼ���';
--COMMENT ON COLUMN TB_REVIEW_REPLY.RE_LEVEL IS '1(����)/2(����)';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_STATUS IS '����/���� ����(Y:����)';
COMMENT ON COLUMN TB_REVIEW_REPLY.RE_REF_STAR IS '�Խù� ����';


-- ���� ���̺�
--CREATE TABLE TB_REVIEW (
--   REVIEW_NO VARCHAR2(255) PRIMARY KEY,
--   PLACE_NO VARCHAR2(100) REFERENCES TB_PLACE,
--   REVIEW_WRITER VARCHAR2(100) REFERENCES TB_MEMBER,
--   REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
--   REVIEW_CONTENT VARCHAR2(4000) NOT NULL
--);
--COMMENT ON COLUMN TB_REVIEW.REVIEW_NO IS '����۹�ȣ';
--COMMENT ON COLUMN TB_REVIEW.PLACE_NO IS '��ҹ�ȣ';
--COMMENT ON COLUMN TB_REVIEW.REVIEW_WRITER IS '���ۼ���';
--COMMENT ON COLUMN TB_REVIEW.REVIEW_DATE IS '�ۼ���';
--COMMENT ON COLUMN TB_REVIEW.REVIEW_CONTENT IS '�۳���';
--
--CREATE SEQUENCE SEQ_RVNO NOCACHE;


-- �湮 �Խñ� ���̺�
CREATE TABLE TB_VISIT(
    VISIT_DATE DATE DEFAULT SYSDATE NOT NULL,
    MEM VARCHAR2(100) REFERENCES TB_MEMBER(MEM_NO),
    PLACE_NO VARCHAR2(100) NOT NULL,
    FOREIGN KEY(PLACE_NO) REFERENCES TB_PLACE
    );
COMMENT ON COLUMN TB_VISIT.VISIT_DATE IS '�湮��¥';
COMMENT ON COLUMN TB_VISIT.MEM IS 'ȸ����';
COMMENT ON COLUMN TB_VISIT.PLACE_NO IS '����ڵ�';


-- ���� �Խ��� ���� ���̺�
CREATE TABLE TB_QUESTION(
    QUESTION_NO NUMBER PRIMARY KEY,
    QUESTION_COMMENT VARCHAR2(4000) NOT NULL,
    QUESTION_DATE DATE DEFAULT SYSDATE NOT NULL,
    QUESTION_SECRET VARCHAR2(1) DEFAULT 'N' CHECK(QUESTION_SECRET IN ('Y','N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    QUESTION_WRITER VARCHAR2(100) NOT NULL,
    FOREIGN KEY(QUESTION_WRITER) REFERENCES TB_MEMBER
    );
COMMENT ON COLUMN TB_QUESTION.QUESTION_NO IS '�����۹�ȣ';
COMMENT ON COLUMN TB_QUESTION.QUESTION_COMMENT IS '��������';
COMMENT ON COLUMN TB_QUESTION.QUESTION_DATE IS '�����ۼ���';
COMMENT ON COLUMN TB_QUESTION.QUESTION_SECRET IS '��������(Y/N)';
COMMENT ON COLUMN TB_QUESTION.STATUS IS '�ۻ���(Y/N)';
COMMENT ON COLUMN TB_QUESTION.QUESTION_WRITER IS '������ȸ����ȣ';

CREATE SEQUENCE SEQ_QNO NOCACHE;


-- ���� �Խ��� �亯 ���̺�
CREATE TABLE TB_ANSWER(
    ANSWER_NO NUMBER PRIMARY KEY,
    QUESTION_NO NUMBER NOT NULL,
    ANSWER_WRITER VARCHAR2(100) NOT NULL,
    ANSWER_OR_NOT VARCHAR2(1) DEFAULT 'Y' CHECK(ANSWER_OR_NOT IN ('Y','N')),
    ANSWER_CONTENT VARCHAR2(4000) NOT NULL,
    ANSWER_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STATUS IN('Y','N')),
    FOREIGN KEY (ANSWER_WRITER) REFERENCES TB_MEMBER(MEM_NO),
    FOREIGN KEY (QUESTION_NO) REFERENCES TB_QUESTION(QUESTION_NO)
    );

COMMENT ON COLUMN TB_ANSWER.ANSWER_NO IS '�亯�۹�ȣ';
COMMENT ON COLUMN TB_ANSWER.ANSWER_OR_NOT IS '�亯����';
COMMENT ON COLUMN TB_ANSWER.ANSWER_CONTENT IS '�亯����';
COMMENT ON COLUMN TB_ANSWER.ANSWER_DATE IS '�亯�ۼ���';
COMMENT ON COLUMN TB_ANSWER.STATUS IS '�ۻ���(Y/N)';
COMMENT ON COLUMN TB_ANSWER.ANSWER_WRITER IS '�亯��ȸ����ȣ';
COMMENT ON COLUMN TB_ANSWER.QUESTION_NO IS '������ ��ȣ';

CREATE SEQUENCE SEQ_ANO NOCACHE;




---- ���� ���̺�
--CREATE TABLE TB_NOTICE (
--   NOTICE_NO VARCHAR2(100) PRIMARY KEY,
--   NOTICE_WRITER VARCHAR2(100) NOT NULL REFERENCES TB_MEMBER,
--   NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
--   NOTICE_HITS   NUMBER DEFAULT 0 NOT NULL,
--   NOTICE_DATE   DATE DEFAULT SYSDATE NOT NULL,
--   NOTICE_STATUS CHAR(1) DEFAULT 'Y' CHECK (NOTICE_STATUS IN('Y','N')),
--   NOTICE_MAIN   VARCHAR2(1) DEFAULT 'N' CHECK (NOTICE_MAIN IN('Y','N'))
--);
--COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '�����۹�ȣ';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_WRITER IS '�ۼ��ڸ�';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '�Խñ۳���';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_HITS IS '��ȸ��';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_DATE IS '�ۼ���';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_STATUS IS '�ۻ��� Y(�Խ�) | N(����)';
--COMMENT ON COLUMN TB_NOTICE.NOTICE_MAIN IS '�������� N ����� Y';
--
--CREATE SEQUENCE SEQ_NNO NOCACHE;


-- �ڽ� ���̺�
CREATE TABLE TB_COURSE(
    COURSE_NO VARCHAR2(100)PRIMARY KEY,
    COURSE_WRITER VARCHAR2(100) NOT NULL,
    PALCE1 VARCHAR2(30) NOT NULL,
    PLACE2 VARCHAR2(30) NULL,
    PLACE3 VARCHAR2(30),
    PLACE4 VARCHAR2(30),
    PLACE5 VARCHAR2(30),
    COURSE_TIME NUMBER NOT NULL,
    COURSE_MONEY NUMBER NOT NULL,
    FOREIGN KEY(COURSE_WRITER) REFERENCES TB_MEMBER(MEM_NO)
);


COMMENT ON COLUMN TB_COURSE.COURSE_NO IS '�ڽ����̺� �� ��ȣ';
COMMENT ON COLUMN TB_COURSE.COURSE_WRITER IS '�ڽ��ۼ���';
COMMENT ON COLUMN TB_COURSE.PALCE1 IS '�ڽ� ù��°���';
COMMENT ON COLUMN TB_COURSE.PLACE2 IS '�ڽ� �ι�° ���';
COMMENT ON COLUMN TB_COURSE.PLACE3 IS '�ڽ� ����° ���';
COMMENT ON COLUMN TB_COURSE.PLACE4 IS '�ڽ� �׹�° ���';
COMMENT ON COLUMN TB_COURSE.PLACE5 IS '�ڽ� �ټ���° ���';
COMMENT ON COLUMN TB_COURSE.COURSE_TIME IS '�ڽ��� ���� �ð�';
COMMENT ON COLUMN TB_COURSE.COURSE_MONEY IS '�ڽ��� ���� ���';

CREATE SEQUENCE SEQ_CONO
NOCACHE;


-- �Ű� �Խ��� ���̺�
CREATE TABLE TB_REPORT(
    REPORT_NO NUMBER PRIMARY KEY,
    REPORTER VARCHAR2(100) NOT NULL,
    REPORTED VARCHAR2(100) NOT NULL,
    REPORT_CATEGORY VARCHAR2(30) NOT NULL,
    REPORT_CONTENT VARCHAR2(4000) NOT NULL,
    REPORT_DATE DATE ,
    REPORT_COMPLITE DATE,
    REPORT_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(REPORT_STATUS IN('Y','N')),
    POST_NO VARCHAR(10) NOT NULL,
    FOREIGN KEY(REPORTER) REFERENCES TB_MEMBER(MEM_NO),
    FOREIGN KEY(REPORTED) REFERENCES TB_MEMBER(MEM_NO)
);
COMMENT ON COLUMN TB_REPORT.REPORT_NO IS '�Ű��ȣ';
COMMENT ON COLUMN TB_REPORT.REPORTER IS '�Ű���';
COMMENT ON COLUMN TB_REPORT.REPORTED IS '�ǽŰ���';
COMMENT ON COLUMN TB_REPORT.REPORT_CATEGORY IS '�Ű�����';
COMMENT ON COLUMN TB_REPORT.REPORT_CONTENT IS '�Ű���';
COMMENT ON COLUMN TB_REPORT.REPORT_DATE IS '�Ű�ð�';
COMMENT ON COLUMN TB_REPORT.REPORT_COMPLITE IS 'ó���ð�';
COMMENT ON COLUMN TB_REPORT.REPORT_STATUS IS 'ó�����¿Ϸ�Y�̿Ϸ�N';
COMMENT ON COLUMN TB_REPORT.POST_NO IS '�����Խñ۹�ȣ';

CREATE SEQUENCE SEQ_RENO
NOCACHE;


-- �ؽ��±� ���̺�
CREATE TABLE TB_HASHTAG (
    PLACE_NO VARCHAR2(100) NOT NULL,
    HASHTAG_NAME VARCHAR2(300) NOT NULL
);
COMMENT ON COLUMN TB_HASHTAG.PLACE_NO IS '����ڵ�';
COMMENT ON COLUMN TB_HASHTAG.HASHTAG_NAME IS '�ؽ��±�(#������,..)';

-- ���� ���̺�
CREATE TABLE TB_FILE (
   FILE_NO VARCHAR2(100) PRIMARY KEY,
   ORIGIN_NAME   VARCHAR2(255) NOT NULL,
   CHANGE_NAME VARCHAR2(255) NOT NULL,
   FILE_PATH VARCHAR2(1000) NOT NULL,
   UPLOAD_DATE   DATE DEFAULT SYSDATE NOT NULL,
   REF_NO VARCHAR2(100) NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   FILE_LEVEL NUMBER DEFAULT 0 NOT NULL
);
COMMENT ON COLUMN TB_FILE.FILE_NO IS '���Ϲ�ȣ';
COMMENT ON COLUMN TB_FILE.ORIGIN_NAME IS '���Ͽ�����';
COMMENT ON COLUMN TB_FILE.CHANGE_NAME IS '���ϼ�����';
COMMENT ON COLUMN TB_FILE.FILE_PATH IS '���ϰ��(URL)';
COMMENT ON COLUMN TB_FILE.UPLOAD_DATE IS '���ε���';
COMMENT ON COLUMN TB_FILE.REF_NO IS '�������ϸ�';
COMMENT ON COLUMN TB_FILE.STATUS IS '���ϻ���';
COMMENT ON COLUMN TB_FILE.FILE_LEVEL IS '1�����, 2������';

CREATE SEQUENCE SEQ_FILE NOCACHE;


-------------------------------------------------------
---------------------- INSERT -------------------------
-------------------------------------------------------
INSERT INTO TB_LIKE
VALUES ('M1','RP1'); -- m2 �ۼ� ���
INSERT INTO TB_LIKE
VALUES ('M3','RP1');
INSERT INTO TB_LIKE
VALUES ('M4','RP1');
INSERT INTO TB_LIKE
VALUES ('M5','RP1');

INSERT INTO TB_LIKE
VALUES ('M1','RP2'); -- m3 �ۼ� ���
INSERT INTO TB_LIKE
VALUES ('M2','RP2');
INSERT INTO TB_LIKE
VALUES ('M6','RP2');
INSERT INTO TB_LIKE
VALUES ('M7','RP2');

INSERT INTO TB_LIKE
VALUES ('M3','RP3'); -- m4 �ۼ� ���

INSERT INTO TB_LIKE
VALUES ('M3','RP4'); -- m7 �ۼ� ���
INSERT INTO TB_LIKE
VALUES ('M6','RP4');
INSERT INTO TB_LIKE
VALUES ('M8','RP4');


INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���ʱ�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���۱�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'��õ��');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���α�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'��õ��');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���Ǳ�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'��������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���ı�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'��걸');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���빮��');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'�߱�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���빮��');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'�߶���');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���α�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���ϱ�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'����');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'���ϱ�');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'������');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'�����');



INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'ȣ��');
INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'ī��');
INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'�Ĵ�');

INSERT INTO TB_GRADE
VALUES ('����','/resource/img/grade/����.gif',0,50);
INSERT INTO TB_GRADE
VALUES ('�ܵ�','/resource/img/grade/�ܵ�.gif',51,100);
INSERT INTO TB_GRADE
VALUES ('����','/resource/img/grade/����.gif',101,200);
INSERT INTO TB_GRADE
VALUES ('����','/resource/img/grade/����.gif',201,30000);
INSERT INTO TB_GRADE
VALUES ('����ȭ','/resource/img/grade/�¾�.gif',30001,99999);


INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,ENROLL_DATE,MEM_STATUS,MEM_VISIT,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL ,'����ȭ','admin','admin','������','������','admin@admin.com','ISTJ','010-1234-5678',SYSDATE,'Y','2023-02-10','1988-01-01',99999);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user01','pass01','�̿���','����¯¯','onejong@naver.com','ISFJ','010-2345-6789','1988-01-02',250);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_STATUS,MEM_VISIT,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user02','pass02','������','���ְ��','hehe@gmail.com','ESTP','010-1594-3578','Y','1988-01-03',350);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MEM_PHONE,MEM_STATUS,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'�ܵ�','user03','pass03','ȫ���','�߻�����','upOne@kakao.com','010-3698-4578','N','2000-12-31',400);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user04','pass04','�ڿ���','����','yj@yj.com','ISFP','010-8520-9630','1988-01-05',10);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user05','pass05','������','����ø޺�','ssonapple@love.com','010-7894-3215','1988-01-06',150);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user06','pass06','��ÿ�','��������','angToAng@ang.com','ESTJ','010-4568-9513','1988-01-07',30);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'�ܵ�','user07','pass07','������','��Ŵ���','mannager@man.com','ESFJ','010-4567-3547','1988-01-08',80);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES ('M'||SEQ_MNO.NEXTVAL,'����','user08','pass08','�ڹμ�','�������','tang@tangg.com','ENFP','010-1596-3574','1988-01-09',90);


INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'���ִ� ��ġ�',3,'M1',1,to_date('24/02/13','RR/MM/DD'),'Y','02-1234-2222','����Ư���� ������ ���ﵿ 123-45','�ѱ� ���� �������� ������ ��ġ� �������Դϴ�. �ż��� ���� ������ ������ �մԵ��� �Ը��� �������ϴ�.','2','4',3,'https://www.naver.com/search.naver?query=��ġ�������',5,4,40000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'����� ��ⱸ��',3,'M2',1,to_date('24/02/13','RR/MM/DD'),'N','02-5556-1561','����Ư���� ������ �Ż絿 678-90','�ż��� ���� Ư���� ������� ���� ���� ��ⱸ�� �������Դϴ�. ǳ���� ��� ǳ�̷� �մԵ鿡�� ��ſ� �Ļ� ������ �����մϴ�.','5','15',4,'https://www.naver.com/search.naver?query=���������',20,42,34000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'�ż��� �ػ깰 �丮',3,'M3',1,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ������ û�㵿 321-54','�ػ깰�� �� ���� ����ϴ� �丮���� Ư¡�� �Ĵ��Դϴ�. ���� �ż��� �ػ깰�� ���޹޾� �ż����� ���� �޴��� �����մϴ�.','7','14',1,'https://www.naver.com/search.naver?query=�ػ깰������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'Ǫ���� ������',3,'M4',1,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ������ ������ 987-65','������ �ѽ� �������� �����ϴ� �Ĵ��Դϴ�. Ǫ���� �Ļ�� ��޽����� ������� �մԵ��� �����մϴ�.','7','14',1,'https://www.naver.com/search.naver?query=������������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'�����',3,'M5',1,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ������ �Ｚ�� 456-782','"�����"�� �ֻ��� ǰ���� �ڶ��ϴ� ���� �丮�� �������� �ϴ� �����Դϴ�. �ż��� ���� ������ ������� ������ ����� �մԵ鿡�� ���� ���� ǳ��ο��� �����մϴ�.','7','14',1,'https://www.naver.com/search.naver?query=����������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'������ ǻ�� �丮',3,'M6',2,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���ʱ� ���ʵ� 123-45','�����ƽþ� ������ ���� ǻ�� �丮�� ��췯�� �Ĵ��Դϴ�. ��ä�ο� ���� ���� ��� �� �ֽ��ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=ǻ���丮������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'��Ż���� ���� ������',3,'M7',2,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���ʱ� ������ 678-90','�ż��� ���� ���� ��Ż���� �����Ƿ� ���� ���ڸ� �����ϴ� �������Դϴ�. �ٻ��� ũ����Ʈ�� ǳ���� ������ Ư¡�Դϴ�.','7','14',1,'https://www.naver.com/search.naver?query=��Ż��������������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'�ǰ��� ������ ��',3,'M8',2,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���ʱ� ����� 321-54','�ż��� ä�ҿ� ������ ����Ͽ� �ǰ��� �����带 ����� ���Դϴ�. �پ��� �ɼǰ� �ҽ��� ���� ���� �� �ֽ��ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=������������',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'�������� ���� ��',3,'M1',2,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���ʱ� ��赿 987-65','��ǳ������ ������� ��ä�ο� ������ ��� �� �ִ� ���Դϴ�. �������� ���׸���� �Ǹ��� ���� ������� �մԵ��� �ŷ��ŵ�ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=���ι�',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'���Ѹ����±�',3,'M2',2,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���ʱ� ���絿 456-78','�±� �丮�� Ư���� ���� ���� ��� �� �ִ� �Ĵ��Դϴ�. ������ ���� �ż��� ���� ���� �丮���� �α⸦ ���� �ֽ��ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=���Ѹ����ѽ�',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'�ż��� �Ϻ� �ʹ�',3,'M3',3,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���۱� �뷮���� 123-45',' �ż��� ���� ������ �ؾ��� ���� �Ϻ��� �ʹ��� ��� �� �ִ� ���Դϴ�. ���� �Ϻ� �丮�� ���� ������ �� �ֽ��ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=�Ϻ��ʹ�',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'������ �±� ����',3,'M4',3,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���۱� �󵵵� 678-90','�±� �丮�� Ư���� ���� ���� ��� �� �ִ� �Ĵ��Դϴ�. ������ ���� �ż��� ���� ���� �丮���� �α��Դϴ�.','7','14',1,'https://www.naver.com/search.naver?query=�±�����',33,33,4000,'N',0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL,'��޽����� ����ġ �������',3,'M5',3,to_date('24/02/13','RR/MM/DD'),'Y','02-1111-2222','����Ư���� ���۱� ��絿 321-54','��޽����� ������� ������ �丮�� �մԵ��� �����ϴ� ����ġ ��������Դϴ�. ������ �丮�� ���� ���� ������ �� �ֽ��ϴ�.','7','14',1,'https://www.naver.com/search.naver?query=�������',33,33,4000,'N',0);

INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, '�׶�λ� (Terrarosa)', 2, 'M1', 1, to_date('02/13/2024', 'MM/DD/RRRR'), 'Y', '02-555-1234', '����Ư���� ������ ����� 319', '������ ���ﵿ�� ��ġ�� �� ī��� ��޽����� ������� �Ǹ��� Ŀ�Ƿ� �����մϴ�.', '8', '23', 3, 'https://www.naver.com/search.naver?query=�׷��λ�', 4, 120, 12000, 'Y', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'ī�� ���� ���� (Cafe of Roof)', 2, 'M2', 1, to_date('02/14/2024', 'MM/DD/RRRR'), 'Y', '02-123-4567', '����Ư���� ������ �Ｚ�� 605', '�Ｚ���� ��ġ�� �� ī��� Ź Ʈ�� ���� �׶󽺿��� ������ ������ ��� �� �ֽ��ϴ�.', '9', '22', 4, 'https://www.naver.com/search.naver?query=ī��������', 22, 60, 8000, 'Y', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, '��δ���Ŀ�� (Bronco Coffee)', 2, 'M3', 1, to_date('02/15/2024', 'MM/DD/RRRR'), 'Y', '02-987-6543', '����Ư���� ������ ������� 443', '���ﵿ�� ��ġ�� �� ī��� Ư���� �귱ġ �޴��� �Բ� �ż��� Ŀ�Ǹ� �����մϴ�.', '10', '23', 1, 'https://www.naver.com/search.naver?query=��δ���Ŀ��', 31, 120, 7600, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, '������ (Erban)', 2, 'M4', 1, to_date('02/16/2024', 'MM/DD/RRRR'), 'Y', '02-321-7890', '����Ư���� ������ ������� 107�� 23', '���ﵿ�� ��ġ�� �� ī��� �ƴ��� ������� �Բ� ��ä�ο� ���� �޴��� �����մϴ�.', '9', '22', 3, 'https://www.naver.com/search.naver?query=������', 11, 80, 11000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, '�ε�Ŀ�� (Lodum Coffee)', 2, 'M5', 1, to_date('02/17/2024', 'MM/DD/RRRR'), 'Y', '02-456-7890', '����Ư���� ������ ������� 134�� 12', '���ﵿ�� ��ġ�� �� ī��� ����Ƽ ���� Ŀ�ǿ� �Բ� �Ƹ��ٿ� ���׸���� �����մϴ�.', '7', '22', 1, 'https://www.naver.com/search.naver?query=�ε�Ŀ��', 532, 55, 10000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'ī�� �׷��� (Cafe Gray)', 2, 'M6', 1, to_date('02/18/2024', 'MM/DD/RRRR'), 'Y', '02-789-0123', '����Ư���� ������ ������� 616', '�Ｚ���� ��ġ�� �� ī��� ��޽����� ������� �Բ� ��ä�ο� ����Ʈ�� ��� �� �ֽ��ϴ�.', '9', '21', 2, 'https://www.naver.com/search.naver?query=ī��׷���', 41, 70, 12400, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, '�������Ŀ�� (Maison de Nique Coffee)', 2, 'M7', 1, to_date('02/19/2024', 'MM/DD/RRRR'), 'Y', '02-234-5678', '����Ư���� ������ �������4�� 10', '���ﵿ�� ��ġ�� �� ī��� ��ǳ������ ���׸���� �Բ� Ư���� Ŀ�� ������ �����մϴ�.', '9', '22', 3, 'https://www.naver.com/search.naver?query=�������Ŀ��', 32, 70, 15000, 'N', 0);

INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Bar Cham (����)', 1, 'M1', 1, to_date('02/20/2024', 'MM/DD/RRRR'), 'Y', '02-7673-6365', '����Ư���� ������ �������4�� 14', '������ ���ﵿ�� ��ġ�� �� ���� �پ��� Ĭ���ϰ� ������ ��� �� �ִ� ������ ���� ���Դϴ�.', '15', '23', 1, 'https://www.naver.com/search.naver?query=����', 32, 120, 79000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Wine Bar M (���ι� M)', 1, 'M1', 1, to_date('02/21/2024', 'MM/DD/RRRR'), 'Y', '02-1241-1949', '����Ư���� ������ �Ｚ�� 551', '������ �Ｚ���� ��ġ�� �� ���ιٴ� ��ǳ������ ������� �پ��� ������ �����մϴ�.', '16', '23', 23, 'https://www.naver.com/search.naver?query=���ι�M', 123, 130, 120000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Monkey Shoulder Lounge', 1, 'M1', 1, to_date('02/22/2024', 'MM/DD/RRRR'), 'Y', '02-1327-1609', '����Ư���� ������ ������ 101', '������ �Ż絿�� ��ġ�� �� ����� �ٴ� ����Ű ����� Ĭ���ϰ� �پ��� ���Ḧ ��� �� �ֽ��ϴ�.', '17', '22', 23, 'https://www.naver.com/search.naver?query=monkeybar', 324, 150, 159000, 'Y', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Casa Corona', 1, 'M1', 1, to_date('02/23/2024', 'MM/DD/RRRR'), 'Y', '02-8569-1234', '����Ư���� ������ ������ 50�� 7', '������ û�㵿�� ��ġ�� �� ���� �߽�ĭ ��Ÿ���� �ٷ�, ���ֿ� Ĭ������ ��� �� �ֽ��ϴ�.', '15', '23', 44, 'https://www.naver.com/search.naver?query=casacorona', 123, 170, 200000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Pailin Rooftop Bar', 1, 'M1', 1, to_date('02/24/2024', 'MM/DD/RRRR'), 'Y', '02-1694-4322', '����Ư���� ������ �������4�� 14', '������ ���ﵿ�� ��ġ�� �� ����ž �ٴ� ������ ������ �����ϸ� ���Ḧ ��� �� �ֽ��ϴ�.', '14', '23', 54, 'https://www.naver.com/search.naver?query=���ϸ�����ž��', 12, 220, 89000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Southside Parlor', 1, 'M1', 1, to_date('02/25/2024', 'MM/DD/RRRR'), 'Y', '02-8403-5136', '����Ư���� ������ ������ 116', '������ û�㵿�� ��ġ�� �� ���� ���� ��Ÿ���� �ٷ�, Ĭ���ϰ� ǻ�� ������ ��� �� �ֽ��ϴ�.', '12', '24', 231, 'https://www.naver.com/search.naver?query=shouthsideparlor', 554, 120, 2500000, 'N', 0);
INSERT INTO TB_PLACE VALUES('PL' || SEQ_PNO.NEXTVAL, 'Ceci n''est pas un bar', 1, 'M1', 1, to_date('02/26/2024', 'MM/DD/RRRR'), 'Y', '02-1221-1224', '����Ư���� ������ ������57�� 24', '������ û�㵿�� ��ġ�� �� ���� �ƴ��� ������� �پ��� ���Ḧ �����ϴ� ���Դϴ�.', '17', '23', 12, 'https://www.naver.com/search.naver?query=���ó��Ľ��ӹ�', 76, 100, 12400000, 'N', 0);


INSERT INTO TB_VISIT VALUES(DEFAULT,'M1','PL1');
INSERT INTO TB_VISIT VALUES(DEFAULT,'M2','PL2');
INSERT INTO TB_VISIT VALUES(DEFAULT,'M3','PL3');

INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'ȸ�� Ż�� �� ������ ���� �����ΰ���?',DEFAULT,DEFAULT,DEFAULT,'M1');
INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'�Ű� �ްԵǸ� ��� �ǳ���?','23-07-21','Y','Y','M1');
INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'������ ��ȭ��ȣ�� ��� �ǳ���?','22-11-01','N',DEFAULT,'M1');
INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'��������ϰ� ������ ��� �ϳ���?','22-11-01','N',DEFAULT,'M1');

INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,1,'M1','N','�����ϰ� ���ּ���.',SYSDATE,'Y');
INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,2,'M1','N','���� Ż���ŵ�ϴ�.',SYSDATE,'Y');
INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,3,'M1','N','�� ?02-6682-1547 �Դϴ�.',SYSDATE,'Y');

INSERT INTO TB_COURSE VALUES('C'||SEQ_CONO.NEXTVAL,'M1','���ﰥ��','�����޲ٹ�','�������','�������','����ø�',30 ,1000);
INSERT INTO TB_COURSE VALUES('C'||SEQ_CONO.NEXTVAL,'M2','��������','�����޲ٹ�','��������','��������','�����ø�',40 ,2000);
INSERT INTO TB_COURSE VALUES('C'||SEQ_CONO.NEXTVAL,'M3','�ѳ�����','�ѳ��޲ٹ�','�ѳ�����','�ѳ�����','�ѳ��ø�',50 ,3000);

INSERT INTO TB_REPORT VALUES(SEQ_RENO.NEXTVAL,'M2','M3','���','�ش� ����ڰ� �������̰� ������� �� ����Ͽ� �ٸ� ����ڸ� ���Ѽ��ϰ� ��ó�� �־����ϴ�. �̷��� �ൿ�� Ŀ�´�Ƽ ��Ģ�� �����ϸ� �ǰ��� ��ȭ�� �����մϴ�.',SYSDATE-1,NULL,'N',1);
INSERT INTO TB_REPORT VALUES(SEQ_RENO.NEXTVAL,'M2','M4','�ҹ�����','�ش� ����ڰ� �ҹ����� ������� ��ǰ �Ǵ� ���񽺸� ȫ���ϰ� �ֽ��ϴ�. �̷��� ������ ������ �����ϸ�, Ŀ�´�Ƽ�� ������ �ŷڸ� ��ġ�� �ൿ�Դϴ�.',SYSDATE-1,SYSDATE,'Y',2);
INSERT INTO TB_REPORT VALUES(SEQ_RENO.NEXTVAL,'M2','M5','�����Խñ�','�ش� ����ڰ� ��ǰ� �ٸ� ������ ���� �Խù��� �ۼ��Ͽ� ����ڵ��� ȥ�������� �ϰ� �����ϰ� �ֽ��ϴ�. �̴� Ŀ�´�Ƽ ������ �ŷڼ��� ���Ǽ��� �Ѽ��ϴ� �ൿ�Դϴ�.',SYSDATE-1,NULL,'N',3);

INSERT INTO TB_HASHTAG VALUES('PL'||SEQ_PNO.NEXTVAL,'������,���ʱ�,������');
INSERT INTO TB_HASHTAG VALUES('PL'||SEQ_PNO.NEXTVAL,'������,�˴�,����3��');
INSERT INTO TB_HASHTAG VALUES('PL'||SEQ_PNO.NEXTVAL,'ȫ��,������,��');
INSERT INTO TB_HASHTAG VALUES('N5','��������,�ʵ�,����Ʈ');
INSERT INTO TB_HASHTAG VALUES('F1','���,�Ҳ�����,���ﵥ����,�߰�,�츮���׺����');
INSERT INTO TB_HASHTAG VALUES('F6','����ģ��,����Ʈ,�η���?');



INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������1.IMG','2023090710180738948.png','/resource/img/profile/','20-07-11','M1','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������2.IMG','2023090710180882714.png','/resource/img/profile/','22-07-11','M2','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������3.IMG','2023090710305253027.png','/resource/img/profile/','23-07-11','M3','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������4.IMG','2023090711325877548.png','/resource/img/profile/','23-07-11','M4','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������5.IMG','2023090711341467132.png','/resource/img/profile/','23-07-11','M5','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������6.IMG','2023090712190974451.png','/resource/img/profile/','23-07-11','M6','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������7.IMG','2023090712295715680.png','/resource/img/profile/','23-07-11','M7','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������8.IMG','2023090812381947377.png','/resource/img/profile/','23-07-11','M8','Y',1);

INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ġ�_�����.IMG','2023090616835426971.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL1','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ⱸ��_�����.IMG','2023090616729405318.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL2','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ػ깰�丮_�����.IMG','2023090709502816794.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL3','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'Ǫ����������_�����.IMG','2023090709173925684.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL4','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�հ���_�����.IMG','2023090709648930217.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL5','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������ǻ���丮_�����.IMG','2023090709591476832.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL6','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��Ż��������_�����.IMG','2023090709823619745.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL7','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������_�����.IMG','2023090709461537289.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL8','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���ι�_�����.IMG','2023090709359824671.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL9','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���Ѹ����±�_�����.IMG','2023090709287513964.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL10','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ʹ�_�����.IMG','2023090709194785623.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL11','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�������±�_�����.IMG','2023090709639815247.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',1);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�йи��������_�����.IMG','2023090709942518763.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',1);


INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ġ�.IMG','2023090616403723355.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL1','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ⱸ��.IMG','2023090616403790573.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL2','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ػ깰�丮.IMG','2023090709005842712.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL3','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'Ǫ����������.IMG','2023090709005871203.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL4','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�հ���.IMG','2023090709040913837.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL5','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������ǻ���丮.IMG','2023090709040973048.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL6','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��Ż��������.IMG','2023090709114213100.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL7','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������.IMG','2023090709114270692.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL8','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���ι�.IMG','2023090709241824214.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL9','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���Ѹ����±�.IMG','2023090709241854214.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL10','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ʹ�.IMG','2023090709341265715.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL11','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�������±�.IMG','2023090709341272882.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�йи��������.IMG','2023090701235323544.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);

INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ġ�2.IMG','2023090616403723356.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL1','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ⱸ��2.IMG','2023090616403790574.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL2','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ػ깰�丮2.IMG','2023090709005842713.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL3','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'Ǫ����������2.IMG','2023090709005871204.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL4','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�հ���2.IMG','2023090709040913838.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL5','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������ǻ���丮2.IMG','2023090709040973049.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL6','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��Ż��������2.IMG','2023090709114213101.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL7','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������2.IMG','2023090709114270693.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL8','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���ι�2.IMG','2023090709241824215.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL9','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���Ѹ����±�2.IMG','2023090709241854215.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL10','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ʹ�2.IMG','2023090709341265716.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL11','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�������±�2.IMG','2023090709341272883.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�йи��������2.IMG','2023090701235323545.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);

INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ġ�3.IMG','2023090616403723357.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL1','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��ⱸ��3.IMG','2023090616403790575.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL2','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ػ깰�丮3.IMG','2023090709005842714.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL3','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'Ǫ����������3.IMG','2023090709005871205.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL4','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�հ���3.IMG','2023090709040913839.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL5','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������ǻ���丮3.IMG','2023090709040973040.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL6','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'��Ż��������3.IMG','2023090709114213102.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL7','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'������3.IMG','2023090709114270694.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL8','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���ι�3.IMG','2023090709241824216.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL9','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'���Ѹ����±�3.IMG','2023090709241854216.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL10','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�ʹ�3.IMG','2023090709341265717.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL11','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�������±�3.IMG','2023090709341272884.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);
INSERT INTO TB_FILE VALUES(SEQ_FILE.NEXTVAL,'�йи��������3.IMG','2023090701235323546.jpeg','/resource/img/place_upfiles/',to_date('23/07/11','RR/MM/DD'),'PL12','Y',2);

INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�׶�λ�_�����.JPEG', '2023090616234210051.jpeg', '/resource/img/place_upfiles/', to_date('07/11/2023', 'MM/DD/RRRR'), 'PL14', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�׶�λ�1.JPEG', '2023090616987320061.jpeg', '/resource/img/place_upfiles/', to_date('07/12/2023', 'MM/DD/RRRR'), 'PL14', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�׶�λ�2.JPEG', '202309061789041.jpeg', '/resource/img/place_upfiles/', to_date('07/13/2023', 'MM/DD/RRRR'), 'PL14', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�׶�λ�3.JPEG', '2023090618321090051.jpeg', '/resource/img/place_upfiles/', to_date('07/14/2023', 'MM/DD/RRRR'), 'PL14', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��������_�����.JPEG', '2023090619543209981.jpeg', '/resource/img/place_upfiles/', to_date('07/15/2023', 'MM/DD/RRRR'), 'PL15', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��������1.JPEG', '2023090618234010111.jpeg', '/resource/img/place_upfiles/', to_date('07/16/2023', 'MM/DD/RRRR'), 'PL15', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��������2.JPEG', '2023090616743290111.jpeg', '/resource/img/place_upfiles/', to_date('07/17/2023', 'MM/DD/RRRR'), 'PL15', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��������3.JPEG', '2023090617654390021.jpeg', '/resource/img/place_upfiles/', to_date('07/18/2023', 'MM/DD/RRRR'), 'PL15', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��δ���Ŀ��_�����.JPEG', '2023090618453669891.jpeg', '/resource/img/place_upfiles/', to_date('07/19/2023', 'MM/DD/RRRR'), 'PL16', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��δ���Ŀ��1.JPEG', '2023090617432979971.jpeg', '/resource/img/place_upfiles/', to_date('07/20/2023', 'MM/DD/RRRR'), 'PL16', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��δ���Ŀ��2.JPEG', '2023090618123041.jpeg', '/resource/img/place_upfiles/', to_date('07/21/2023', 'MM/DD/RRRR'), 'PL16', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��δ���Ŀ��3.JPEG', '2023090617453890051.jpeg', '/resource/img/place_upfiles/', to_date('07/22/2023', 'MM/DD/RRRR'), 'PL16', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '������_�����.JPEG', '2023090619674350081.jpg', '/resource/img/place_upfiles/', to_date('07/23/2023', 'MM/DD/RRRR'), 'PL17', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '������1.JPEG', '2023090618309649921.jpeg', '/resource/img/place_upfiles/', to_date('07/24/2023', 'MM/DD/RRRR'), 'PL17', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '������2.JPEG', '2023090618965430021.jpeg', '/resource/img/place_upfiles/', to_date('07/25/2023', 'MM/DD/RRRR'), 'PL17', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '������3.JPEG', '202309061627429991.jpeg', '/resource/img/place_upfiles/', to_date('07/26/2023', 'MM/DD/RRRR'), 'PL17', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�ε�Ŀ��_�����.JPEG', '2023090617643980031.jpeg', '/resource/img/place_upfiles/', to_date('07/27/2023', 'MM/DD/RRRR'), 'PL18', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�ε�Ŀ��1.JPEG', '2023090618432649981.jpeg', '/resource/img/place_upfiles/', to_date('07/28/2023', 'MM/DD/RRRR'), 'PL18', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�ε�Ŀ��2.JPEG', '2023090615893009921.jpeg', '/resource/img/place_upfiles/', to_date('07/29/2023', 'MM/DD/RRRR'), 'PL18', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�ε�Ŀ��3.JPEG', '202309061927653991.jpeg', '/resource/img/place_upfiles/', to_date('07/30/2023', 'MM/DD/RRRR'), 'PL18', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��׷���_�����.JPEG', '2023090618532189951.jpeg', '/resource/img/place_upfiles/', to_date('07/31/2023', 'MM/DD/RRRR'), 'PL19', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��׷���1.JPEG', '2023090617325410051.jpeg', '/resource/img/place_upfiles/', to_date('08/01/2023', 'MM/DD/RRRR'), 'PL19', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��׷���2.JPEG', '2023090614658700031.jpeg', '/resource/img/place_upfiles/', to_date('08/02/2023', 'MM/DD/RRRR'), 'PL19', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī��׷���3.JPEG', '2023090615902309891.jpeg', '/resource/img/place_upfiles/', to_date('08/03/2023', 'MM/DD/RRRR'), 'PL19', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�������Ŀ��_�����.JPEG', '2023090619234870021.jpeg', '/resource/img/place_upfiles/', to_date('08/04/2023', 'MM/DD/RRRR'), 'PL20', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�������Ŀ��1.JPEG', '2023090619234570021.jpeg', '/resource/img/place_upfiles/', to_date('08/05/2023', 'MM/DD/RRRR'), 'PL20', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�������Ŀ��2.JPEG', '2023090616214370051.jpeg', '/resource/img/place_upfiles/', to_date('08/06/2023', 'MM/DD/RRRR'), 'PL20', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '�������Ŀ��3.JPEG', '2023090618324590081.jpeg', '/resource/img/place_upfiles/', to_date('08/07/2023', 'MM/DD/RRRR'), 'PL20', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����_�����.JPEG', '2023090617825430021.jpeg', '/resource/img/place_upfiles/', to_date('08/08/2023', 'MM/DD/RRRR'), 'PL21', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����1.JPEG', '2023090616904310021.jpeg', '/resource/img/place_upfiles/', to_date('08/09/2023', 'MM/DD/RRRR'), 'PL21', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����2.JPEG', '2023090619341779971.jpeg', '/resource/img/place_upfiles/', to_date('08/10/2023', 'MM/DD/RRRR'), 'PL21', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����3.JPEG', '2023090618790561.jpeg', '/resource/img/place_upfiles/', to_date('08/11/2023', 'MM/DD/RRRR'), 'PL21', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '���ι�_�����.JPEG', '2023090618217639941.jpeg', '/resource/img/place_upfiles/', to_date('08/12/2023', 'MM/DD/RRRR'), 'PL22', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '���ι�1.JPEG', '2023090617452300031.jpeg', '/resource/img/place_upfiles/', to_date('08/13/2023', 'MM/DD/RRRR'), 'PL22', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '���ι�2.JPEG', '202309061954321.jpeg', '/resource/img/place_upfiles/', to_date('08/14/2023', 'MM/DD/RRRR'), 'PL22', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '���ι�3.JPEG', '202309061768954011.jpeg', '/resource/img/place_upfiles/', to_date('08/15/2023', 'MM/DD/RRRR'), 'PL22', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��Ű��������_�����.JPEG', '2023090618457319941.jpeg', '/resource/img/place_upfiles/', to_date('08/16/2023', 'MM/DD/RRRR'), 'PL23', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��Ű��������1.JPEG', '2023090616789430021.jpeg', '/resource/img/place_upfiles/', to_date('08/17/2023', 'MM/DD/RRRR'), 'PL23', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��Ű��������2.JPEG', '2023090619223870021.jpeg', '/resource/img/place_upfiles/', to_date('08/18/2023', 'MM/DD/RRRR'), 'PL23', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��Ű��������3.JPEG', '2023090617894530051.jpeg', '/resource/img/place_upfiles/', to_date('08/19/2023', 'MM/DD/RRRR'), 'PL23', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī���ڷγ�_�����.JPEG', '2023090616432780031.jpeg', '/resource/img/place_upfiles/', to_date('08/20/2023', 'MM/DD/RRRR'), 'PL24', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī���ڷγ�1.JPEG', '202309061827653991.jpeg', '/resource/img/place_upfiles/', to_date('08/21/2023', 'MM/DD/RRRR'), 'PL24', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī���ڷγ�2.JPEG', '2023090615961740031.jpeg', '/resource/img/place_upfiles/', to_date('08/22/2023', 'MM/DD/RRRR'), 'PL24', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'ī���ڷγ�3.JPEG', '202309061923018011.jpeg', '/resource/img/place_upfiles/', to_date('08/23/2023', 'MM/DD/RRRR'), 'PL24', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����ž��_�����.JPEG', '2023090617893449981.jpeg', '/resource/img/place_upfiles/', to_date('08/24/2023', 'MM/DD/RRRR'), 'PL25', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����ž��1.JPEG', '2023090618456719871.jpeg', '/resource/img/place_upfiles/', to_date('08/25/2023', 'MM/DD/RRRR'), 'PL25', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����ž��2.JPEG', '2023090619236570111.jpeg', '/resource/img/place_upfiles/', to_date('08/26/2023', 'MM/DD/RRRR'), 'PL25', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '����ž��3.JPEG', '2023090617865319941.jpeg', '/resource/img/place_upfiles/', to_date('08/27/2023', 'MM/DD/RRRR'), 'PL25', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��콺���̵�_�����.JPEG', '2023090617349799941.jpeg', '/resource/img/place_upfiles/', to_date('08/28/2023', 'MM/DD/RRRR'), 'PL26', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��콺���̵�1.JPEG', '2023090618254309891.jpeg', '/resource/img/place_upfiles/', to_date('08/29/2023', 'MM/DD/RRRR'), 'PL26', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��콺���̵�2.JPEG', '202309061987653991.jpeg', '/resource/img/place_upfiles/', to_date('08/30/2023', 'MM/DD/RRRR'), 'PL26', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, '��콺���̵�3.JPEG', '202309061678954011.jpeg', '/resource/img/place_upfiles/', to_date('08/31/2023', 'MM/DD/RRRR'), 'PL26', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'CECI_�����.JPEG', '2023090619456780031.jpeg', '/resource/img/place_upfiles/', to_date('09/01/2023', 'MM/DD/RRRR'), 'PL27', 'Y', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'CECI1.JPEG', '202309061854321.jpeg', '/resource/img/place_upfiles/', to_date('09/02/2023', 'MM/DD/RRRR'), 'PL27', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'CECI2.JPEG', '202309061967429991.jpeg', '/resource/img/place_upfiles/', to_date('09/03/2023', 'MM/DD/RRRR'), 'PL27', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'CECI3.JPEG', '2023090619193900031.jpeg', '/resource/img/place_upfiles/', to_date('09/04/2023', 'MM/DD/RRRR'), 'PL27', 'Y', 2);

INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'noticeSample1.JPEG', '2023090619193922222.png', '/resource/img/board/', to_date('09/04/2023', 'MM/DD/RRRR'), 'N5', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'noticeSample2.JPEG', '2023090619193933333.png', '/resource/img/board/', to_date('09/04/2023', 'MM/DD/RRRR'), 'N5', 'Y', 2);
INSERT INTO TB_FILE VALUES (SEQ_FILE.NEXTVAL, 'noticeSample3.JPEG', '2023090619193944444.png', '/resource/img/board/', to_date('09/04/2023', 'MM/DD/RRRR'), 'N5', 'Y', 2);



--�� 119
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('F'||SEQ_BNO.NEXTVAL,'Ŀ�´�Ƽ ������ �����Ϸ��� �մϴ�!','M2','�ȳ��ϼ���, �Բ� ��� �� �ִ� ������ �غ��ϰ��� �մϴ�. ���� �ָ��� Ŀ�´�Ƽ ȸ����� �� ������ �߿� ��ũ���� ��ȹ ���ε�, �Բ� �����Ͻ� �е��� �����մϴ�. ���� ������ �е��� ��۷� ���� �ǻ縦 �˷��ּ���. �Բ� ��ſ� �ð� ������!',0,to_date('08/11/2023', 'MM/DD/RRRR'),'Y','N');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('F'||SEQ_BNO.NEXTVAL,'���ο� ��� ��Ȱ�� �����ϰ� �;��.','M5','�ȳ��ϼ���, ���� ��� ��Ȱ�� ã�� �ִµ� � ���� �������� ��� ���Դϴ�. �丮, �̼�, ���� �� �پ��� ��̸� ��� ���̴ϱ� �������� ����� ��õ�� ��� �ͽ��ϴ�. � ��̰� ������ �������ּ���!',0,to_date('08/12/2023', 'MM/DD/RRRR'),'Y','N');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('F'||SEQ_BNO.NEXTVAL,'�ָ� ���� ��õ���ּ���!','M4','�ȳ��ϼ���, ������ �����ϴ� ȸ���Դϴ�. ���� �ָ��� �������� �������� ã�� �ִµ���. �������� ��õ�� ������ �������ּ���! �ڿ� ����� �Ƹ��ٿ� ���̸� �� ���ھ��. �����մϴ�!',0,to_date('08/11/2023', 'MM/DD/RRRR'),'Y','N');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('N'||SEQ_BNO.NEXTVAL,'Ŭ���� Ŀ�´�Ƽ Ȱ���� �սô�!','M1','<h1>[?Ŀ�´�Ƽ ����] Ŭ���� Ȱ�� ���� �ȳ�</h1>
<br>
<p>�ȳ��ϼ���, Ŀ�´�Ƽ ȸ�� ������,</p>

<p>Ŀ�´�Ƽ ����Դϴ�. �츮 Ŀ�´�Ƽ�� ��ΰ� ��̰� �����ϰ� Ȱ���� �� �ִ� ������ ����� ���� ����ϰ� �ֽ��ϴ�. �̿� ���� Ŭ���� Ȱ���� �����ϴµ� ���� �ȳ��帮���� �մϴ�.</p>

<ul>
  <li><strong>���߰� ����:</strong> Ŀ�´�Ƽ �������� ��� ȸ������ ���θ� �����ϰ� ���Ǹ� ����� �մϴ�. �ٸ� ȸ���� �ǰ��� �����ϰ� �ٸ� ������� �ظ� ��ġ�� ������ �ﰡ���ּ���.</li>
  <li><strong>��Ӿ� �� ���� �߾� ����:</strong> ��Ӿ ���� �߾��� Ŀ�´�Ƽ Ȱ���� ǰ���� ����߸��� �ٸ� ȸ���鿡�� �������� �� �� �ֽ��ϴ�. �̸� �ݵ�� �������ֽñ� �ٶ��ϴ�.</li>
  <li><strong>�ҹ����� Ȱ�� ����:</strong> ���۱� ħ��, �ҹ� ���α׷� ���� ���� �ҹ����� Ȱ���� ������ �����˴ϴ�.</li>
  <li><strong>�������� ������ �������� �⿩:</strong> Ŀ�´�Ƽ�� ȸ������ ���������� �����ϰ� ������ �����ϴ� �����Դϴ�. �پ��� ������ ������ ������ Ȱ���� ��а� ���� ������ �⿩���ּ���.</li>
</ul>

<p>�� ������ �ݵ�� �ؼ��Ͽ� �츮 Ŀ�´�Ƽ�� ���� Ȱ���� ������ ������ֽñ� ��Ź�帳�ϴ�. Ŭ���� Ȱ���� ����� ��ſ� Ŀ�´�Ƽ Ȱ���� ���� �⺻�Դϴ�.</p>

<p>�����մϴ�.<br>
Ŀ�´�Ƽ ��� �帲</p>',0,to_date('08/10/2023', 'MM/DD/RRRR'),'Y','Y');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('N'||SEQ_BNO.NEXTVAL,'�߿� �������� �� �̴��� �̺�Ʈ �ȳ� ','M1','<h1>[?Ŀ�´�Ƽ ����] ����Ʈ ���� ���� �ȳ�</h1><br>

<p>�ȳ��ϼ���, Ŀ�´�Ƽ ȸ�� ������,</p>

<p>Ŀ�´�Ƽ ����Դϴ�. �̹����� ����Ʈ ���� ��å�� ���� �߿��� ���� ������ �ȳ��ص帳�ϴ�.</p>

<ol>
  <li><strong>����Ʈ ���� ��å ����:</strong> Ŀ�´�Ƽ�� ����Ʈ ���� ��å�� �Ϻ� ����Ǿ����ϴ�. �������� �Խù� �ۼ� �ÿ��� ����Ʈ�� ������ �� ������, ��� �ۼ� �� ���ƿ�� ����Ʈ ���� ��󿡼� ���ܵ˴ϴ�. �� ���� ������ ���� �����ϰ� Ȱ���� �Խñ� �ۼ��� �����ϱ� ���� ��ġ�Դϴ�.</li>
  <li><strong>����Ʈ ���� ����:</strong> �Խù� �ۼ� �ÿ��� �Ʒ��� ���� ���ؿ� ���� ����Ʈ�� �����˴ϴ�:
    <ul>
      <li>���ο� �Խù� �ۼ�: 10����Ʈ</li>
      <li>�Խù��� ÷�ε� �̹���/������ ����: �߰� 5����Ʈ</li>
    </ul>
  </li>
  <li><strong>������ �ۼ��� ��� �� ���ƿ信 ���� ����Ʈ:</strong> ������ �ۼ��� ��� �� ���ƿ信 ���� ����Ʈ�� �����˴ϴ�. ������ ���ĺ��ʹ� ���ο� �Խù� �ۼ��� ���ؼ��� ����Ʈ�� ���޵˴ϴ�.</li>
</ol>

<p>�� ���� ������ �ݵ�� Ȯ���Ͻð�, ����Ʈ ������ ���õ� ��� Ȱ�� �� ���ο� ��å�� �ؼ����ֽñ� �ٶ��ϴ�.</p>

<p>�����մϴ�.<br>
Ŀ�´�Ƽ ��� �帲</p>',0,to_date('08/09/2023', 'MM/DD/RRRR'),'Y','Y');
INSERT INTO TB_BOARD (BOARD_NO, BOARD_TITLE, WRITER, BOARD_CONTENT, BOARD_COUNT, CREATE_DATE, BOARD_STATUS, BOARD_UP) VALUES ('F'||SEQ_BNO.NEXTVAL,'����ģ���� �ٳ�Ծ��','M3','������ ���� ���� ���׿�.',0,to_date('08/08/2023', 'MM/DD/RRRR'),'Y','N');

INSERT INTO TB_REVIEW_REPLY (RE_NO, RE_REF_NO, RE_WRITER, RE_CONTENT, RE_LIKE_STAR, RE_REF_STAR, RE_DATE, RE_STATUS)
VALUES ('RP'||SEQ_RVRP.NEXTVAL, 'N5', 'M2', '����Ʈ ���� ��å�� ����Ǿ��ٴϿ�! ���� ���� �����մϴ�.', 5, 1, SYSDATE, 'N');

INSERT INTO TB_REVIEW_REPLY (RE_NO, RE_REF_NO, RE_WRITER, RE_CONTENT, RE_LIKE_STAR, RE_REF_STAR, RE_DATE, RE_STATUS)
VALUES ('RP'||SEQ_RVRP.NEXTVAL, 'N5', 'M3', '���ο� ��å�� ���� ���� �ƽ��� ������, �����մϴ�. �� ������ Ȱ���ϰڽ��ϴ�!', 4, 1, SYSDATE, 'N');

INSERT INTO TB_REVIEW_REPLY (RE_NO, RE_REF_NO, RE_WRITER, RE_CONTENT, RE_LIKE_STAR, RE_REF_STAR, RE_DATE, RE_STATUS)
VALUES ('RP'||SEQ_RVRP.NEXTVAL, 'N5', 'M4', '����Ʈ ���� ������ �� ���������׿�. ���� �Խñ��� �� ������ �ۼ��ؾ߰ھ��!', 4, 1, SYSDATE, 'N');

INSERT INTO TB_REVIEW_REPLY (RE_NO, RE_REF_NO, RE_WRITER, RE_CONTENT, RE_LIKE_STAR, RE_REF_STAR, RE_DATE, RE_STATUS)
VALUES ('RP'||SEQ_RVRP.NEXTVAL, 'F6', 'M7', '���� �θ�ƽ�� �����̾��ڳ׿�! �ູ�� �ð� �����̳���?', 5, 1, SYSDATE, 'N');

INSERT INTO TB_REVIEW_REPLY (RE_NO, RE_REF_NO, RE_WRITER, RE_CONTENT, RE_LIKE_STAR, RE_REF_STAR, RE_DATE, RE_STATUS)
VALUES ('RP'||SEQ_RVRP.NEXTVAL, 'F6', 'M2', '������ ���ڰ�, ���� ���� �����̼̰ھ��! �� ���� �߾� ���������� ���ھ��.', 4, 1, SYSDATE, 'N');


-------------------------------------------------------------------
---------------------------- SELECT�� ------------------------------
--------------------------------------------------------------------
SELECT * FROM TB_LIKE;
SELECT * FROM TB_LOCATION;
SELECT * FROM TB_CATEGORY;
SELECT * FROM TB_GRADE;
SELECT * FROM TB_MEMBER;
SELECT * FROM TB_PLACE; --����
SELECT * FROM TB_BOARD;
--SELECT * FROM TB_REPLY;
--SELECT * FROM TB_REVIEW;
SELECT * FROM TB_VISIT;
SELECT * FROM TB_ANSWER;
--SELECT * FROM TB_NOTICE;
SELECT * FROM TB_COURSE;
SELECT * FROM TB_REPORT;
SELECT * FROM TB_HASHTAG;   
SELECT * FROM TB_FILE;
SELECT * FROM TB_BOARD;

COMMIT;

-- 230824 23:18 : NOTICE TABLE ����, BOARD_TABLE ����