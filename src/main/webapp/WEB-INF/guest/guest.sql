show tables;

create table guest2(
	idx int not null auto_increment primary key,		/*방명록 고유번호*/
	name varchar(20) not null, /*방명록 작성자 성명*/
	content text not null, /*방명록 글 내용*/
	email varchar(60), /*메일주소*/
	visitDate datetime default now(), /*방문일자*/
	hostIp varchar(30) not null /*방문자의 접속 IP*/
);

desc guest;

insert into guest values ()
