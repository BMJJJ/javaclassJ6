create table place(
	idx int not null auto_increment primary key, 
	jiyok varchar(30),
	jangso varchar(30),
	img varchar(50),
	story text,
	nickName varchar(50) not null
);

desc place;
drop table place;

insert into place values (default,'청주', '오송 호수 공원', '오송-호수-공원.gif', '평화롭고 고즈넉한 풍경이 장점이며 연계저수지를 따라 걷기 좋은 산책로가 있으며 다양한 습지 식물들 또한 관찰 가능하다.','관리맨');
insert into place values (default,'청주', '상당공원', '상당공원.jpg','도심 속에서 잠시 휴식이 필요할 떄 들리기 좋으며 잠깐 산책하며 걷기에 부족함이 없는 공원이다','관리맨');
insert into place values (default,'청주', '오창 호수 공원', '오창-호수-공원.jpg','호암저수지를 중심으로 조성되어 있는 공원으로 아름다운 호수의 풍경과 넓게 깔린 푸르른 잔디가 어우러져 있어 조용히 산책은 물론 보고만 있어도 눈이 시원하다는 평이있다.','관리맨');
insert into place values (default,'청주', '문암 생태 공원', '문암생태.jpg','문암생태공원에는 놀이터와 무심천을 건널 수 있는 길과 또한 사람들이 자유롭게 쉴 수 있는 쉼터가 있고 풀과 나무가 주변을 감싸고 쓰레기가 없고 깨끗해서 자연을 보호하고 환경문제를 해결할 수 있는 좋은 방법을 보여주고 있는 공원이다.','관리맨');
insert into place values (default,'청주', '명암 저수지', '명암-저수지.jpg','아름다운 저수지와 호숫가에 우똑 솟아있는 명암타워가 이채로운 풍경을 선사하며,수변 산책로를 따라 호젓한 호수 뷰를 즐기며 여유로운 산책을 즐겨볼 수 있는 장점이있다.','관리맨');
insert into place values (default,'청주', '우암산 둘레길', '우암산-둘레길.jpg','둘레길은 걷다가 힘들때 편히 쉴수 있는 벤치와 수망골 전망대와 특색있는 조형물등 여러 포토존이 존재하여 여러가지로 즐길거리가 많은 산책로이다.','관리맨');
insert into place values (default,'청주', '무심천', '무심천2.jpg',' 무심천에는 이렇게 나지막한 다리들이 있어 어릴 적 추억을 고스란히 느끼게 해 주며 한자의 의미대로 모든 근심과 걱정이 없애고 아름다운 모습만이 간직하게 해주는 곳으로 사랑과 활기 그리고 편안함이 있는 청주의 대표적인 명소입니다.','관리맨');
insert into place values (default,'청주', '상당산성', '상당산성.jpg','상당산성은 수령이 제법 되는 나무들이 많아 공기가 맑고 성벽을 따라 거닐기 좋게 숲길이 잘 조성되어 있어서 많은 사람들이 산책을 즐기기 좋으며 특히 아름다운 단풍이 물드는 가을의 정취를 흠뻑 느낄수 있어 단풍 명소로 유명하다.','관리맨');

select * from place;