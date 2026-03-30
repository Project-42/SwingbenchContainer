# SwingbenchContainer
Copy of "domgiles/SwingbenchDocker" to have updated Podman/Docker containers

See www.dominicgiles.com/swingbench.html for further details

Based on the Dockerfile: https://github.com/domgiles/SwingbenchDocker/blob/master/Dockerfile

# Image utilization examples
```bash
[|=| server in ~ ]$ podman run --name swingbench --rm -i -t ghcr.io/project-42/swingbench:latest  \
oewizard -cl -create -cs rac1-scan:1521/PDB191 \
-u soe -p soe -dba "sys as sysdba" \
-dbap ***** -ts ts_swingbench
Getting image source signatures
Copying blob 421bb5d6c5ea skipped: already exists
[...]
Copying blob 7284c4b5e434 skipped: already exists
Copying config 67b38a0041 done   |
Writing manifest to image destination
SwingBench Wizard
Author  :	Dominic Giles
Version :	2.8.0.1630

Running in Lights Out Mode using config file : ../wizardconfigs/oewizard.xml

Data Generation Runtime Metrics
+-------------------------+-------------+
| Description             | Value       |
+-------------------------+-------------+
| Connection Time         | 0:00:00.008 |
| Data Generation Time    | 0:01:47.040 |
| DDL Creation Time       | 0:02:05.722 |
| Total Run Time          | 0:03:52.777 |
| Rows Inserted per sec   | 148,213     |
| Actual Rows Generated   | 15,887,043  |
| Commits Completed       | 995         |
| Batch Updates Completed | 79,631      |
+-------------------------+-------------+

Validation Report
The schema appears to have been created successfully.

Valid Objects
Valid Tables : 'ORDERS','ORDER_ITEMS','CUSTOMERS','WAREHOUSES','ORDERENTRY_METADATA','INVENTORIES','PRODUCT_INFORMATION','PRODUCT_DESCRIPTIONS','ADDRESSES','CARD_DETAILS'
Valid Indexes : 'PRD_DESC_PK','PROD_NAME_IX','PRODUCT_INFORMATION_PK','PROD_SUPPLIER_IX','PROD_CATEGORY_IX','INVENTORY_PK','INV_PRODUCT_IX','INV_WAREHOUSE_IX','ORDER_PK','ORD_SALES_REP_IX','ORD_CUSTOMER_IX','ORD_ORDER_DATE_IX','ORD_WAREHOUSE_IX','ORDER_ITEMS_PK','ITEM_ORDER_IX','ITEM_PRODUCT_IX','WAREHOUSES_PK','WHS_LOCATION_IX','CUSTOMERS_PK','CUST_EMAIL_IX','CUST_ACCOUNT_MANAGER_IX','CUST_FUNC_LOWER_NAME_IX','ADDRESS_PK','ADDRESS_CUST_IX','CARD_DETAILS_PK','CARDDETAILS_CUST_IX'
Valid Views : 'PRODUCTS','PRODUCT_PRICES'
Valid Sequences : 'CUSTOMER_SEQ','ORDERS_SEQ','ADDRESS_SEQ','LOGON_SEQ','CARD_DETAILS_SEQ'
Valid Code : 'ORDERENTRY'
Schema Created

[|=| server in ~ ]$


[|=| raspi in ~ ]$ podman run --name swingbench --rm -i -t ghcr.io/project-42/swingbench:latest  \
charbench -u soe -p soe -cs rac1-scan:1521/PDB191 \
-c ../configs/SOE_Server_Side_V2.xml -mr
Trying to pull ghcr.io/project-42/swingbench:latest...
Getting image source signatures
Copying blob 133e58ac4e38 skipped: already exists
Copying blob 4f9e06383f5c skipped: already exists
Copying blob 65f7d2377e3d skipped: already exists
Copying blob 39f3ff148085 skipped: already exists
Copying blob 780ee5cf234b skipped: already exists
Copying config 7158508bcb done   |
Writing manifest to image destination
Swingbench
Author  :  	 Dominic Giles
Version :  	 2.8.0.1630

Results will be written to results.xml
Hit Return to Terminate Run...

Time		Users	TPM	TPS

10:42:42 AM     16      26108   640
---------------------------------------------------------------
|Results of Charbench Run                                     |
---------------------------------------------------------------
|Benchmark Name                |Order Entry benchmark using serverside plsql Version 2|
|Time of Run                   |     Mar 30, 2026, 10:41:55 AM|
|Length of Benchmark           |                       0:00:48|
|Total Logon Time              |                       0:00:01|
|Total Completed Transactions  |                         26910|
|Total Failed Transactions     |                             0|
|Maximum Transactions/min      |                         26811|
|Average Transactions/sec      |                        560.62|
|Total Select Statements       |                        286419|
|Total Insert Statements       |                         49577|
|Total Update Statements       |                         37317|
|Total Delete Statements       |                             0|
|Total Commit Statements       |                         27126|
|Total Rollback Statements     |                             0|
---------------------------------------------------------------
|Transaction :  Customer Registration                         |
---------------------------------------------------------------
|Minimum Response Time         |                             9|
|Maximum Response Time         |                           451|
|Average Response Time         |                         23.42|
|Geometric Mean Response Time  |                         20.30|
|Median Response Time          |                         17.72|
|Number of Transactions        |                          3256|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
|Transaction :  Update Customer Details                       |
---------------------------------------------------------------
|Minimum Response Time         |                             2|
|Maximum Response Time         |                           278|
|Average Response Time         |                          7.12|
|Geometric Mean Response Time  |                          5.07|
|Median Response Time          |                          3.76|
|Number of Transactions        |                          2121|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
|Transaction :  Browse Products                               |
---------------------------------------------------------------
|Minimum Response Time         |                             2|
|Maximum Response Time         |                           585|
|Average Response Time         |                         10.18|
|Geometric Mean Response Time  |                          8.65|
|Median Response Time          |                          8.79|
|Number of Transactions        |                         10920|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
|Transaction :  Order Products                                |
---------------------------------------------------------------
|Minimum Response Time         |                            14|
|Maximum Response Time         |                           772|
|Average Response Time         |                         56.48|
|Geometric Mean Response Time  |                         51.92|
|Median Response Time          |                         49.75|
|Number of Transactions        |                          8744|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
|Transaction :  Process Orders                                |
---------------------------------------------------------------
|Minimum Response Time         |                             5|
|Maximum Response Time         |                           389|
|Average Response Time         |                         18.46|
|Geometric Mean Response Time  |                         16.37|
|Median Response Time          |                         15.73|
|Number of Transactions        |                          1040|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
|Transaction :  Browse Orders                                 |
---------------------------------------------------------------
|Minimum Response Time         |                             3|
|Maximum Response Time         |                           468|
|Average Response Time         |                         19.39|
|Geometric Mean Response Time  |                         16.20|
|Median Response Time          |                         16.05|
|Number of Transactions        |                          1068|
|Failed Transactions           |                             0|
|Rolled Back Transactions      |                             0|
---------------------------------------------------------------
Saved results to results.xml
Completed Run.
[|=| raspi in ~ ]$ 

[|=| raspi in ~ ]$ podman run --name swingbench --rm -i -t ghcr.io/project-42/swingbench:latest  \
sbutil -u soe -p soe  -cs rac1-scan:1521/PDB191 \
-soe parallel 12 -dup 1
Getting table Info
Got table information. Completed in : 0:00:04.618
Dropping Indexes
Dropped Indexes. Completed in : 0:00:03.257
Creating copies of tables
Created copies of tables. Completed in : 0:00:00.218
Begining data duplication
Completed Iteration 1. Completed in : 0:00:17.725:02.662
Creating  Constraints
Created  Constraints. Completed in : 0:00:15.676
Creating  Indexes
Created  Indexes. Completed in : 0:00:24.843
Created  Indexes. Completed in : 0:00:40.853
Updating Metadata and Recompiling Code
Updated Metadata. Completed in : 0:00:02.567
Updating Sequences
Updated Sequences. Completed in : 0:00:02.775
Determining New Row Counts
Got New Row Counts. Completed in : 0:00:06.011
+--------------+--------------------+---------------+---------------+----------+
| Table Name   | Original Row Count | Original Size | New Row Count | New Size |
+--------------+--------------------+---------------+---------------+----------+
| ORDER_ITEMS  | 7,201,293          | 530 MB        | 7,201,293     | 555 MB   |
| CUSTOMERS    | 1,003,372          | 153 MB        | 1,003,372     | 163 MB   |
| CARD_DETAILS | 1,503,372          | 94 MB         | 1,503,372     | 101 MB   |
| ORDERS       | 1,438,803          | 202 MB        | 1,438,803     | 213 MB   |
| INVENTORIES  | 897,112            | 175 MB        | 897,112       | 186 MB   |
| ADDRESSES    | 1,503,709          | 138 MB        | 1,503,709     | 143 MB   |
| Total        |                    | 1.3 GB        |               | 1.3 GB   |
+--------------+--------------------+---------------+---------------+----------+

Completeted duplication for the order entry schema
```
[|=| raspi in ~ ]$

