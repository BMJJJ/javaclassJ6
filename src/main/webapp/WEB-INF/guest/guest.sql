show tables;

create table guest2 (
	idx int not null auto_increment,		/*방명록 고유번호*/
	mid varchar(20) not null, /*방명록 작성자 아이디*/
	nickName varchar(20) not null,
	title varchar(100) not null,			/* 게시글 제목 */
	content text not null, /*방명록 글 내용*/
	visitDate datetime default now(), /*방문일자*/
	primary key(idx),
	foreign key(mid) references member2(mid)
);

desc guest2;

drop table guest2;

insert into guest2 values (default, 'admin','관리맨', '게시판 서비스를 시작합니다.', '화이팅', default);

