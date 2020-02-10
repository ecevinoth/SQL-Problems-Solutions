# sales schema
## tables involved
1. sales_transactions
+------------+-------------+--------------+-----------+
| trans_date | merchant_id | trans_status | trans_amt |
+------------+-------------+--------------+-----------+
| 2020-02-10 |      1      |    success   |    1000   |
| 2020-02-10 |      1      |    cancel    |    1000   |
| 2020-02-11 |      3      |    success   |    8000   |
| 2020-02-12 |      4      |    success   |    2000   |
| 2020-02-13 |      1      |    success   |    2100   |
| 2020-02-13 |      1      |    refund    |    2100   |
| 2020-02-14 |      3      |    success   |    3000   |
| 2020-02-15 |      2      |    success   |    5000   |
| 2020-02-15 |      2      |    cancel    |    1500   |
| 2020-02-15 |      2      |    refund    |    1500   |
+------------+-------------+--------------+-----------+
2. merchants_category
+-------------+---------------------------+
| merchant_id | merchant_category         |
+-------------+---------------------------+
|    1        |   Agricultural Services   |
|    2        |   Transportation Services |
|    3        |   Clothing Stores         |
|    4        |   Government Services     |
+-------------+---------------------------+


relation: M-to-1 [many to one]
sales_transactions.merchant_id = merchants_category.merchant_id
