CREATE TABLE users(
  user_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  registration_date DATE,
  UNIQUE(email)
);

INSERT INTO users(user_id, full_name, email, city, registration_date)VALUES (1, 'Alice Johnson', 'alice@example.com', 'New York', '2024-12-01');

INSERT INTO users(user_id, full_name, email, city, registration_date)VALUES (2, 'Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05');

INSERT INTO users(user_id, full_name, email, city, registration_date)VALUES (3, 'Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10');

INSERT INTO users(user_id, full_name, email, city, registration_date)VALUES (4, 'Diana King', 'diana@example.com', 'New York', '2025-01-15');

INSERT INTO users(user_id, full_name, email, city, registration_date)VALUES (5, 'Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-02-01');

select * from users;

CREATE TABLE Events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  city VARCHAR(100) NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  status ENUM('upcoming', 'completed', 'cancelled'),
  organizer_id INT,
  FOREIGN KEY (organizer_id) REFERENCES users(user_id)
);
INSERT INTO Events(event_id,title,description,city,start_date,end_date,status,organizer_id) VALUES(1,'Tech Innovators Meetup','A meetup for tech enthusiasts','New York','2025-06-10  10:00:00','2025-06-10 16:00:00','upcoming',1);
INSERT INTO Events(event_id,title,description,city,start_date,end_date,status,organizer_id) VALUES(2,'AI & ML Conference','Conference on AI and ML advancements','Chicago','2025-05-15 9:00:00','2025-05-15 17:00:00','completed',3);
INSERT INTO Events(event_id,title,description,city,start_date,end_date,status,organizer_id) VALUES(3,'Frontend Development Bootcamp','Hands-on training on frontend tech','Los Angeles','2025-07-01 10:00:00','2025-07-03 16:00:00','upcoming',2);

select * from Events;


