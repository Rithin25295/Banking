create database Banking
use Banking 
go


create schema Bank
go
create schema Account
go
create schema Transactions
go

create table Bank.Banks(
bankId bigint identity(1000,1) primary key,
bankDetails VARCHAR(50)
)

insert into Bank.Banks(bankDetails)  values ('State Bank of India')
insert into Bank.Banks(bankDetails)  values ('State Bank of Mysore')
insert into Bank.Banks(bankDetails)  values ('State Bank of Hyderabad')
insert into Bank.Banks(bankDetails)  values ('ICICI')
insert into Bank.Banks(bankDetails)  values ('Punjab National Bank')
insert into Bank.Banks(bankDetails)  values ('HDFC')
insert into Bank.Banks(bankDetails)  values ('IDBI')
insert into Bank.Banks(bankDetails)  values ('Karnataka Bank')
insert into Bank.Banks(bankDetails)  values ('Syndicate Bank')
insert into Bank.Banks(bankDetails)  values ('Canara Bank')
insert into Bank.Banks(bankDetails)  values ('Citi Bank ')
insert into Bank.Banks(bankDetails)  values ('Wells Fargo')
insert into Bank.Banks(bankDetails)  values ('Discover')
insert into Bank.Banks(bankDetails)  values ('TCF')

create table Bank.Addresses(
Address_ID bigint identity(1000,1) primary key,
Line1 varchar(100),
Line2 varchar(50),
City varchar(50),
PostCode varchar(15),
State varchar (50),
Country varchar(50)
)

insert into Bank.Addresses(Line1,Line2,City,PostCode,State,Country) values('9730 37th Place North','Apt#204','Plymouth','55441','MN','USA')
insert into Bank.Addresses(Line1,Line2,City,PostCode,State,Country) values('Kombettu House','Padavu, Ujirpade Post Balnad','Puttur','574203','Karnataka','India')
insert into Bank.Addresses(Line1,Line2,City,PostCode,State,Country) values('302, Sai Manor Towers','X Roads, SR Nagar','Hyderabad','574038','Andra Pradesh','India')


create table Bank.BranchType(
Br_Id bigint identity(1000,1) primary key, 
BrTypeCode varchar(4),
BrTypeDesc varchar(100)
)
insert into Bank.BranchType(BrTypeCode,BrTypeDesc) values('LU','Large Urban')
insert into Bank.BranchType(BrTypeCode,BrTypeDesc) values('SR','Small Rural')
insert into Bank.BranchType(BrTypeCode,BrTypeDesc) values('HO','Head Office')

create table Bank.Branches(
brID bigint identity(1000,1) primary key,
brAddress bigint,
brBankID bigint,
brBranchTypeCode bigint,
brBranchName varchar(100),
brBranchPhone1 varchar(20),
brBranchPhone2 varchar(20),
brBranchFax varchar(20),
brBranchEmail varchar(50),
brBranchIFSC varchar(20)
)

insert into Bank.Branches(brAddress,brBankID,brBranchTypeCode,brBranchName,brBranchPhone1,brBranchPhone2,brBranchFax,
brBranchEmail,brBranchIFSC) values(1000,1011,1001,'Golden Valley','1 323 416 4705' ,'1 323 416 4095','1 763 954 1522','wellsfargogv@wellsfargo.com','WFGV1015')
insert into Bank.Branches(brAddress,brBankID,brBranchTypeCode,brBranchName,brBranchPhone1,brBranchPhone2,brBranchFax,
brBranchEmail,brBranchIFSC) values(1001,1007,1002,'Manglore','91 824 247623' ,'91 824 247624','91 824 247625','banker25@karnatakabank.com','KBIN05267')
insert into Bank.Branches(brAddress,brBankID,brBranchTypeCode,brBranchName,brBranchPhone1,brBranchPhone2,brBranchFax,
brBranchEmail,brBranchIFSC) values(1002,1000,1000,'Puttur Market','91 8251 249246' ,'91 8251 249247','91 8251 249244','sbi.04270@sbi.co.in','SBIN004270')

select * from Bank.Branches

