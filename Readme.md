# LeetCode 1587 - Bank Account Summary II

## Problem Statement

Write a solution to report the name and balance of users with a balance higher than 10,000.  
The balance is the sum of all transaction amounts involving that account.

### Tables:

#### Users Table

| Column Name | Type    |
|-------------|---------|
| account     | int     |
| name        | varchar |

- `account` is the primary key.
- Each account is associated with a unique name.

#### Transactions Table

| Column Name   | Type |
|---------------|------|
| trans_id      | int  |
| account       | int  |
| amount        | int  |
| transacted_on | date |

- `trans_id` is the primary key.
- `amount` is positive for deposits, negative for withdrawals.



## Sample Input

**Users**

| account  | name    |
|----------|---------|
| 900001   | Alice   |
| 900002   | Bob     |
| 900003   | Charlie |

**Transactions**

| trans_id | account | amount | transacted_on |
|----------|---------|--------|----------------|
| 1        | 900001  | 7000   | 2020-08-01     |
| 2        | 900001  | 7000   | 2020-09-01     |
| 3        | 900001  | -3000  | 2020-09-02     |
| 4        | 900002  | 1000   | 2020-09-12     |
| 5        | 900003  | 6000   | 2020-08-07     |
| 6        | 900003  | 6000   | 2020-09-07     |
| 7        | 900003  | -4000  | 2020-09-11     |

---

## Output

| name  | balance |
|-------|---------|
| Alice | 11000   |

---

## SQL Solution

```sql
SELECT U.name, SUM(T.amount) AS balance
FROM Users AS U
JOIN Transactions AS T
ON U.account = T.account
GROUP BY U.name
HAVING SUM(T.amount) > 10000;
