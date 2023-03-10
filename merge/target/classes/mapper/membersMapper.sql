CREATE TABLE   members(
  memberEmail varchar2(50) ,  --이메일
  memberPass varchar2(30),  --비밀번호
  memberName varchar2(30), --이름
  memberPhone char(11),  --전화번호  
  memberType number(1),  --회원구분 일반회원 1, 관리자 2
  constraint members_email primary key(memberEmail)
);