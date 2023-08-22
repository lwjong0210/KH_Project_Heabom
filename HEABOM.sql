-- 테이블 드랍문
DROP TABLE TB_LOGO;
DROP TABLE TB_HASHTAG;
DROP TABLE TB_REPORT;
DROP TABLE TB_COURSE;
DROP TABLE TB_NOTICE;
DROP TABLE TB_ANSWER;
DROP TABLE TB_QUESTION;
DROP TABLE TB_VISIT;
DROP TABLE TB_REVIEW;
DROP TABLE TB_REPLY;
DROP TABLE TB_FREE_BOARD;
DROP TABLE TB_PLACE;
DROP TABLE TB_MEMBER;
DROP TABLE TB_GRADE;
DROP TABLE TB_CATEGORY;
DROP TABLE TB_LOCATION;
DROP TABLE TB_LIKE;


-- 시퀀스 드랍문
DROP SEQUENCE SEQ_LONO; -- 로고 시퀀스
DROP SEQUENCE SEQ_CNO; -- 카테고리 시퀀스
DROP SEQUENCE SEQ_LNO; -- 로케이션 시퀀스
DROP SEQUENCE SEQ_PNO; -- 장소 시퀀스
DROP SEQUENCE SEQ_FBNO; -- 자유 게시판 시퀀스
DROP SEQUENCE SEQ_MNO; -- 멤버 시퀀스
DROP SEQUENCE SEQ_NNO;  -- 공지 시퀀스
DROP SEQUENCE SEQ_QNO;  -- 질문 번호 시퀀스
DROP SEQUENCE SEQ_ANO;  -- 답변 번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_RENO; -- 신고번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_CONO; -- 코스번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_RVNO; -- 리뷰 시퀀스
DROP SEQUENCE SEQ_RPNO; -- 댓글 시퀀스



---------------------------------------------------------
---------------------- 테이블 생성문 ----------------------
---------------------------------------------------------

-- 좋아요 테이블
CREATE TABLE TB_LIKE(
    MEM_NO NUMBER NOT NULL,
    BOARD_NO VARCHAR2(300) NOT NULL,
    PRIMARY KEY (MEM_NO, BOARD_NO)
);
COMMENT ON COLUMN TB_LIKE.MEM_NO IS '좋아요 누른 사람';
COMMENT ON COLUMN TB_LIKE.BOARD_NO IS '좋아요 눌린게시글';


-- 위치 테이블
CREATE TABLE TB_LOCATION (
    LOCATION_NO NUMBER PRIMARY KEY,
    LOCATION_NAME VARCHAR2(15) NOT NULL
);
COMMENT ON COLUMN TB_LOCATION.LOCATION_NO IS '위치코드';
COMMENT ON COLUMN TB_LOCATION.LOCATION_NAME IS '위치명(OO구)';

CREATE SEQUENCE SEQ_LNO NOCACHE;