CREATE TABLE Sessions(
session_id INT PRIMARY KEY,
event_id INT ,
title VARCHAR(200) NOT NULL,
speaker_name VARCHAR(100) NOT NULL,
start_time DATETIME NOT NULL,
end_time DATETIME NOT NULL,
FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Sessions (session_id,event_id,title,speaker_name,start_time,end_time) VALUES(1,1,'Opening Keynote','Dr.Tech','2025-06-10 10:00:00','2025-06-10 11:00:00');
INSERT INTO Sessions (session_id,event_id,title,speaker_name,start_time,end_time) VALUES(2,1,'Future of Web Dev','Alice Johnson','2025-06-10 11:15:00','2025-06-10 12:30:00');
INSERT INTO Sessions (session_id,event_id,title,speaker_name,start_time,end_time) VALUES(3,2,'AI in Healthcare','Charlie Lee','2025-05-15 09:30:00','2025-05-15 11:00:00');
INSERT INTO Sessions (session_id,event_id,title,speaker_name,start_time,end_time) VALUES(4,3,'Intro to HTML5','Bob Smith','2025-07-01 10:00:00','2025-07-01 12:00:00');

select * from Sessions;


CREATE TABLE Registrations(
registration_id INT PRIMARY KEY,
user_id INT ,
event_id INT,
registration_date DATE NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Registrations(registration_id,user_id,event_id,registration_date) VALUES(1,1,1,'2025-05-01');
INSERT INTO Registrations(registration_id,user_id,event_id,registration_date) VALUES(2,2,1,'2025-05-02');
INSERT INTO Registrations(registration_id,user_id,event_id,registration_date) VALUES(3,3,2,'2025-04-30');
INSERT INTO Registrations(registration_id,user_id,event_id,registration_date) VALUES(4,4,2,'2025-04-28');
INSERT INTO Registrations(registration_id,user_id,event_id,registration_date) VALUES(5,5,3,'2025-06-15');

select * from Registrations;

CREATE TABLE Feedback(
feedback_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT ,
event_id INT,
rating INT,
comments TEXT,
feedback_date DATE NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (event_id) REFERENCES Events(event_id),
CHECK(rating BETWEEN 1 AND 5)
);

INSERT INTO Feedback (feedback_id,user_id,event_id,rating,comments,feedback_date) VALUES(1,3,2,4,'Great insights!','2025-05-16');
INSERT INTO Feedback (feedback_id,user_id,event_id,rating,comments,feedback_date) VALUES(2,4,2,5,'Very informative','2025-05-16');
INSERT INTO Feedback (feedback_id,user_id,event_id,rating,comments,feedback_date) VALUES(3,2,1,3,'Could be better','2025-06-11');

select * from Feedback;

CREATE TABLE Resources(
resource_id INT PRIMARY KEY,
event_id INT,
resource_type ENUM ('pdf','image','link'),
resource_url VARCHAR(255) NOT NULL,
uploaded_at DATETIME NOT NULL,
FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Resources(resource_id,event_id,resource_type,resource_url,uploaded_at) VALUES(1,1,'pdf','https://portal.com/resources/tech_meetup_agenda.pdf','2025-05-01 10:00:00');
INSERT INTO Resources(resource_id,event_id,resource_type,resource_url,uploaded_at) VALUES(2,2,'image','https://portal.com/resources/ai_poster.jpg','2025-04-20 09:00:00');
INSERT INTO Resources(resource_id,event_id,resource_type,resource_url,uploaded_at) VALUES(3,3,'link','https://portal.com/resources/html5_docs','2025-06-25 15:00:00');

select *from Resources;


/
-- 1. Show a list of all upcoming events a user is registered for in their city, sorted by date.
SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND u.city = e.city
ORDER BY e.start_date;


-- 2. Identify events with the highest average rating, considering only those that have received at least 10 feedback submissions.
SELECT e.title, AVG(f.rating) AS avg_rating, COUNT(f.feedback_id) AS total_feedbacks
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;


-- 3. Retrieve users who have not registered for any events in the last 90 days.
SELECT u.full_name
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id AND r.registration_date >= CURDATE() - INTERVAL 90 DAY
WHERE r.registration_id IS NULL;


-- 4. Count how many sessions are scheduled between 10 AM to 12 PM for each event.
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '11:59:59'
GROUP BY e.event_id;


-- 5. List the top 5 cities with the highest number of distinct user registrations.
SELECT u.city, COUNT(DISTINCT r.user_id) AS user_count
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY user_count DESC
LIMIT 5;


-- 6. Generate a report showing the number of resources (PDFs, images, links) uploaded for each event.
SELECT e.title,
       SUM(CASE WHEN r.resource_type = 'pdf' THEN 1 ELSE 0 END) AS pdf_count,
       SUM(CASE WHEN r.resource_type = 'image' THEN 1 ELSE 0 END) AS image_count,
       SUM(CASE WHEN r.resource_type = 'link' THEN 1 ELSE 0 END) AS link_count
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id;


-- 7. List all users who gave feedback with a rating less than 3, along with their comments and associated event names.
SELECT u.full_name, e.title AS event_name, f.rating, f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;


-- 8. Display all upcoming events with the count of sessions scheduled for them.
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id;


-- 9. For each event organizer, show the number of events created and their current status (upcoming, completed, cancelled).
SELECT u.full_name AS organizer_name,
       e.status,
       COUNT(e.event_id) AS event_count
FROM Events e
JOIN Users u ON e.organizer_id = u.user_id
GROUP BY e.organizer_id, e.status;


-- 10. Identify events that had registrations but received no feedback at all.
SELECT DISTINCT e.title
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL;


-- 11. Find the number of users who registered each day in the last 7 days.
SELECT registration_date, COUNT(*) AS user_count
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;


-- 12. List the event(s) with the highest number of sessions.
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id
ORDER BY session_count DESC
LIMIT 1;


-- 13. Calculate the average feedback rating of events conducted in each city.
SELECT e.city, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.city;


-- 14. List top 3 events based on the total number of user registrations.
SELECT e.title, COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_id
ORDER BY total_registrations DESC
LIMIT 3;


-- 15. Identify overlapping sessions within the same event.
SELECT s1.event_id, s1.title AS session1, s2.title AS session2
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id = s2.event_id AND s1.session_id < s2.session_id
WHERE s1.start_time < s2.end_time AND s2.start_time < s1.end_time;


-- 16. Find users who created an account in the last 30 days but haven’t registered for any events.
SELECT u.full_name
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
  AND r.registration_id IS NULL;


-- 17. Identify speakers who are handling more than one session across all events.
SELECT speaker_name, COUNT(*) AS session_count
FROM Sessions
GROUP BY speaker_name
HAVING session_count > 1;


-- 18. List all events that do not have any resources uploaded.
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;


-- 19. For completed events, show total registrations and average feedback rating.
SELECT e.title,
       COUNT(DISTINCT r.registration_id) AS total_registrations,
       AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;


-- 20. For each user, calculate how many events they attended and how many feedbacks they submitted.
SELECT u.full_name,
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(DISTINCT f.feedback_id) AS feedbacks_given
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;


-- 21. List top 5 users who have submitted the most feedback entries.
SELECT u.full_name, COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC
LIMIT 5;


-- 22. Detect if a user has been registered more than once for the same event.
SELECT user_id, event_id, COUNT(*) AS registration_count
FROM Registrations
GROUP BY user_id, event_id
HAVING registration_count > 1;


-- 23. Show a month-wise registration count trend over the past 12 months.
SELECT DATE_FORMAT(registration_date, '%Y-%m') AS month, COUNT(*) AS registration_count
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;


-- 24. Compute the average duration (in minutes) of sessions in each event.
SELECT e.title,
       AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS avg_duration_minutes
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id;


-- 25. List all events that currently have no sessions scheduled under them.
SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
