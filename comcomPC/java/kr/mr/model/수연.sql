#############################################################################

# comcomPC 회원정보, 회원수정, 회원삭제, 회원저장, 회원조회

# admin
create table admin(
	id varchar(20) primary key,
    pw varchar(20) not null
);

insert into admin(id, pw)
values('test', '1234');
select * from admin;
commit;
# client
create table client(
    id varchar(20) primary key,
    pw varchar(20) not null,
    tel varchar(13) not null,
    birth varchar(10) not null,
    memo varchar(100),
    totpri int default 0,
    totfood int default 0,
    mytime int default 0,
    seatnum int default 0
);

select * from client;

insert into client(id,pw,tel,birth,memo,totpri,totfood,mytime,seatnum) values('ddd','1234','010-2222','01-05-31','test@gmail.com',0,0,0,0);
insert into client(id,pw,tel,birth,memo,totpri,totfood,mytime,seatnum) values('ddd1','1234','010-2222','01-05-31','test@gmail.com',0,0,0,0);
insert into client(id,pw,tel,birth,memo,totpri,totfood,mytime,seatnum) values('ddd2','1234','010-2222','01-05-31','test@gmail.com',0,0,0,0);
insert into client(id,pw,tel,birth,memo,totpri,totfood,mytime,seatnum) values('ddd3','1234','010-2222','01-05-31','test@gmail.com',0,0,0,0);
select * from client;

use sample;
# timeorder 
create table timeorder(
	todcode int auto_increment primary key,
	todid varchar(20) not null,
    todpri int not null,
    toddate datetime default now() not null
);
select * from timeorder;


# 다해
create table game(
	gcode int auto_increment primary key,
    gname varchar(20) not null,
    gcat varchar(10) not null,
    gcomp varchar(20) not null,
    gimg varchar(50) not null,
    gfee varchar(5) not null,
    gupdate datetime default now() not null
);

select * from game;

use sample;

create table gamerank(
	ranking int not null,
    grstat varchar(5) not null,
    grgap int,
    grname varchar(50) not null,
    grcomp varchar(20) not null,
    grshare varchar(10) not null,
    grupdate datetime default now() not null
);


create table gamenew(
	gnrelease varchar(20) not null,
    gnname varchar(50) not null,
    gnshare varchar(10) not null,
    gnupdate datetime default now() not null
);

create table seat(
	seatnum int not null,
    sfix int default 0,
    sid varchar(20)
);

insert into seat(seatnum) values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),
(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),
(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),
(61),(62),(63),(64),(65),(66),(67),(68),(69),(70);

alter table food modify fimg varchar(50);

create table food(
   fcode int auto_increment primary key,
    fname varchar(20) not null,
    fcat varchar(10) not null,
    fpri int not null,
    fimg varchar(50) not null,
    fbest int default 0
);

select * from food;

ALTER TABLE food ADD fbest int default 0;

commit;



insert into food (fname,fcat, fpri,fimg)
values('까르보 불닭볶음면','식사','1800','까르보 불닭볶음면.jpg');

insert into food (fname,fcat, fpri,fimg)
values('너구리','식사','1500','너구리.jpg');

insert into food (fname,fcat, fpri,fimg)
values('신라면','식사','1500','신라면.png');

insert into food (fname,fcat, fpri,fimg)
values('왕뚜껑','식사','1500','왕뚜껑.jpg');

insert into food (fname,fcat, fpri,fimg)
values('진라면','식사','1500','진라면.jpg');

insert into food (fname,fcat, fpri,fimg)
values('짜파게티','식사','1500','짜파게티.jpg');

insert into food (fname,fcat, fpri,fimg)
values('참깨라면','식사','1500','참깨라면.jpg');

insert into food (fname,fcat, fpri,fimg)
values('튀김우동','식사','1500','튀김우동.jpg');

insert into food (fname,fcat, fpri,fimg)
values('육개장','식사','1200','육개장.jpg');

insert into food (fname,fcat, fpri,fimg)
values('너구리(봉지라면)','식사','3500','너구리(봉지라면).jpg');

insert into food (fname,fcat, fpri,fimg)
values('삼양라면(봉지라면)','식사','3500','삼양라면(봉지라면).jpg');

insert into food (fname,fcat, fpri,fimg)
values('진라면(봉지라면)','식사','3500','진라면(봉지라면).jpg');

insert into food (fname,fcat, fpri,fimg)
values('비빔면(봉지라면)','식사','3800','비빔면(봉지라면).jpg');

insert into food (fname,fcat, fpri,fimg)
values('비프 핫도그','식사','3800','비프 핫도그.jpg');

insert into food (fname,fcat, fpri,fimg)
values('할라피뇨 핫도그','식사','3800','할라피뇨 핫도그.jpg');

insert into food (fname,fcat, fpri,fimg)
values('스팸마요','식사','5000','스팸마요.jpg');

