show tables;

create table board (
	idx int not null auto_increment,	/* 게시글의 고유번호 */
	mid varchar(20) not null,					/* 게시글 올린이 아이디 */
	nickName varchar(20) not null,   /* 게시글 올린이 닉네임 */
	title varchar(100) not null,			/* 게시글 제목 */
	content text not null,						/*글 내용*/
	readNum int default 0,						/*글 조회수*/
	partArea varchar(30) not null,				/*지역선택하기 (서울/경기도/충정도/경상도/강원도/전라도/제주도)*/
	part varchar(20) not null,	/* (산책후기/추천(가본곳)/(명소)가보고 싶은곳) */
	wDate datetime default now(), 		/*글쓴 날짜*/
	good int default 0,								/* '좋아요' 클릭 횟수 누적 */
	complaint char(2) default 'NO',		/* 신고글 유무(신고당한글:OK, 정상글:NO)*/
	primary key(idx),									/*기본키 : 고유번호 */
	foreign key(mid) references member2(mid)
);
drop table board;
desc board;

insert into board values (default, 'admin', '관리맨', '게시판 서비스를 시작합니다.','즐거운 게시판생활이 되세요.',default,'서울','산책후기',default,default,default);

/*댓글 달기*/
create table boardReply (
	idx int not null auto_increment, /*댓글 고유번호*/
	boardIdx	int not null, 	/*원본글(부모글)의 고유번호-외래키로 지정*/
	mid	varchar(20) not null, 	/* 댓글 올린이의 아이디 */
	nickName varchar(20) not null, /*댓글 올린이의 닉네임*/
	wDate datetime default now(), /*댓글 올린 날짜/시간 */
	content text not null,	/* 댓글 내용*/
	primary key(idx),
	foreign key(boardIdx) references board(idx)
	on update cascade
	on delete restrict
);

drop table boardReply;
desc boardReply;


insert into boardReply values (default, 1, 'ctom1234', '씨톰맨', default, '굿');


