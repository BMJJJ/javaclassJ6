show tables;

create table member2 (
 	idx       int not null auto_increment,/* 회원 고유번호 */
  mid       varchar(30) not null,				/* 회원 아이디(중복불허) */
  pwd       varchar(100) not null,			/* 회원 비밀번호(SHA256 암호화 처리) */
  nickName  varchar(20) not null,				/* 회원 별명(중복불허/수정가능) */
  name		  varchar(20) not null,				/* 회원 성명 */
  gender    char(2)	not null default '남자',	/* 회원 성별 */
  birthday  datetime default now(),			/* 회원 생일 */
  tel			  varchar(15),								/* 전화번호 : 010-1234-5678 */
  address   varchar(100),								/* 주소(다음 API 활용) */
  email		  varchar(60) not null,		  	/* 이메일(아이디/비밀번호 분실시에 사용)-형식체크필수 */
	photo		  varchar(100) default 'noimage.jpg', /* 회원 사진 */
	userInfor char(3) default '공개',			/* 회원 정보 공개여부(공개/비공개) */
  userDel   char(2)  default 'NO',			/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  level     int default 1,							/* 회원등급(0:관리자, 1:준회원, 2:정회원, (4:운영자)) , 99:탈퇴신청회원 */
  visitCnt  int default 0,							/* 총 방문횟수 준회원이 10번이상 방문시 정회원 승급 */
  startDate datetime default now(),			/* 최초 가입일 */
  lastDate  datetime default now(),			/* 마지막 접속일 */
  todayCnt  int default 0,							/* 오늘 방문한 횟수 */
  primary key (idx),
  unique(mid)
);

desc member2;

insert into member2 values (default, 'admin', '1234', '관리맨', '관리자', '남자', default, '010-1234-1234', '050/산책시/산책아파트/100동/101호','abc@atom.com', default, default, default, default, default, default, default, default);

select * from member2;

/* 실시간 DB채팅 테이블 설계*/
create table memberChat (
	idx int not null auto_increment primary key,
	nickName varchar(20) not null,
	chat varchar(100) not null
);
desc memberChat;