insert into food (fname,fcat, fpri,fimg)
values('참치마요','식사','5000','참치마요.jpg');

insert into food (fname,fcat, fpri,fimg)
values('김치볶음밥','식사','5500','김치볶음밥.jpg');

insert into food (fname,fcat, fpri,fimg)
values('떡볶이','식사','5000','떡볶이.jpg');

insert into food (fname,fcat, fpri,fimg)
values('라볶이','식사','5300','라볶이.jpg');

insert into food (fname,fcat, fpri,fimg)
values('로제떡볶이','식사','5500','로제떡볶이.jpg');



insert into food (fname,fcat, fpri,fimg)
values('감자깡','스낵','1500','감자깡.jpg');

insert into food (fname,fcat, fpri,fimg)
values('새우깡','스낵','1500','새우깡.jpg');

insert into food (fname,fcat, fpri,fimg)
values('논두렁','스낵','1000','논두렁.jpg');

insert into food (fname,fcat, fpri,fimg)
values('뿌셔뿌셔','스낵','1200','뿌셔뿌셔.jpg');

insert into food (fname,fcat, fpri,fimg)
values('오땅볼','스낵','1500','오땅볼.jpg');

insert into food (fname,fcat, fpri,fimg)
values('오징어집','스낵','1500','오징어집.jpg');

insert into food (fname,fcat, fpri,fimg)
values('옥수수깡','스낵','1500','옥수수깡.jpg');

insert into food (fname,fcat, fpri,fimg)
values('와사비맛 아몬드','스낵','2200','와사비맛 아몬드.jpg');

insert into food (fname,fcat, fpri,fimg)
values('와클','스낵','1500','와클.jpg');

insert into food (fname,fcat, fpri,fimg)
values('죠리퐁','스낵','1500','죠리퐁.jpg');

insert into food (fname,fcat, fpri,fimg)
values('차카니','스낵','1000','차카니.jpg');

insert into food (fname,fcat, fpri,fimg)
values('치킨팝','스낵','1200','치킨팝.png');

insert into food (fname,fcat, fpri,fimg)
values('포스틱','스낵','1500','포스틱.jpg');

insert into food (fname,fcat, fpri,fimg)
values('포카칩(어니언)','스낵','1500','포카칩(어니언).jpg');

insert into food (fname,fcat, fpri,fimg)
values('포카칩(오리지널)','스낵','1500','포카칩(오리지널).jpg');

insert into food (fname,fcat, fpri,fimg)
values('홈런볼','스낵','1500','홈런볼.jpg');




insert into food (fname,fcat, fpri,fimg)
values('아이스아메리카노','음료','3500','아이스아메리카노.png');

insert into food (fname,fcat, fpri,fimg)
values('카페라떼','음료','3800','카페라떼.jpg');

insert into food (fname,fcat, fpri,fimg)
values('카페모카','음료','3800','카페모카.jpg');

insert into food (fname,fcat, fpri,fimg)
values('자몽에이드','음료','3800','자몽에이드.jpg');

insert into food (fname,fcat, fpri,fimg)
values('청포도에이드','음료','3800','청포도에이드.jpg');

insert into food (fname,fcat, fpri,fimg)
values('레몬에이드','음료','3800','레몬에이드.jpg');

insert into food (fname,fcat, fpri,fimg)
values('블루베리스무디','음료','4000','블루베리스무디.jpg');

insert into food (fname,fcat, fpri,fimg)
values('딸기스무디','음료','4000','딸기스무디.jpg');


insert into food (fname,fcat, fpri,fimg)
values('코카콜라','음료','1800','트래비.jpg');

insert into food (fname,fcat, fpri,fimg)
values('바나나우유','음료','1600','바나나우유.jpg');

insert into food (fname,fcat, fpri,fimg)
values('코카콜라','음료','1500','코카콜라.jpg');

insert into food (fname,fcat, fpri,fimg)
values('칠성사이다','음료','1500','칠성사이다.jpg');

insert into food (fname,fcat, fpri,fimg)
values('스프라이트','음료','1500','스프라이트.jpg');

insert into food (fname,fcat, fpri,fimg)
values('갈만배(갈아만든배)','음료','1500','갈만배(갈아만든배).jpg');

insert into food (fname,fcat, fpri,fimg)
values('웰치스(딸기)','음료','1500','웰치스(딸기).jpg');

insert into food (fname,fcat, fpri,fimg)
values('트로피카나 스파클링(망고)','음료','1500','트로피카나 스파클링(망고).jpg');

insert into food (fname,fcat, fpri,fimg)
values('트로피카나 스파클링(포도)','음료','1500','트로피카나 스파클링(포도).jpg');

insert into food (fname,fcat, fpri,fimg)
values('환타','음료','1200','환타.jpg');

insert into food (fname,fcat, fpri,fimg)
values('밀키스','음료','1200','밀키스.jpg');

insert into food (fname,fcat, fpri,fimg)
values('피크닉','음료','800','피크닉.jpg');