-- 카테고리 테이블
CREATE TABLE TB_CATEGORY (
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NAME IS '카테고리명';

CREATE SEQUENCE SEQ_CNO NOCACHE;






-- 등급 테이블
CREATE TABLE TB_GRADE (
GRADE VARCHAR2(30) PRIMARY KEY,
MEDAL VARCHAR2(500) NOT NULL,
MINPOINT NUMBER NOT NULL,
MAXPOINT NUMBER NOT NULL
);
COMMENT ON COLUMN TB_GRADE.GRADE IS '등급이름';
COMMENT ON COLUMN TB_GRADE.MEDAL IS '메달사진첨부파일';


-- 회원 테이블
CREATE TABLE TB_MEMBER (
    MEM_NO NUMBER PRIMARY KEY,
    GRADE VARCHAR2(30) NOT NULL,
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
    MEM_FILE VARCHAR2(500) DEFAULT 'http://naver.com' NOT NULL,
    MEM_VISIT DATE DEFAULT SYSDATE,
    MEM_BIRTHDAY DATE,
    MEM_POINT NUMBER DEFAULT 0 NOT NULL
);
COMMENT ON COLUMN TB_MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_MEMBER.GRADE IS '회원등급';
COMMENT ON COLUMN TB_MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN TB_MEMBER.MEM_PWD IS '비밀번호';
COMMENT ON COLUMN TB_MEMBER.MEM_NAME IS '회원명';
COMMENT ON COLUMN TB_MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN TB_MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN TB_MEMBER.MBTI IS 'MBTI';
COMMENT ON COLUMN TB_MEMBER.MEM_PHONE IS '휴대폰번호';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN TB_MEMBER.MEM_STATUS IS 'U(일반사용자)B(재제사용자)A(관리자)';
COMMENT ON COLUMN TB_MEMBER.MEM_FILE IS '첨부파일';
COMMENT ON COLUMN TB_MEMBER.MEM_VISIT IS '최근접속시간';
COMMENT ON COLUMN TB_MEMBER.MEM_BIRTHDAY IS '생년월일 8자';
COMMENT ON COLUMN TB_MEMBER.MEM_POINT IS '회원포인트';

CREATE SEQUENCE SEQ_MNO NOCACHE;


-- 장소 테이블
CREATE TABLE TB_PLACE(
PLACE_NO NUMBER NOT NULL PRIMARY KEY,
CATEGORY_NO NUMBER NOT NULL REFERENCES TB_CATEGORY,
MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
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
BEST_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(BEST_STATUS IN('Y','N'))
);
COMMENT ON COLUMN TB_PLACE.PLACE_NO IS '장소코드 SEQ_PNO';
COMMENT ON COLUMN TB_PLACE.CATEGORY_NO IS '카테고리 번호';
COMMENT ON COLUMN TB_PLACE.MEM_NO IS '회원번호 작성자';
COMMENT ON COLUMN TB_PLACE.LOCATION_NO IS '위치코드';
COMMENT ON COLUMN TB_PLACE.MAKE_DATE IS '작성날짜';
COMMENT ON COLUMN TB_PLACE.STATUS IS '글상태 Y N';
COMMENT ON COLUMN TB_PLACE.PHONE IS '전화번호';
COMMENT ON COLUMN TB_PLACE.ADDRESS IS '상세주소';
COMMENT ON COLUMN TB_PLACE.PLACE_CONTENT IS '상세내용';
COMMENT ON COLUMN TB_PLACE.START_TIME IS '영업시작시간';
COMMENT ON COLUMN TB_PLACE.END_TIME IS '영업종료시간';
COMMENT ON COLUMN TB_PLACE.STAR_POINT IS '별점';
COMMENT ON COLUMN TB_PLACE.PLACE_URL IS '영업점도메인';
COMMENT ON COLUMN TB_PLACE.VIEW_COUNT IS '조회수';
COMMENT ON COLUMN TB_PLACE.USE_TIME IS '소요시간';
COMMENT ON COLUMN TB_PLACE.USE_PRICE IS '소요가격';
COMMENT ON COLUMN TB_PLACE.BEST_STATUS IS '베스트게시물상태';

CREATE SEQUENCE  SEQ_PNO
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    INCREMENT BY 1
    START WITH 1
    NOCACHE
    NOORDER
    NOCYCLE ;


-- 자유게시판 테이블
CREATE TABLE TB_FREE_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0 NOT NULL,
    BOARD_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOARD_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (BOARD_STATUS IN('Y','N')),
    BOARD_REPORT VARCHAR2(1) DEFAULT 'N' CHECK (BOARD_REPORT IN('Y','N')),
    BOARD_FILE VARCHAR2(4000),
    FOREIGN KEY(MEM_NO) REFERENCES TB_MEMBER(MEM_NO)
);
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_NO IS '게시글번호(SEQ_FBNO)';
COMMENT ON COLUMN TB_FREE_BOARD.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_CONTENT IS '게시글내용';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_COUNT IS '조회수';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_DATE IS '작성일';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_STATUS IS '글상태(Y(게시)|N(삭제)';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_REPORT IS '신고 Y || 미신고 N';
COMMENT ON COLUMN TB_FREE_BOARD.BOARD_FILE IS '첨부파일';

CREATE SEQUENCE SEQ_FBNO
NOCACHE;


