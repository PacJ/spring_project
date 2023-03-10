
CREATE TABLE reply(
 rno number CONSTRAINT reply_rno PRIMARY KEY,
 bno number,
 replytext varchar2(1000),
 memberEmail varchar2(50),
 regdate date,
 rupload varchar2(1000),
 CONSTRAINT reply_bno FOREIGN KEY(bno) REFERENCES board(num),
 CONSTRAINT reply_memberEmail FOREIGN KEY(memberEmail) REFERENCES members(memberEmail)
);



CREATE SEQUENCE reply_rno_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



INSERT INTO reply VALUES(reply_rno_seq.nextval,1,'댓글내용1','min@daum.net',sysdate);
INSERT INTO reply VALUES(reply_rno_seq.nextval,1,'댓글내용2','min@daum.net',sysdate);
select * from tbl_reply;

SELECT b.*, r.* 
FROM board b,  reply r
WHERE b.bno=r.bno(+) AND b.bno=1
      

ALTER TABLE reply ADD  rupload varchar2(1000);






