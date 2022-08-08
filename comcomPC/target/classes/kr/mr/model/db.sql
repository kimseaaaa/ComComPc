use sample;

create table game(
	gcode int auto_increment primary key,
    gname varchar(20) not null,
    gcat varchar(10) not null,
    gcomp varchar(20) not null,
    gimg varchar(50) not null,
    gfee varchar(5) not null,
    gupdate datetime default now() not null

);

create table admin(
	id varchar(20) primary key,
    pw varchar(20) not null
);

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

create table foodorder(
	fodcode int auto_increment primary key,
	fodid varchar(20) not null,
    fodpri int not null,
    foddate  datetime default now() not null,
    fcode int not null,
    fodqty int not null,
    fodok int default 0 not null,
    seatnum int not null,
    fname  varchar(20) not null
);