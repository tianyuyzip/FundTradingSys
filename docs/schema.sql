create table tbl_fund(
	fund_no     int primary key auto_increment,
	fund_name   varchar(40) not null unique,
	fund_price  decimal(6,2) not null,
	fund_status char(1) not null,
	fund_description varchar(100),
	fund_create_date datetime not null
);

create table tbl_client(
	id_card_no	char(18) primary key,
	client_name	varchar(30) not null,
	client_sex  char(1),
	client_phone	varchar(20),
	client_address  varchar(20),
	client_email    varchar(50),
	client_hobby    varchar(50),
	client_create_date datetime not null
);

create table tbl_financial_account(
	acc_no 		int primary key,
	acc_name    varchar(30) not null,
	acc_pwd 	char(6) not null,
	acc_amount  decimal(12,2) not null,
	acc_status  char(1) not null,
	id_card_no  char(18),
	acc_create_date datetime not null,
	CONSTRAINT FK_CLIENT_ACC FOREIGN KEY(id_card_no) REFERENCES tbl_client(id_card_no)
);

create table tbl_fund_transinfo(
	fund_trans_no	int primary key auto_increment,
	fund_trans_type  char(1)  not null,
	acc_no			int,
	fund_no			int,
	fund_trans_amount  int not null,
	fund_trans_price   decimal(6,2) not null,
	fund_trans_create_date datetime not null,
	CONSTRAINT FK_ACC_TRANSINFO FOREIGN KEY(ACC_NO) REFERENCES TBL_FINANCIAL_ACCOUNT(ACC_NO),
	CONSTRAINT FK_FUND_TRANSINFO FOREIGN KEY(FUND_NO) REFERENCES TBL_FUND(FUND_NO)		    	
);

create table tbl_account_transinfo(
	account_trans_no 	int primary key auto_increment,
	account_trans_type  char(1) not null,
	account_trans_amount double not null,
	acc_no 				int,
	fund_trans_no 		int,
	account_trans_create_date  date not null,
	CONSTRAINT FK_ACC_ACCTRANS FOREIGN KEY(ACC_NO) REFERENCES TBL_FINANCIAL_ACCOUNT(ACC_NO),
	CONSTRAINT FK_FUNDTRANS_ACCTRANS FOREIGN KEY(FUND_TRANS_NO) REFERENCES tbl_fund_transinfo(fund_trans_no)			
);

create table tbl_users(
   user_no    char(6) primary key,
   user_pwd   char(6) not null,
   user_name  varchar(30) not null
);