-- 댓글 테이블
CREATE TABLE TB_REPLY (
   REPLY_NO NUMBER PRIMARY KEY,
   MEM_NO NUMBER NOT NULL,
   BOARD_NO NUMBER   NOT NULL,
   REPLY_CONTENT VARCHAR2(4000) NOT NULL,
   REPLY_LIKE NUMBER DEFAULT 0 NOT NULL,
   REPLY_DATE DATE DEFAULT SYSDATE NOT NULL,
   REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (REPLY_STATUS IN('Y','N')),
   REPLY_REPORT VARCHAR2(1) DEFAULT 'N' CHECK (REPLY_REPORT IN('Y','N')),
   REPLY_FILE VARCHAR2(4000),
   FOREIGN KEY (MEM_NO) REFERENCES TB_MEMBER,
   FOREIGN KEY (BOARD_NO) REFERENCES TB_FREE_BOARD
);
COMMENT ON COLUMN TB_REPLY.REPLY_NO IS '글번호';
COMMENT ON COLUMN TB_REPLY.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_REPLY.BOARD_NO IS '게시글번호';
COMMENT ON COLUMN TB_REPLY.REPLY_CONTENT IS '글내용';
COMMENT ON COLUMN TB_REPLY.REPLY_LIKE IS '좋아요';
COMMENT ON COLUMN TB_REPLY.REPLY_DATE IS '작성일';
COMMENT ON COLUMN TB_REPLY.REPLY_STATUS IS '글상태 Y(게시) | N(삭제)';
COMMENT ON COLUMN TB_REPLY.REPLY_REPORT IS '신고(Y) || 미신고(N)';
COMMENT ON COLUMN TB_REPLY.REPLY_FILE IS '첨부파일';

CREATE SEQUENCE SEQ_RPNO NOCACHE;


-- 리뷰 테이블
CREATE TABLE TB_REVIEW (
   REVIEW_NO VARCHAR2(255) PRIMARY KEY,
   PLACE_NO NUMBER REFERENCES TB_PLACE,
   MEM_NO NUMBER REFERENCES TB_MEMBER,
   REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
   REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
   REVIEW_FILE VARCHAR2(4000),
   REVIEW_REPORT VARCHAR2(1) DEFAULT 'N' CHECK (REVIEW_REPORT IN('Y','N'))
);
COMMENT ON COLUMN TB_REVIEW.REVIEW_NO IS '리뷰글번호';
COMMENT ON COLUMN TB_REVIEW.PLACE_NO IS '장소번호';
COMMENT ON COLUMN TB_REVIEW.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_REVIEW.REVIEW_DATE IS '작성일';
COMMENT ON COLUMN TB_REVIEW.REVIEW_CONTENT IS '글내용';
COMMENT ON COLUMN TB_REVIEW.REVIEW_FILE IS '첨부파일';
COMMENT ON COLUMN TB_REVIEW.REVIEW_REPORT IS '신고(Y) || 미신고(N)';

CREATE SEQUENCE SEQ_RVNO NOCACHE;


-- 방문 게시글 테이블
CREATE TABLE TB_VISIT(
    VISIT_DATE DATE DEFAULT SYSDATE NOT NULL,
    MEM_NO NUMBER REFERENCES TB_MEMBER(MEM_NO),
    PLACE_NO NUMBER NOT NULL,
    FOREIGN KEY(PLACE_NO) REFERENCES TB_PLACE
    );
COMMENT ON COLUMN TB_VISIT.VISIT_DATE IS '방문날짜';
COMMENT ON COLUMN TB_VISIT.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_VISIT.PLACE_NO IS '장소코드';


