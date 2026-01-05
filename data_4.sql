-- 1. department (10 rows)
INSERT INTO department (department_name, manager) VALUES
('Computer Science', 'Anna Larsson'),
('Mathematics', 'Erik Johansson'),
('Physics', 'Maria Svensson'),
('Electrical Engineering', 'Lars Nilsson'),
('Mechanical Engineering', 'Karin Andersson'),
('Chemistry', 'Olof Berg'),
('Biology', 'Sofia Lind'),
('Economics', 'Johan Pettersson'),
('Law', 'Eva Holm'),
('Medicine', 'Per Gustafsson');

-- 2. job_title (10 rows)
INSERT INTO job_title (job_title) VALUES
('Professor'),
('Associate Professor'),
('Assistant Professor'),
('Lecturer'),
('Researcher'),
('PhD Student'),
('Postdoc'),
('Lab Engineer'),
('Administrator'),
('Teaching Assistant');

-- 3. person (10 rows – personal_number = Swedish format YYYYMMDD-XXXX)
INSERT INTO person (personal_number, first_name, last_name, address) VALUES
('19800101-1234', 'Anna', 'Larsson', 'KTH Campus 1'),
('19750515-5678', 'Erik', 'Johansson', 'Stockholm City'),
('19900220-9012', 'Maria', 'Svensson', 'Uppsala Road 5'),
('19680303-3456', 'Lars', 'Nilsson', 'Solna'),
('19851212-7890', 'Karin', 'Andersson', 'Bromma'),
('19780909-2345', 'Olof', 'Berg', 'Lidingö'),
('19911111-6789', 'Sofia', 'Lind', 'Södermalm'),
('19660404-0123', 'Johan', 'Pettersson', 'Vasastan'),
('19870707-4567', 'Eva', 'Holm', 'Kungsholmen'),
('19720202-8901', 'Per', 'Gustafsson', 'Östermalm');

-- 4. phone_number (10 rows – some people have multiple)
INSERT INTO phone_number (phone_number, personal_number) VALUES
('070-1234567', '19800101-1234'),
('08-7906000', '19800101-1234'),
('070-2345678', '19750515-5678'),
('070-3456789', '19900220-9012'),
('070-4567890', '19680303-3456'),
('070-5678901', '19851212-7890'),
('070-6789012', '19780909-2345'),
('070-7890123', '19911111-6789'),
('070-8901234', '19660404-0123'),
('070-9012345', '19870707-4567');

-- 5. course_layout (10 rows)
INSERT INTO course_layout (course_code, course_name, hp, min_students, max_students, valid_from_date, valid_to_date) VALUES
('DD1337', 'Programming', 7.5, 20, 200, '2024-01-01', '2026-12-31'),
('SF1625', 'Calculus', 7.5, 30, 300, '2024-01-01', NULL),
('DD1388', 'Algorithms', 7.5, 15, 150, '2025-01-01', NULL),
('ME1001', 'Mechanics', 6.0, 25, 180, '2024-09-01', '2027-08-31'),
('EL1000', 'Electronics', 6.0, 20, 120, '2025-03-01', NULL),
('II1300', 'Project Course', 15.0, 10, 40, '2025-01-01', '2025-12-31'),
('SF1911', 'Probability', 6.0, 30, 250, '2024-01-01', NULL),
('ID1217', 'Concurrent Programming', 7.5, 20, 100, '2025-01-01', NULL),
('DD1385', 'Data Structures', 7.5, 25, 180, '2024-09-01', NULL),
('MJ1101', 'Energy Systems', 6.0, 15, 90, '2025-03-01', NULL);

-- 6. skill_set (10 rows)
INSERT INTO skill_set (skill_name) VALUES
('Python'),
('Java'),
('C++'),
('SQL'),
('Machine Learning'),
('Web Development'),
('Data Analysis'),
('Algorithms'),
('Teaching'),
('Project Management');

-- 7. teacher_rules (10 rows – example rules)
INSERT INTO teacher_rules (max_courses_per_period, admin_factor, examination_factor) VALUES
(3, 0.2, 0.3),
(4, 0.1, 0.4),
(2, 0.3, 0.2),
(5, 0.0, 0.5),
(3, 0.2, 0.3),
(4, 0.1, 0.4),
(2, 0.4, 0.1),
(3, 0.2, 0.3),
(5, 0.0, 0.5),
(4, 0.1, 0.4);

