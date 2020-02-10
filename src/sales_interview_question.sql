
-- expected output
+------------+---------------------------+-----------+
| trans_date | merchant_category         | trans_amt |
+------------+---------------------------+-----------+
| 2020-02-10 | Agricultural Services     |       0   |
| 2020-02-11 | Clothing Stores           |    8000   |
| 2020-02-12 | Government Services       |    2000   |
| 2020-02-13 | Agricultural Services     |       0   |
| 2020-02-14 | Clothing Stores           |    3000   |
| 2020-02-15 | Transportation Services   |    2000   |
+------------+---------------------------+-----------+


-- answer
SELECT
    sales_transactions.trans_date
    , merchant_category.merchant_category
    , SUM(
        CASE 
            WHEN sales_transactions.trans_status IN ('cancel', 'refund') then -1 * trans_amt
            ELSE trans_amt
        END
    ) AS sales_amt
FROM sales_transactions 
left join merchants_category on sales_transactions.merchant_id = merchants_category.merchant_id