-- 질문 게시판 질문 테이블
CREATE TABLE TB_QUESTION(
    QUESTION_NO NUMBER PRIMARY KEY,
    QUESTION_COMMENT VARCHAR2(4000) NOT NULL,
    QUESTION_DATE DATE DEFAULT SYSDATE NOT NULL,
    QUESTION_SECRET VARCHAR2(1) DEFAULT 'N' CHECK(QUESTION_SECRET IN ('Y','N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    QUESTION_WRITER NUMBER NOT NULL,
    FOREIGN KEY(QUESTION_WRITER) REFERENCES TB_MEMBER
    );
COMMENT ON COLUMN TB_QUESTION.QUESTION_NO IS '질문글번호';
COMMENT ON COLUMN TB_QUESTION.QUESTION_COMMENT IS '질문내용';
COMMENT ON COLUMN TB_QUESTION.QUESTION_DATE IS '질문작성일';
COMMENT ON COLUMN TB_QUESTION.QUESTION_SECRET IS '공개여부(Y/N)';
COMMENT ON COLUMN TB_QUESTION.STATUS IS '글상태(Y/N)';
COMMENT ON COLUMN TB_QUESTION.QUESTION_WRITER IS '질문자회원번호';

CREATE SEQUENCE SEQ_QNO NOCACHE;


-- 질문 게시판 답변 테이블
CREATE TABLE TB_ANSWER(
    ANSWER_NO NUMBER PRIMARY KEY,
    ANSWER_OR_NOT VARCHAR2(1) DEFAULT 'Y' CHECK(ANSWER_OR_NOT IN ('Y','N')),
    ANSWER_CONTENT VARCHAR2(4000) NOT NULL,
    ANSWER_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STATUS IN('Y','N')),
    ANSWER_WRITER NUMBER NOT NULL,
    FOREIGN KEY (ANSWER_WRITER) REFERENCES TB_MEMBER(MEM_NO)
    );

COMMENT ON COLUMN TB_ANSWER.ANSWER_NO IS '답변글번호';
COMMENT ON COLUMN TB_ANSWER.ANSWER_OR_NOT IS '답변여부';
COMMENT ON COLUMN TB_ANSWER.ANSWER_CONTENT IS '답변내용';
COMMENT ON COLUMN TB_ANSWER.ANSWER_DATE IS '답변작성일';
COMMENT ON COLUMN TB_ANSWER.STATUS IS '글상태(Y/N)';
COMMENT ON COLUMN TB_ANSWER.ANSWER_WRITER IS '답변자회원번호';

CREATE SEQUENCE SEQ_ANO NOCACHE;




-- 공지 테이블
CREATE TABLE TB_NOTICE (
   NOTICE_NO NUMBER PRIMARY KEY,
   MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
   NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
   NOTICE_HITS   NUMBER DEFAULT 0 NOT NULL,
   NOTICE_DATE   DATE DEFAULT SYSDATE NOT NULL,
   NOTICE_STATUS CHAR(1) DEFAULT 'Y' CHECK (NOTICE_STATUS IN('Y','N')),
   NOTICE_MAIN   VARCHAR2(1) DEFAULT 'N' CHECK (NOTICE_MAIN IN('Y','N')),
   NOTICE_FILE   VARCHAR2(4000)
);
COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '공지글번호';
COMMENT ON COLUMN TB_NOTICE.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '게시글내용';
COMMENT ON COLUMN TB_NOTICE.NOTICE_HITS IS '조회수';
COMMENT ON COLUMN TB_NOTICE.NOTICE_DATE IS '작성일';
COMMENT ON COLUMN TB_NOTICE.NOTICE_STATUS IS '글상태 Y(게시) | N(삭제)';
COMMENT ON COLUMN TB_NOTICE.NOTICE_MAIN IS '상위노출 N 비노출 Y';
COMMENT ON COLUMN TB_NOTICE.NOTICE_FILE IS '첨부파일';

CREATE SEQUENCE SEQ_NNO NOCACHE;


-- 코스 테이블
CREATE TABLE TB_COURSE(
    COURSE_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER NOT NULL,
    PALCE1 VARCHAR2(30) NOT NULL,
    PLACE2 VARCHAR2(30) NOT NULL,
    PLACE3 VARCHAR2(30),
    PLACE4 VARCHAR2(30),
    PLACE5 VARCHAR2(30),
    COURSE_TIME NUMBER NOT NULL,
    COURSE_MONEY NUMBER NOT NULL,
    FOREIGN KEY(MEM_NO) REFERENCES TB_MEMBER(MEM_NO)
);

COMMENT ON COLUMN TB_COURSE.COURSE_NO IS '코스테이블 글 번호';
COMMENT ON COLUMN TB_COURSE.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_COURSE.PALCE1 IS '코스 첫번째장소';
COMMENT ON COLUMN TB_COURSE.PLACE2 IS '코스 두번째 장소';
COMMENT ON COLUMN TB_COURSE.PLACE3 IS '코스 세번째 장소';
COMMENT ON COLUMN TB_COURSE.PLACE4 IS '코스 네번째 장소';
COMMENT ON COLUMN TB_COURSE.PLACE5 IS '코스 다섯번째 장소';
COMMENT ON COLUMN TB_COURSE.COURSE_TIME IS '코스에 들어가는 시간';
COMMENT ON COLUMN TB_COURSE.COURSE_MONEY IS '코스에 들어가는 비용';

CREATE SEQUENCE SEQ_CONO
NOCACHE;


-- 신고 게시판 테이블
CREATE TABLE TB_REPORT(
    REPORT_NO NUMBER PRIMARY KEY,
    REPORTER NUMBER NOT NULL,
    REPORTED NUMBER NOT NULL,
    REPORT_CATEGORY VARCHAR2(30) NOT NULL,
    REPORT_CONTENT VARCHAR2(4000) NOT NULL,
    REPORT_DATE DATE ,
    REPORT_COMPLITE DATE,
    REPORT_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(REPORT_STATUS IN('Y','N')),
    POST_NO NUMBER NOT NULL,
    FOREIGN KEY(REPORTER) REFERENCES TB_MEMBER(MEM_NO),
    FOREIGN KEY(REPORTED) REFERENCES TB_MEMBER(MEM_NO)
);
COMMENT ON COLUMN TB_REPORT.REPORT_NO IS '신고번호';
COMMENT ON COLUMN TB_REPORT.REPORTER IS '신고자';
COMMENT ON COLUMN TB_REPORT.REPORTED IS '피신고자';
COMMENT ON COLUMN TB_REPORT.REPORT_CATEGORY IS '신고종류';
COMMENT ON COLUMN TB_REPORT.REPORT_CONTENT IS '신고내용';
COMMENT ON COLUMN TB_REPORT.REPORT_DATE IS '신고시간';
COMMENT ON COLUMN TB_REPORT.REPORT_COMPLITE IS '처리시간';
COMMENT ON COLUMN TB_REPORT.REPORT_STATUS IS '처리상태완료Y미완료N';
COMMENT ON COLUMN TB_REPORT.POST_NO IS '참조게시글번호';

CREATE SEQUENCE SEQ_RENO
NOCACHE;


-- 해시태그 테이블
CREATE TABLE TB_HASHTAG (
    PLACE_NO NUMBER NOT NULL,
    FOREIGN KEY (PLACE_NO) REFERENCES TB_PLACE,
    HASHTAG_NAME VARCHAR2(300) NOT NULL
);
COMMENT ON COLUMN TB_HASHTAG.PLACE_NO IS '장소코드';
COMMENT ON COLUMN TB_HASHTAG.HASHTAG_NAME IS '해시태그(#강남구,..)';


-- 로고 테이블
CREATE TABLE TB_LOGO (
   LOGO_NO NUMBER PRIMARY KEY,
   ORIGIN_NAME   VARCHAR2(255) NOT NULL,
   CHANGE_NAME VARCHAR2(255) NOT NULL,
   FILE_PATH VARCHAR2(1000) NOT NULL,
   UPLOAD_DATE   DATE DEFAULT SYSDATE NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'N' CHECK (STATUS IN('Y','N'))
);
COMMENT ON COLUMN TB_LOGO.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN TB_LOGO.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN TB_LOGO.FILE_PATH IS '파일경로(URL)';
COMMENT ON COLUMN TB_LOGO.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN TB_LOGO.STATUS IS '사용 Y | 미사용 N';

CREATE SEQUENCE SEQ_LONO NOCACHE;


-------------------------------------------------------
---------------------- INSERT -------------------------
-------------------------------------------------------
INSERT INTO TB_LIKE
VALUES (123,'P123');
INSERT INTO TB_LIKE
VALUES (124,'S123');
INSERT INTO TB_LIKE
VALUES (123,'G123');

INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'강남구');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'서초구');
INSERT INTO TB_LOCATION
VALUES (SEQ_LNO.NEXTVAL,'동작구');

INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'호프');
INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'카페');
INSERT INTO TB_CATEGORY
VALUES (SEQ_CNO.NEXTVAL,'식당');

INSERT INTO TB_GRADE
VALUES ('씨앗','resource/css/씨앗.jpg...',0,50);
INSERT INTO TB_GRADE
VALUES ('잔디','resource/css/잔디.jpg...',50,100);
INSERT INTO TB_GRADE
VALUES ('새싹','resource/css/새싹.jpg...',101,200);
INSERT INTO TB_GRADE
VALUES ('벚꽃','resource/css/벚꽃.jpg..',201,30000);
INSERT INTO TB_GRADE
VALUES ('무궁화','resource/css/무궁화.jpg...',30001,99999);

INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,ENROLL_DATE,MEM_STATUS,MEM_FILE,MEM_VISIT,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'무궁화','admin','admin','관리자','관리자','admin@admin.com','ISTJ','010-1234-5678',SYSDATE,'Y','곰돌이사진','2023-02-10','1988-01-01',99999);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'씨앗','user01','pass01','이원종','원종짱짱','onejong@naver.com','ISFJ','010-2345-6789','1988-01-02',250);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_STATUS,MEM_VISIT,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'새싹','user02','pass02','장희주','희주곤듀','hehe@gmail.com','ESTP','010-1594-3578','Y','1988-01-03',350);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MEM_PHONE,MEM_STATUS,MEM_FILE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'잔디','user03','pass03','홍상원','잘생긴상원','upOne@kakao.com','010-3698-4578','N','악어사진','2000-12-31',400);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'벚꽃','user04','pass04','박용진','용진','yj@yj.com','ISFP','010-8520-9630','1988-01-05',10);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'씨앗','user05','pass05','조준하','쏜애플메보','ssonapple@love.com','010-7894-3215','1988-01-06',150);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'새싹','user06','pass06','김시연','앙제조기','angToAng@ang.com','ESTJ','010-4568-9513','1988-01-07',30);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'잔디','user07','pass07','김지원','운영매니저','mannager@man.com','ESFJ','010-4567-3547','1988-01-08',80);
INSERT INTO TB_MEMBER (MEM_NO,GRADE,MEM_ID,MEM_PWD,MEM_NAME,NICKNAME,EMAIL,MBTI,MEM_PHONE,MEM_BIRTHDAY,MEM_POINT)
VALUES (SEQ_MNO.NEXTVAL,'벚꽃','user08','pass08','박민수','취업담탱','tang@tangg.com','ENFP','010-1596-3574','1988-01-09',90);

