##############################################
게시판 만들기
##############################################

1. 테이블생성 
CREATE TABLE   board(
    num number CONSTRAINT board_num PRIMARY KEY,
    subject varchar2(50),
    reg_date date,
    readcount number default 0, 
    ref number, 
    re_step number, 
    re_level number, 
    content varchar2(100),
    ip varchar2(20),
    upload varchar2(300),
    memberEmail varchar2(50),
   CONSTRAINT board_memberEmail FOREIGN KEY(memberEmail) REFERENCES members(memberEmail)
);

CREATE SEQUENCE board_num_seq
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO board 
VALUES(board_num_seq.nextval, '홍길동','young@aaaa.com','제목1',sysdate,0,board_num_seq.nextval,
0,0,'내용 테스트.......','127.0.0.1','sample.txt');

commit;


select b.* 
from (select rownum as rm, a.*
	  from (select *
	 	    from board
            order by ref desc, re_step asc) a)b
where b.rm>=? and b.rm<=?           



-- 컬럼 추가
/*
ALTER TABLE board
ADD memberEmail varchar2(50);
*/

-- 제약조건 
/*
ALTER TABLE board
ADD CONSTRAINT board_memberEmail FOREIGN KEY(memberEmail) REFERENCES members(memberEmail);
*/



























