//create database if not exists MyProject;
use MyProject;

DROP TABLE IF EXISTS ARTICLE;
DROP TABLE IF EXISTS ITEM;
DROP TABLE IF EXISTS MARKET;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE CUSTOMER(
	ID	int not null auto_increment,
	FirstName	varchar(15) not null,
	LastName	varchar(15) not null,
	Password	varchar(80) not null,
	Email	varchar(50),
	PRIMARY KEY(ID),
	CHECK (ID > 0)
) engine = InnoDB;

CREATE TABLE PRODUCT(
	ProductID	int not null auto_increment,
	ProdName	varchar(15) not null,
	ProdRating	enum('*','**','***','****','*****'),
	Url		    varchar(100),
	PRIMARY KEY(ProductID)
) engine = InnoDB;

CREATE TABLE REVIEW(
	CustomerID	int not null,
	ProductID	int not null,
	Rating		enum('*','**','***','****','*****'),
	Comment     varchar(1000),
	FOREIGN KEY (CustomerID) references CUSTOMER(ID),
	FOREIGN KEY (ProductID) references PRODUCT(ProductID)
) engine = InnoDB;

CREATE TABLE MARKET(
	ProdCode	int not null auto_increment,
	ProdName	varchar(15) not null,
	Saler	    varchar(30),
	Price	    int, 
	Category	varchar(15),
	Status      enum('sold','onhand'),
	PostTime    date,
	PRIMARY KEY(ProdCode)
) engine = InnoDB;

CREATE TABLE ITEM(
	ID	        int not null auto_increment,
    UserID	    int not null,
	ProductID	int not null,	
	PRIMARY KEY(ID),
	FOREIGN KEY (UserID) references CUSTOMER(ID),
	FOREIGN KEY (ProductID) references MARKET(ProdCode)
) engine = InnoDB;

CREATE TABLE ARTICLE(
	ArticleID	int not null auto_increment,
	Posted_by	varchar(30) not null,
	Title	    varchar(30),
	Url		    varchar(100),
	Post_date    date,
	PRIMARY KEY(ArticleID)
) engine = InnoDB;



