# Online Retail Sales Database Design (SQL Internship Project):
🚀 Project Overview
This project involves designing and implementing a Retail Sales Database for an e-commerce platform. It includes schema design, ER modeling, sample data insertion, and analytical SQL queries. The project simulates a basic online order management system, covering Customers, Products, Orders, Payments, and Order Items.

🧩 Entities Modeled:
Customers – user info
Products – available items
Orders – customer purchases
Order_Items – individual items per order (many-to-many)
Payments – payment tracking per order

🛠️ Tools & Technologies:
MySQL Workbench
dbdiagram.io – for ER diagram
SQL – DDL, DML, Views, Aggregates
GitHub – for version control and sharing

🧠 ER Diagram:
ER Diagram

✅ Normalization: Ensured 3NF Compliance
🗄️ Schema Overview (DDL)
All tables were created with proper:

-->Primary keys
-->Foreign keys
-->Data types
-->Default timestamps

Tables Created:

-->Customers
-->Products
-->Orders
-->Order_Items
-->Payments

💾 Sample Data:
Inserted realistic data into all tables, including:

-->Multiple customers
-->Product catalog
-->Orders and payments
-->Many-to-many items per order

📊 Key SQL Queries:
1. 📦 Customer Order History
SELECT c.name, o.order_id, o.order_date, p.name AS product, oi.quantity FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id;

2. 📅Daily Sales Report
SELECT DATE(order_date) AS sales_date, COUNT(*) AS total_orders, SUM(total_amount) AS revenue FROM Orders GROUP BY sales_date;

3. 🏆 Best-Selling Products
SELECT p.name, SUM(oi.quantity) AS total_units_sold FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id GROUP BY p.name ORDER BY total_units_sold DESC;

👁️ Views Created
Daily_Sales_View – shows date-wise revenue and orders Best_Selling_Products – ranks products by total units sold

📂 File Structure
RetailSalesDB-Project/ ├── retail_sales_project.sql # Full SQL code (DDL + DML + queries + views) ├── er_diagram.png # ER Diagram image ├── README.md # Project documentation

✅ How to Run
1.Open MySQL Workbench 2.Import or run retail_sales_project.sql 3.View tables, data, and execute queries 4.Use the views Daily_Sales_View and Best_Selling_Products for reports

👤 Author:
Sai Tharun M B.Tech – Computer Science & Engineering GitHub • Portfolio • LinkedIn

📎 License:
This project is part of a learning internship. You’re free to explore, fork, and learn.


# Hospital-management-system

Project Overview Introduction This Hospital Management System is developed using Oracle SQL Developer to efficiently manage hospital operations, including:

-->Patient Details Billing & Payments Hospital Expenses Staff Leave Management Stock & Inventory Management

-->The system helps hospitals maintain organized records, track financial transactions, and manage resources efficiently.

System Requirements: Oracle Database (19c/21c or compatible version) Oracle SQL Developer

Operating System: Windows/Linux/MacOS

Database Setup

1.Create Database User sql Copy Edit CREATE USER hospital_admin IDENTIFIED BY password; GRANT CONNECT, RESOURCE TO hospital_admin; ALTER USER hospital_admin QUOTA UNLIMITED ON USERS;
2.Connect to SQL Developer Open Oracle SQL Developer
Connect using:

Username: hospital_admin Password: password Service: Database Schema & Tables

Database Schema

1.Employee Table This table stores employee-related information.
create table employee ( empi_id number(5) primary key, empi_name varchar(15), empi_email varchar(15), empi_phone number(10), empi_age number(3), empi_gender varchar(8), empi_position varchar(20), empi_salary number(10), check(empi_age > = 18) );

          drop table employee 
insert into employee values(1001, 'arun', 'arun2gmail.com', '47454154', 22, 'male', 'manager', 66700); insert into employee values(1002, 'arish', 'arishgmail.com', '9867657772', 25, 'male', 'reception', 60000); insert into employee values(1003, 'basha', 'bashagmail.com', '76676787', 27, 'male', 'coordinator', 40000); insert into employee values(1004, 'bala', 'balagmail.com', '985355547', 45, 'male', 'pharmacy', 45000); insert into employee values (1005, 'devi', 'devi@gmail.com', '8877667675', 35, 'female', 'nurse',35000); insert into employee values(1006, 'kannan', 'kanan@gmail.com', '985547863', 26, 'male', 'head doctor', 75000);.. --insert into employee values(1007, 'ravi', 'ravi@gmail.com', '87896676', 17, 'male', 'doctor', 25000); ----- this is violated

2.Patient Table This table stores patient-related information.
create table patient( pat_id number(5) primary key, pat_name varchar2(15), pat_phone number(10), pat_age number(3), pat_gender varchar(6) );

   drop table patient 

 insert into patient values(101, 'subramani', 6454545445, 45, 'male');
 insert into patient values(102, 'thithya', 4879895525, 89, 'female');
 insert into patient values(103, 'diva', 9856324896, 28, 'male');
 insert into patient values(104, 'saminathan', 986534897, 52, 'male');
 insert into patient values(105, 'hari', 4588944485, 16, 'male');

3.Billing details Table This table stores details of billing details with patient.
create table billing_details( bill_id number(5), admission_no number(15), consulting_doctor varchar2(20), tot_bill VARCHAR2(10), bill_gst number(8), balance_amount number(15), admission_date date, constraint hospital_name foreign key(bill_id) references patient(pat_id) );

         drop table billing_detals

          select * from patient;
          select * from billing_details;
