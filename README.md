# SQL-Queries-YouTube-Dataset
This project focuses on practicing SQL queries on a YouTube dataset, covering fundamental concepts like joins, subqueries, aggregate functions, and basic data analysis.

##  Steps to Run the Project (Execution Sequence)

1. Create the database.

2. Select the database to work with.

3. Create the **creators** table

   * This is the parent table with no dependencies.

4. Insert data into the **creators** table.

5. Create the **videos** table

   * Depends on the creators table.

6. Insert data into the **videos** table.

7. Create the **daily_views** table

   * Depends on the videos table.

8. Create the **comments** table

   * Depends on the videos table.

9. Create the **likes_dislikes** table

   * Depends on the videos table.

10. Create the **revenue** table

    * Depends on the videos table.

11. Insert data into **daily_views**.

12. Insert data into **comments**.

13. Insert data into **likes_dislikes**.

14. Insert data into **revenue**.

---

###  Important Notes

* Parent tables must be created and populated before child tables.
* Inserting data out of order may cause foreign key constraint errors.
* Always verify that referenced `video_id` values exist before inserting.