INSERT INTO TB_PLACE VALUES(SEQ_PNO.NEXTVAL,1,1,1,SYSDATE,'Y','010-1234-2222','경기도 용인시 구성면 언남리 341-7 상록빌라 2-1','하이룽~','2','4',3,'https://www.naver.com',5,4,40000,'N');
INSERT INTO TB_PLACE VALUES(SEQ_PNO.NEXTVAL,3,3,2,SYSDATE,'N','010-5556-1561','경기도 파주시 적성면 구읍리 사서함 95-16','딱대','5','15',4,'https://www.daum.net/',20,42,34000,'N');
INSERT INTO TB_PLACE VALUES(SEQ_PNO.NEXTVAL,2,7,3,SYSDATE,'Y','010-1111-2222','인천시 남동구 만수1동 삼한A 204-1102','흠냐링','7','14',1,'https://www.google.com',33,33,4000,'Y');

INSERT INTO TB_FREE_BOARD VALUES(SEQ_FBNO.NEXTVAL, 1, '안녕하세요1', 1, DEFAULT, 'Y', 'N', 'bgsample.PNG');
INSERT INTO TB_FREE_BOARD VALUES(SEQ_FBNO.NEXTVAL, 5, '안녕하세요2', 20, DEFAULT, 'N', 'N', 'apple.PNG');
INSERT INTO TB_FREE_BOARD VALUES(SEQ_FBNO.NEXTVAL, 9, '안녕하세요3', 33, DEFAULT, 'Y', 'N', 'banana.PNG');

INSERT INTO TB_REPLY VALUES(SEQ_RPNO.NEXTVAL,3,1,'좋은 글 감사',23,DEFAULT,'Y','N','ASDF.IMG');
INSERT INTO TB_REPLY VALUES(SEQ_RPNO.NEXTVAL,5,2,'우왕',13,'23-06-18','N','N',NULL);
INSERT INTO TB_REPLY VALUES(SEQ_RPNO.NEXTVAL,1,3,'하이룽~',3,DEFAULT,'Y','Y','GG.IMG');

INSERT INTO TB_REVIEW VALUES(SEQ_RVNO.NEXTVAL,3,4,DEFAULT,'맛집이네유','QQQQ.IMG',DEFAULT);
INSERT INTO TB_REVIEW VALUES(SEQ_RVNO.NEXTVAL,1,7,'23-08-20','굳쟙','ㅋㅋㅋ.IMG','Y');
INSERT INTO TB_REVIEW VALUES(SEQ_RVNO.NEXTVAL,2,3,DEFAULT,'흐음~별룬디',NULL,DEFAULT);

INSERT INTO TB_VISIT VALUES(DEFAULT,5,2);
INSERT INTO TB_VISIT VALUES(DEFAULT,3,1);
INSERT INTO TB_VISIT VALUES(DEFAULT,5,1);

INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'환불해줭',DEFAULT,DEFAULT,DEFAULT,2);
INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'이거 어케함','23-07-21','Y','Y',7);
INSERT INTO TB_QUESTION VALUES(SEQ_QNO.NEXTVAL,'질문있음','22-11-01','N',DEFAULT,1);

INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,DEFAULT,'알아서해',DEFAULT,DEFAULT,3);
INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,'Y','나도몰루','23-07-21','N',3);
INSERT INTO TB_ANSWER VALUES(SEQ_ANO.NEXTVAL,DEFAULT,'흐음',DEFAULT,DEFAULT,3);

INSERT INTO TB_NOTICE VALUES(SEQ_NNO.NEXTVAL,1,'필독!',330,DEFAULT,DEFAULT,'Y','공지사항.IMG');
INSERT INTO TB_NOTICE VALUES(SEQ_NNO.NEXTVAL,1,'공지입니다!',230,'23-01-03','N','N','흠냐링.IMG');
INSERT INTO TB_NOTICE VALUES(SEQ_NNO.NEXTVAL,1,'점검할게요',30,'22-11-30',DEFAULT,'Y','공지염.IMG');

INSERT INTO TB_COURSE VALUES(SEQ_CONO.NEXTVAL,1,'역삼갈비','역삼쭈꾸미','역삼돼지','역삼삼겹살','역삼냉면',30 ,1000);
INSERT INTO TB_COURSE VALUES(SEQ_CONO.NEXTVAL,3,'선릉갈비','선릉쭈꾸미','선릉돼지','선릉삼겹살','선릉냉면',40 ,2000);
INSERT INTO TB_COURSE VALUES(SEQ_CONO.NEXTVAL,8,'한남갈비','한남쭈꾸미','한남돼지','한남삼겹살','한남냉면',50 ,3000);

INSERT INTO TB_REPORT VALUES(SEQ_CONO.NEXTVAL,'1','2','비방','욕해요1',DEFAULT,NULL,'N',1);
INSERT INTO TB_REPORT VALUES(SEQ_CONO.NEXTVAL,'4','5','불법광고','토토광고해요',DEFAULT,'23-08-20','Y',2);
INSERT INTO TB_REPORT VALUES(SEQ_CONO.NEXTVAL,'3','1','허위게시글','아니 갔는데 없잖아여',DEFAULT,NULL,'N',3);

INSERT INTO TB_HASHTAG VALUES(1,'강남구,서초구,을지로');
INSERT INTO TB_HASHTAG VALUES(3,'을지로,검단,종로3가');
INSERT INTO TB_HASHTAG VALUES(2,'홍대,구월동,명동');

INSERT INTO TB_LOGO VALUES(SEQ_LONO.NEXTVAL,'원본명1.IMG','LOGO1.IMG','/RESOUCES/IMG~~','20-07-11','Y');
INSERT INTO TB_LOGO VALUES(SEQ_LONO.NEXTVAL,'원본명2.IMG','LOGO2.IMG','/RESOUCES/IMG~~','22-07-11','N');
INSERT INTO TB_LOGO VALUES(SEQ_LONO.NEXTVAL,'원본명3.IMG','LOGO3.IMG','/RESOUCES/IMG~~','23-07-11','N');

-------------------------------------------------------------------
---------------------------- SELECT문 ------------------------------
--------------------------------------------------------------------
SELECT * FROM TB_LIKE;
SELECT * FROM TB_LOCATION;
SELECT * FROM TB_CATEGORY;
SELECT * FROM TB_GRADE;
SELECT * FROM TB_MEMBER;
SELECT * FROM TB_PLACE;
SELECT * FROM TB_FREE_BOARD;
SELECT * FROM TB_REPLY;
SELECT * FROM TB_REVIEW;
SELECT * FROM TB_VISIT;
SELECT * FROM TB_VISIT;
SELECT * FROM TB_ANSWER;
SELECT * FROM TB_NOTICE;
SELECT * FROM TB_COURSE;
SELECT * FROM TB_REPORT;
SELECT * FROM TB_HASHTAG;
SELECT * FROM TB_LOGO;

SELECT * FROM TB_FREE_BOARD;
INSERT INTO TB_FREE_BOARD (BOARD_NO,MEM_NO,BOARD_CONTENT,BOARD_COUNT) VALUES(4,4,1,1);