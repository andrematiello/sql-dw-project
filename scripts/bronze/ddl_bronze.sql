/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables

Changes made:
  Replaced NVARCHAR(50) with VARCHAR(50), as PostgreSQL uses VARCHAR to store strings, not NVARCHAR.
  Removed the GO commands, which are specific to SQL Server, as PostgreSQL does not use them.
  Replaced the use of SQL Server's OBJECT_ID with DROP TABLE IF EXISTS, which checks if the table exists and removes it if necessary.
  This code will work in PostgreSQL to create the tables, ensuring that existing tables are dropped before attempting to create them again.
===============================================================================
*/

-- Remover a tabela se ela já existir (substituindo o OBJECT_ID do SQL Server)
DROP TABLE IF EXISTS bronze.crm_cust_info;

-- From CRM
-- Criar a tabela crm_cust_info
CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(50),
    cst_gndr            VARCHAR(50),
    cst_create_date     VARCHAR(50)
);

-- Remover a tabela se ela já existir
DROP TABLE IF EXISTS bronze.crm_prd_info;

-- Criar a tabela crm_prd_info
CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt TIMESTAMP,
    prd_end_dt   TIMESTAMP
);

-- Remover a tabela se ela já existir
DROP TABLE IF EXISTS bronze.crm_sales_details;

-- Criar a tabela crm_sales_details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt TIMESTAMP,
    sls_ship_dt  TIMESTAMP,
    sls_due_dt   TIMESTAMP,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);


-- From ERP
-- Remover a tabela se ela já existir
DROP TABLE IF EXISTS bronze.erp_loc_a101;

-- Criar a tabela erp_loc_a101
CREATE TABLE bronze.erp_loc_a101 (
    CID    VARCHAR(50),
    CNTRY  VARCHAR(50)
);

-- Remover a tabela se ela já existir
DROP TABLE IF EXISTS bronze.erp_cust_az12;

-- Criar a tabela erp_cust_az12
CREATE TABLE bronze.erp_cust_az12 (
    CID    VARCHAR(50),
    BDATE  VARCHAR(50),
    GEN    VARCHAR(50)
);

-- Remover a tabela se ela já existir
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;

-- Criar a tabela erp_px_cat_g1v2
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID           VARCHAR(50),
    CAT          VARCHAR(50),
    SUBCAT       VARCHAR(50),
    MAINTENANCE  VARCHAR(50)
);
