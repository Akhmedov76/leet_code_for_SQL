---Write an SQL query that reports the average experience years of all the employees for each project,
-- rounded to 2 digits.---
--Return the result table in any order---

SELECT p.project_id, round(avg(e.experience_years), 2) AS average_years FROM project p
LEFT JOIN employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

---Write a solution to find the average selling price for each product. average_price
-- should be rounded to 2 decimal places.--
---Return the result table in any order---

SELECT p.product_id, ifnull(round(sum(units * price) / sum(units), 2), 0) AS average_price FROM prices p
LEFT JOIN unitssold u ON p.product_id = u.product_id AND u.purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id;

---Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".---
---Return the result table ordered by rating in descending order.---

SELECT c.id, c.movie, c.description, c.rating FROM cinema c WHERE c.id%2=1 and description!= 'boring'
ORDER BY  rating DESC ;

---Write a solution to find the number of times each student attended each exam.---
---Return the result table ordered by student_id and subject_name.---

SELECT s.student_id, s.student_name, sub.subject_name,count(e.student_id) AS FROM students s
CROSS JOIN subjects sub LEFT JOIN examinations e ON s.student_id=e.student_id AND sub.subject_name=e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name ORDER BY s.student_id, sub.subject_name;

---Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.---
---Return the result table in any order.---

SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empid=b.empid WHERE ifnull(b.bonus, 0)< 1000;

---Write a solution to find the percentage of the users registered in each contest rounded to two decimals.---
---Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.---

SELECT contest_id, round(count(distinct user_id)*100/( select count(user_id) from users),2) as percentage
from register group by contest_id order by percentage desc, contest_id;