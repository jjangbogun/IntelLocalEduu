CREATE TABLE FREE_BOARD(
  FREE_BOARD_ID NUMBER NOT NULL,
  MEMBER_NO NUMBER NOT NULL,
  FREE_BOARD_TITLE VARCHAR2(765) NOT NULL,
  FREE_BOARD_CONTENT VARCHAR2(4000) NOT NULL,
  CREATE_DATE DATE NOT NULL,
  UPDATE_DATE DATE NOT NULL
);

COMMENT ON TABLE FREE_BOARD IS '자유게시판';

COMMENT ON COLUMN FREE_BOARD.FREE_BOARD_ID IS '자유게시판 번호';
COMMENT ON COLUMN FREE_BOARD.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN FREE_BOARD.FREE_BOARD_TITLE IS '자유게시판 주제';
COMMENT ON COLUMN FREE_BOARD.FREE_BOARD_CONTENT IS '자유게시판 본문';
COMMENT ON COLUMN FREE_BOARD.CREATE_DATE IS '자유게시판 생성날짜';
COMMENT ON COLUMN FREE_BOARD.UPDATE_DATE IS '자유게시판 수정날짜';

ALTER TABLE FREE_BOARD 
ADD CONSTRAINT FREE_BOARD_ID_PK 
PRIMARY KEY(FREE_BOARD_ID);

ALTER TABLE FREE_BOARD 
ADD CONSTRAINT FREE_BOARD_MEMBER_NO_FK
FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO);

DROP SEQUENCE FREE_BOARD_ID_SEQ;
CREATE SEQUENCE FREE_BOARD_ID_SEQ
INCREMENT BY 1
START WITH 1;

INSERT INTO free_board
VALUE(  FREE_BOARD_ID, MEMBER_NO, FREE_BOARD_TITLE, FREE_BOARD_CONTENT, 
        CREATE_DATE, UPDATE_DATE)
VALUES(FREE_BOARD_ID_SEQ.NEXTVAL, 1, '자유게시판이라', 
'자유란 무엇인가, 이 질문에 답할 수 있는 사람은 얼마나 될까', SYSDATE, SYSDATE);

INSERT INTO free_board
VALUE(FREE_BOARD_ID, MEMBER_NO, FREE_BOARD_TITLE, FREE_BOARD_CONTENT 
    , CREATE_DATE, UPDATE_DATE)
VALUES(FREE_BOARD_ID_SEQ.NEXTVAL, 2, '자유?', '이 세상에 자유란 없다 억압하는 세상이지'
    , SYSDATE, SYSDATE);

INSERT INTO free_board
VALUE(  FREE_BOARD_ID, MEMBER_NO, FREE_BOARD_TITLE, FREE_BOARD_CONTENT
    , CREATE_DATE, UPDATE_DATE)
VALUES(FREE_BOARD_ID_SEQ.NEXTVAL, 4, '자유는 있다', '자유란 아무걱정도 없는 것이다 BY BG'
    , SYSDATE, SYSDATE);

SELECT  FB.FREE_BOARD_ID, M.MEMBER_NO, m.member_name, 
    FB.FREE_BOARD_TITLE, FB.FREE_BOARD_CONTENT, FB.CREATE_DATE, FB.UPDATE_DATE
FROM MEMBER M, FREE_BOARD FB
WHERE M.MEMBER_NO = FB.MEMBER_NO
ORDER BY FB.FREE_BOARD_ID DESC;

COMMIT;

desc free_board


INSERT INTO free_board
VALUE(FREE_BOARD_ID, MEMBER_NO, FREE_BOARD_TITLE, FREE_BOARD_CONTENT
    , CREATE_DATE, UPDATE_DATE)
VALUES(FREE_BOARD_ID_SEQ.NEXTVAL, 6, 
    '제목:TEST 자료' || FREE_BOARD_ID_SEQ.CURRVAL,
    '내용:TEST 자료' || FREE_BOARD_ID_SEQ.CURRVAL, 
     SYSDATE + FREE_BOARD_ID_SEQ.CURRVAL, SYSDATE + FREE_BOARD_ID_SEQ.CURRVAL);
     
commit;


SELECT RNUM, FREE_BOARD.FREE_BOARD_ID, FREE_BOARD.MEMBER_NO
    , FREE_BOARD.MEMBER_NAME, FREE_BOARD.FREE_BOARD_TITLE, FREE_BOARD.FREE_BOARD_CONTENT
    , FREE_BOARD.CREATE_DATE, FREE_BOARD.UPDATE_DATE
FROM (  SELECT  ROWNUM RNUM, FB.FREE_BOARD_ID, FB.MEMBER_NO, FB.MEMBER_NAME, 
            FB.FREE_BOARD_TITLE, FB.FREE_BOARD_CONTENT, FB.CREATE_DATE, FB.UPDATE_DATE
        FROM (  SELECT  OFB.FREE_BOARD_ID, M.MEMBER_NO, M.MEMBER_NAME, 
                    OFB.FREE_BOARD_TITLE, OFB.FREE_BOARD_CONTENT, OFB.CREATE_DATE, OFB.UPDATE_DATE
                FROM MEMBER M, FREE_BOARD OFB
                WHERE M.MEMBER_NO = OFB.MEMBER_NO
                ORDER BY OFB.FREE_BOARD_ID DESC) FB
) FREE_BOARD
WHERE RNUM >= 1 AND RNUM <= 3;