-- 8. teaching_activity (10 rows)
INSERT INTO teaching_activity (activity_name, factor) VALUES
('Lecture', 1.0),
('Exercise', 0.8),
('Lab', 1.2),
('Seminar', 0.9),
('Project Supervision', 1.5),
('Exam', 0.5),
('Grading', 0.3),
('Meeting', 0.2),
('Planning', 0.4),
('Research', 0.0);

-- 9. course_instance (10 rows – linked to course_layout)
INSERT INTO course_instance (instance_id, study_period, num_students, course_layout_id, study_year) VALUES
('DD1337-2025P1', 'P1', 150, 1, 2025),
('SF1625-2025P2', 'P2', 280, 2, 2025),
('DD1388-2025P3', 'P3', 120, 3, 2025),
('ME1001-2025P1', 'P1', 160, 4, 2025),
('EL1000-2025P4', 'P4', 90, 5, 2025),
('II1300-2025', 'Full year', 30, 6, 2025),
('SF1911-2025P1', 'P1', 200, 7, 2025),
('ID1217-2025P2', 'P2', 80, 8, 2025),
('DD1385-2025P3', 'P3', 140, 9, 2025),
('MJ1101-2025P4', 'P4', 70, 10, 2025);

-- 10. employee (10 rows – linked to person, department, job_title, etc.)
INSERT INTO employee (employment_id, department_id, job_title_id, supervisor_manager, personal_number, rule_id, current_salary_id) VALUES
('EMP001', 1, 1, NULL, '19800101-1234', 1, 1),
('EMP002', 2, 2, 'Anna Larsson', '19750515-5678', 2, 2),
('EMP003', 1, 3, 'Anna Larsson', '19900220-9012', 3, 3),
('EMP004', 3, 1, NULL, '19680303-3456', 1, 4),
('EMP005', 4, 4, 'Lars Nilsson', '19851212-7890', 4, 5),
('EMP006', 1, 6, 'Anna Larsson', '19780909-2345', 5, 6),
('EMP007', 5, 2, 'Karin Andersson', '19911111-6789', 2, 7),
('EMP008', 6, 5, 'Olof Berg', '19660404-0123', 6, 8),
('EMP009', 7, 3, 'Sofia Lind', '19870707-4567', 3, 9),
('EMP010', 8, 7, 'Johan Pettersson', '19720202-8901', 7, 10);

-- 11. salary_history (10 rows – current salaries)
INSERT INTO salary_history (salary_amount, valid_from_date, employment_id) VALUES
(80000, '2024-01-01', 'EMP001'),
(75000, '2024-01-01', 'EMP002'),
(65000, '2025-01-01', 'EMP003'),
(85000, '2023-01-01', 'EMP004'),
(60000, '2025-01-01', 'EMP005'),
(55000, '2025-03-01', 'EMP006'),
(78000, '2024-01-01', 'EMP007'),
(62000, '2024-06-01', 'EMP008'),
(68000, '2025-01-01', 'EMP009'),
(72000, '2023-01-01', 'EMP010');

-- 12. employee_skill (10 links)
INSERT INTO employee_skill (employment_id, skill_id) VALUES
('EMP001', 1),
('EMP001', 4),
('EMP002', 2),
('EMP003', 5),
('EMP004', 3),
('EMP005', 6),
('EMP006', 8),
('EMP007', 1),
('EMP008', 4),
('EMP009', 9);

-- 13. planned_activity (10 rows)
INSERT INTO planned_activity (planned_hours, instance_id, teaching_activity_id) VALUES
(40, 'DD1337-2025P1', 1),
(30, 'SF1625-2025P2', 2),
(50, 'DD1388-2025P3', 3),
(35, 'ME1001-2025P1', 1),
(45, 'EL1000-2025P4', 4),
(100, 'II1300-2025', 5),
(25, 'SF1911-2025P1', 2),
(40, 'ID1217-2025P2', 1),
(38, 'DD1385-2025P3', 3),
(32, 'MJ1101-2025P4', 4);

-- 14. planned_employee (10 links)
INSERT INTO planned_employee (employment_id, planned_activity_id) VALUES
('EMP001', 1),
('EMP002', 2),
('EMP003', 3),
('EMP004', 4),
('EMP005', 5),
('EMP006', 6),
('EMP007', 7),
('EMP008', 8),
('EMP009', 9),
('EMP010', 10);