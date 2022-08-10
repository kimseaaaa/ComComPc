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