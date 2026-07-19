# SQL-Data-Analytics
Portfolio of SQL projects and checkpoint assignments using the Northwind sample database

# 📊 SQL Data Analytics — Northwind Database Portfolio

A SQL portfolio built around the classic **Northwind** sample database, progressing from basic filtering to advanced window functions and query optimization. Each checkpoint is a self-contained `.sql` file that tackles a real business question, followed by a short written insight explaining *why* the result matters — not just *how* it was produced.

## 🎯 About This Project

This repository documents a structured journey through core SQL concepts, using Northwind's orders, customers, products, employees, and shipping data to answer practical, business-style questions such as:

- Which customers are the most loyal?
- Which products are at risk of running out of stock?
- Which employees are outperforming the team average?
- Which shipping companies still have pending deliveries?

Every query is commented with the business question it answers and a brief interpretation of the result, making this both a learning log and a demonstration of applied analytical thinking.

## 🗄️ Database

**Northwind** (SQLite) — a classic sample database simulating a small trading company, containing tables such as `Orders`, `Customers`, `Products`, `Categories`, `Employees`, `Suppliers`, `Shippers`, and `Order Details`.

## 📁 Project Structure

| File | Topic | Focus |
|---|---|---|
| [`Checkpoint-1.sql`](./Checkpoint-1.sql) | SELECT, WHERE, ORDER BY, LIMIT | Filtering recent orders, low-stock products, high-value inventory, and regional customers |
| [`Checkpoint- 2..sql`](./Checkpoint-%202..sql) | JOINs | INNER, LEFT, and CROSS JOINs across orders, customers, employees, and shippers |
| [`Checkpoint-3.sql`](./Checkpoint-3.sql) | GROUP BY & HAVING | Aggregating orders by employee, customer, month, and supplier |
| [`Checkpoint-4.sql`](./Checkpoint-4.sql) | Subqueries & CTEs | Comparing values against averages, `NOT IN`, and multi-step logic with `WITH` |
| [`Checkpoint-5.sql`](./Checkpoint-5.sql) | Window Functions | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, and running totals with `PARTITION BY` |
| [`Checkpoint-6.sql`](./Checkpoint-6.sql) | Query Optimization | Comparing correlated subqueries vs. JOINs, and indexing/`LIMIT` strategies for performance |

## 🔍 Highlights by Checkpoint

**Checkpoint 1 — Fundamentals**
Filters recent U.S. orders, flags products with critically low stock, and surfaces high-value inventory — the kind of quick checks a business runs daily.

**Checkpoint 2 — Relationships**
Connects orders to customers, employees, and shippers to build a complete picture of who ordered what, who processed it, and who delivered it — including unshipped orders via `LEFT JOIN`.

**Checkpoint 3 — Aggregation**
Measures employee workload, identifies loyal customers (15+ orders), and reveals seasonal ordering patterns using `strftime()` for monthly grouping.

**Checkpoint 4 — Subqueries & CTEs**
Uses `WITH` clauses and nested subqueries to find employees above the average order count, products priced above the category average, and categories with no premium products.

**Checkpoint 5 — Window Functions**
Ranks products within categories, sequences each customer's order history, and calculates cumulative freight costs by country using `SUM() OVER()`.

**Checkpoint 6 — Performance Thinking**
Directly compares correlated subqueries against equivalent JOINs, explaining *why* JOINs typically outperform row-by-row subquery evaluation, plus the impact of indexing and `LIMIT`.

## 🧠 Skills Demonstrated

- Data filtering & sorting (`WHERE`, `ORDER BY`, `LIMIT`)
- Multi-table relationships (`INNER`, `LEFT`, `CROSS JOIN`)
- Aggregation & grouping (`GROUP BY`, `HAVING`, `COUNT`, `SUM`, `AVG`)
- Subqueries and Common Table Expressions (CTEs)
- Window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `PARTITION BY`)
- Query optimization and performance reasoning
- Translating raw query results into business insights

## 🛠️ Tech Stack

- **Database:** SQLite (Northwind sample dataset)
- **Language:** SQL

## 🚀 How to Explore

1. Download the [Northwind SQLite database](https://github.com/jpwhite3/northwind-SQLite3) (or your preferred Northwind version).
2. Open it with any SQLite client — [DB Browser for SQLite](https://sqlitebrowser.org/), the `sqlite3` CLI, or a VS Code extension.
3. Run each checkpoint file individually and compare your results with the inline commentary.

```bash
sqlite3 northwind.db < Checkpoint-1.sql
```

## 👤 Author

**Zahra Aliyeva**
[GitHub Profile](https://github.com/Zahra-Aliyeva)