insert into billing_details values('101','111035','DR.vaithiyaligam','RS.36000','4000','00', to_date('25092024','ddmmyyyy'));

insert into billing_details values(102, '76761766', 'DR.SUNTHRAVADIVU', 'RS.45030', '6000', '1000', to_date('13-07-2000','dd-mm-yyyy'));

insert into billing_details values(103, '76552997, 'DR.ragunathan', 'RS.79323', '7000', '5000', to_date('03-08-2002','dd-mm-yyyy'));

insert into billing_details values(104, '5485454', 'DR.vinoth kumar', 'RS.30000', '2500', '00', to_date('28-03-2005','dd-mm-yyyy'));

insert into billing_details values(105, '478535201', 'DR.sundhur', 'RS.5000', '300', '00', to_date('02-10-2001','dd-mm-yyyy'));

4.Stock information Table This table stores stock information for patients.
create table stock_details( stock_id varchar(8) primary key, stock_available varchar(20) not null, quantity number(5) not null, manufacturing_date date not null, expiry_date date not null, check(manufacturing_date < expiry_date) );

drop table stock_details
insert into stock_details values('TB2675', 'glucose', 12, to_date('23072024','ddmmyyyy'), to_date('28112024','ddmmyyyy'));

insert into stock_details values('TB8786', 'amoxicillin', '23', to_date('19052024','ddmmyyyy'), to_date('25122024','ddmmyyyy'));

insert into stock_details values('TB63287', 'vomitstop', '56', to_date('02032024','ddmmyyyy'), to_date('01062024','ddmmyyyy'));

insert into stock_details values('TB7686', 'ciplo', '88', to_date('05072024','ddmmyyyy'),
to_date('07012025','ddmmyyyy'));

insert into stock_details values('TB7788', 'dolo650', '90', to_date('03082024','ddmmyyyy'), to_date('04032025','ddmmyyyy'));

insert into stock_details values('TB7748', 'nocold', '78', to_date('08042024','ddmmyyyy'), to_date('25092025','ddmmyyyy'));

4.Expense details information Table This table stores expense information for hospital.
create table expense_details( expense_id varchar2(8) primary key, expense_product varchar2(20) not null, expense_quantity varchar2(20) not null, expense_amount varchar2(10) not null, expense_date date not null, constraint fk_to_purchase FOREIGN KEY(expense_id) references stock_details(stock_id) );

          drop table expense_details

               select * from expense_id;
               select * from stock_id;
insert into expense_details values('TB2675','paracetamol','56 BOX','RS.89900', to_date('23092024','ddmmyyyy'));

INSERT into expense_details values('TB8786', 'iron', '67 box', 'RS.787383', to_date('12052024','ddmmyyyy'));

insert into expense_details values('TB63287', 'vitamin c', '34', 'RS.676870', to_date('12032025','ddmmyyyy'));

insert into expense_details values('TB7686', 'cof syrup', '19 box', 'RS.789333', to_date('17072024','ddmmyyyy'));

insert into expense_details values('TB7748', 'eye drops', '106 box', 'RS.150000', to_date('12062025','ddmmyyyy'));

6.Leave information Table This table stores leave information for hospital.
create table leave_info( lev_info_id number(5) primary key, tot_lev number(10) not null, lev_taken number(10) not null, late_permission number(20) not null, doj date not null, check(tot_lev > lev_taken and late_permission < 30), constraint leave_details FOREIGN KEY(lev_info_id) references employee(empi_id) );

                 drop table leave_info
                 
                select * from employee;
                select * from leave_info;
insert into leave_info values(1001, '90', '50', '10', to_date('09061998','ddmmyyyy')); insert into leave_info values(1002, '90', '45', '3', to_date('11052003','ddmmyyyy')); insert into leave_info values(1003, '90', '60', '7', to_date('25091987','ddmmyyyy')); insert into leave_info values(1004, '90', '79', '13', to_date('13112022','ddmmyyyy')); insert into leave_info values(1005, '90', '55', '20', to_date('12032007','ddmmyyyy')); insert into leave_info values(1006, '90', '23', '30', to_date('06062009','ddmmyyyy'));

7.Payroll information Table This table stores payroll information for hospital.

create table payroll_info( empi_id number(5) primary key, payment_id varchar(20), basic_salary varchar(8) not null, deductions varchar(10) not null, medical_allowances varchar(10) not null, bonus number(8) not null, check(basic_salary >= bonus and medical_allowances < bonus), constraint pay_details FOREIGN KEY(empi_id) references employee(empi_id) );

          drop table payroll_info

          select * from employee;
          select * from payroll_info;
insert into payroll_info values(1001, 'SDF67655756', '35000', '3000', '1100', '20000'); insert into payroll_info values(1002, 'ETY48921413', '67000', '5000', '3000', '50000'); INSERT into payroll_info values(1003, 'FYG14893253', '20000', '1000', '900', '10000'); insert into payroll_info values(1004, 'WED15987634', '70000', '6000', '3000', '60000'); insert into payroll_info values(1005, 'BUY47598732', '60000', '2000', '1500', '40000'); insert into payroll_info values(1006, 'VYR452871340', '900000', '10000', '5000', '70000');

Future Enhancements User Authentication for secure access

Automated Billing Reports

Medicine Expiry Alerts

Doctor-Patient Appointment System