alter table Bank.Branches add constraint FK_brAddress foreign key(brAddress) references Bank.Addresses(Address_ID)
alter table Bank.Branches add constraint FK_brBankID foreign key(brBankID) references Bank.Banks(bankId)
alter table Bank.Branches add constraint FK_brBranchTypeCode foreign key(brBranchTypeCode) references Bank.BranchType(Br_ID)


create table Bank.Customers(
cstId bigint identity(1000,1) primary key,
cstAddId bigint,
cstBranchId bigint,
cstFirstName varchar(50),
cstLastName varchar(50),
cstMiddleName varchar(50),
cstDOB Date,
cstSince DateTime,
cstPhone1 varchar(20),
cstPhone2 varchar(20),
cstFax varchar(20),
cstGender varchar(10),
cstEmail varchar(50)
)

insert into Bank.Customers(cstAddId,cstBranchId,cstFirstName,cstLastName,cstMiddleName,cstDOB,cstSince,cstPhone1,cstPhone2,cstFax,cstGender,cstEmail) values (1000,1002, 'Nithin','Kumar',' ','9-Nov-1985','1996','1 323 416 4705',' ',' ','Male','x')
insert into Bank.Customers(cstAddId,cstBranchId,cstFirstName,cstLastName,cstMiddleName,cstDOB,cstSince,cstPhone1,cstPhone2,cstFax,cstGender,cstEmail) values (1001,1002, 'Gaurao','Tarpe',' ','25-Dec-1986','2000','91 824 247623',' ',' ','Male','y')
insert into Bank.Customers(cstAddId,cstBranchId,cstFirstName,cstLastName,cstMiddleName,cstDOB,cstSince,cstPhone1,cstPhone2,cstFax,cstGender,cstEmail) values (1002,1002, 'Chaithra','Kunjathaya','Nithin','19-Jan-1990','2005','91 8251 249246',' ',' ','Female','y')
insert into Bank.Customers(cstAddId,cstBranchId,cstFirstName,cstLastName,cstMiddleName,cstDOB,cstSince,cstPhone1,cstPhone2,cstFax,cstGender,cstEmail) values (1001,1001, 'Adarsh','Hegde',' ','19-Jan-1990','2015','91 8251 249246',' ',' ','Male','y')
insert into Bank.Customers(cstAddId,cstBranchId,cstFirstName,cstLastName,cstMiddleName,cstDOB,cstSince,cstPhone1,cstPhone2,cstFax,cstGender,cstEmail) values (1000,1002, 'Nathan','Kamas',' ','10-Nov-1985','1996','1 323 416 4705',' ',' ','Male','y')

alter table Bank.Customers add constraint FK_cstAddId foreign key(cstAddId) references Bank.Addresses(Address_ID)
alter table Bank.Customers add constraint FK_cstBranchId foreign key(cstBranchId) references Bank.Branches(brID)


create table Account.accAccountType(
accTypeId bigint identity(1000,1) primary key,
accTypeCode varchar(10),
accTypeDesc varchar(100)
)

insert into Account.accAccountType(accTypeCode,accTypeDesc) values('CHK','Checking')
insert into Account.accAccountType(accTypeCode,accTypeDesc) values('SAV','Saving')
insert into Account.accAccountType(accTypeCode,accTypeDesc) values('CUR','Current')
insert into Account.accAccountType(accTypeCode,accTypeDesc) values('LN','Loan')


create table Account.accAccountStatus(
accStatusId bigint identity(1000,1) primary key,
accStatusCode varchar(10),
accStatusDesc varchar(50)
)
insert into Account.accAccountStatus(accStatusCode,accStatusDesc) values('A','Active')
insert into Account.accAccountStatus(accStatusCode,accStatusDesc) values('C','Closed')


create table Account.accAccount(
accNumber bigint identity(20000,1) primary key,
accStatusCode bigint,
accTypeCode bigint,
accCustomerId bigint,
accBalance Decimal(26,4)
)

