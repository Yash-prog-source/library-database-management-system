create database readers;
use readers;
create table readers ( readers_id VARCHAR(13),
    fname VARCHAR(14),
    mname VARCHAR(18),
    ltname VARCHAR(20),
    city VARCHAR(20),
    mobileno varchar(40),
    occupation VARCHAR(24),
    dob DATE,
    CONSTRAINT readers_fk PRIMARY KEY (readers_id));
desc readers;

insert into readers values ('C0001',"yash","prakash","kamble","ballapur",7890878786,"service",'1978-12-08');
insert into readers values ('C0002',"sanket","rahul","patil","ratanpur",7890878786,"bank mannger",'1978-12-08');
insert into readers values ('C0003',"sam","sohil","rasker","chandrapur","7890854642","army teacher",'1974-12-08');
insert into readers values ('C0004',"ram","sam","khan","rajura",8890878786,"SERVICE",'1979-12-08');
insert into readers values ('C0005',"john","vinit","KAMBLE","BALLARPUR",6586478786,"SERVICE",'1978-12-08');
insert into readers values ('C0006',"vijay","vibhor","KAMBLE","delhi",8452078786,"police",'1998-12-08');
SELECT*FROM readers;

CREATE TABLE book (
    bid VARCHAR(10),
    bname VARCHAR(20),
    bdomain VARCHAR(20),
    CONSTRAINT book_bid_pk PRIMARY KEY (bid)
);
desc book;
insert into book values ("B00001","the pussy cat","story");
insert into book values ("B00002","the old lady","story");
insert into book values ("B00003","the long neck","story");
select*from  book;

CREATE TABLE active_readers (
    account_id VARCHAR(6),
    readers_id VARCHAR(6),
    bid VARCHAR(18),
    atype VARCHAR(30),
    astatus VARCHAR(28),
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY (account_id),
    CONSTRAINT account_readersid_fk FOREIGN KEY (readers_id)
        REFERENCES readers (readers_id),
	 CONSTRAINT  account_bid_fk FOREIGN KEY (bid) REFERENCES book(bid)
);
desc active_readers;

insert into active_readers values ('A00001','C0001','B00001',"PRENIMUM","ACTIVE" );
insert into active_readers values ('A00002','C0002','B00002',"PRENIMUM","ACTIVE");
insert into active_readers values ('A00003','C0004','B00002',"REGULAR","ACTIVE" );
insert into active_readers values ('A00004','C0006','B00003',"REAGULAR","ACTIVE" );
insert into active_readers values ('A00005','C0005','B00002',"PRENIMUM","SUSPENDED" );
insert into active_readers values ('A00006','C0001','B00001',"PRENIMUM","ACTIVE" );
insert into active_readers values ('A00007','C0002','B00001',"REGULAR","TERMINATED" );
insert into active_readers values ('A00008','C0003','B00003',"PRENIMUM","TERMINATED" );
insert into active_readers values ('A00009','C0004','B00002',"PRENIMUM","ACTIVE" );
insert into active_readers values ('A00010','C0002','B00002',"REGULAR","ACTIVE" );
SELECT*FROM active_readers;

create table bookissue_details( issuenumber VARCHAR(6),
    readers_id VARCHAR(6),
    bid VARCHAR(18),
    bookname VARCHAR(30),
    numbers_of book_issued int(7),
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY (issuenumber),
    CONSTRAINT  trandetails_tnumber_pk FOREIGN KEY (account_id)
        REFERENCES active_readers (account_id),
);

show tables;
drop table bookissue_details;

insert into bookissue_details values ('T00001','A00001','B00001',"the pussy cat",79 );
insert into bookissue_details values ('T00002','A00002','B00002',"the long neck",88);
insert intobookissue_details values ('T00003','A00004','B00002',"the old lady", 106);
insert into bookissue_details values ('T00004','A00006','B00003',"the pussy cat", 48);
select*from  bookissue_details;

SELECT*FROM active_readers;
SELECT*FROM active_readers WHERE astatus ="TERMINATED";
select*from active_readers WHERE  astatus ="ACTIVE";
SELECT COUNT(account_id) from active_readers where atype ="PRENIMUM";