insert into Account.accAccount(accStatusCode,accTypeCode,accCustomerId,accBalance) values(1000,1001,1000,10000)
insert into Account.accAccount(accStatusCode,accTypeCode,accCustomerId,accBalance) values(1001,1000,1001,200000.9897)
insert into Account.accAccount(accStatusCode,accTypeCode,accCustomerId,accBalance) values(1001,1001,1002,30000.456)
insert into Account.accAccount(accStatusCode,accTypeCode,accCustomerId,accBalance) values(1001,1002,1003,5000)
insert into Account.accAccount(accStatusCode,accTypeCode,accCustomerId,accBalance) values(1001,1000,1004,500)

alter table Account.accAccount add constraint FK_accStatusCode foreign key(accStatusCode) references Account.accAccountStatus(accStatusId) 
alter table Account.accAccount add constraint FK_accTypeCode foreign key(accTypeCode) references Account.accAccountType(accTypeId)
alter table Account.accAccount add constraint FK_accCustomerId foreign key(accCustomerId) references Bank.Customers(cstId)

create table Transactions.tranTransactionType(
TranCodeId bigint identity(1000,1) primary key,
tranTypeDesc varchar(50)
)

INSERT INTO Transactions.tranTransactionType(tranTypeDesc) VALUES ('Deposit')
INSERT INTO Transactions.tranTransactionType(tranTypeDesc) VALUES ('Withdrawal')


create table Transactions.tranTransaction(
tranId bigint identity(1000,1) primary key,
tranAccountNumber bigint,
trancodeId bigint,
tranDateTime DateTime,
tranTransactionAmount Decimal(26,4),
tranMerchant varchar(50),
tranDescription varchar(50),
RunningBalance Decimal(26,4)
)

alter table Transactions.tranTransaction add tranCode varchar(50)
alter table Transactions.tranTransaction add constraint FK_tranAccountNumber foreign key(tranAccountNumber) references Account.accAccount(accNumber)
alter table Transactions.tranTransaction add constraint FK_trancodeId foreign key(trancodeId) references Transactions.tranTransactionType(TranCodeId)
alter table Transactions.tranTransaction add constraint DF_tranCode Default NEWID() for tranCode
alter table Transactions.tranTransaction add constraint DF_tranDateTime Default GETDATE() for tranDateTime

INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20000,1000,20500.456,'Self','Self Deposit')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20001,1001,200000,'Discover','Withdrawal')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20000,1001,13.45,'','Cheque #5001')

INSERT INTO Transactions.tranTransaction (tranAccountNumber,tranCodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20001,1000,2500,'Self','Self Deposit')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,tranCodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20001,1000,25000,'Discover','Withdrawal')


set xact_abort off	-- continue  on error   (default) :  in a batch if there is an error at statement 2, remaining are executed
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20006,1000,1300.45,'','Cheque #5001')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20001,1001,200000,'Discover','Withdrawal')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20003,1000,20500.456,'Self','Self Deposit')


set xact_abort on	-- stop on error. in a batch if there is an error at statement 2, remaining are NOT executed 
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20005,1000,20500.456,'Self','Self Deposit')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20004,1001,200000,'Discover','Withdrawal')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20001,1000,20500.456,'Self','Self Deposit')
INSERT INTO Transactions.tranTransaction (tranAccountNumber,trancodeId,tranTransactionAmount,tranMerchant,tranDescription) VALUES (20003,1001,25000,'Discover','Withdrawal')



-- SYNONYMS for the TABLES 
CREATE SYNONYM Bank                 FOR BANK.Banks
CREATE SYNONYM synAddress			FOR BANK.Addresses
CREATE SYNONYM BranchType			FOR BANK.BranchType
CREATE SYNONYM Branch				FOR BANK.Branches
CREATE SYNONYM Customer				FOR BANK.Customers
CREATE SYNONYM AccountType			FOR ACCOUNT.accAccountType
CREATE SYNONYM AccountStatus		FOR ACCOUNT.accAccountStatus
CREATE SYNONYM Account				FOR ACCOUNT.accAccount
CREATE SYNONYM TransactionType		FOR Transactions.tranTransactionType  
CREATE SYNONYM synTransaction		FOR Transactions.tranTransaction
select * from synTransaction