CREATE TABLE course_layout (
    course_layout_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code VARCHAR(100) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    hp INT NOT NULL,
    min_students INT NOT NULL,
    max_students INT NOT NULL,
    valid_from_date DATE,
    valid_to_date DATE,
    CONSTRAINT valid_dates CHECK (valid_from_date <= valid_to_date)
);

CREATE TABLE department (
    department_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager VARCHAR(100)
);

CREATE TABLE job_title (
    job_title_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL
);

CREATE TABLE person (
    personal_number VARCHAR(14) NOT NULL PRIMARY KEY,  
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE phone_number (
    phone_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL,
    personal_number VARCHAR(12) NOT NULL,
    FOREIGN KEY (personal_number) REFERENCES person(personal_number)
);

CREATE TABLE salary_history (
    salary_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    salary_amount DECIMAL(12,2) NOT NULL,  
    valid_from_date DATE NOT NULL,
    valid_to_date DATE,
    employment_id VARCHAR(100) NOT NULL,  -- link to employee
    CONSTRAINT valid_salary_dates CHECK (valid_from_date <= valid_to_date)
);

CREATE TABLE skill_set (
    skill_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL
);

CREATE TABLE teacher_rules (
    rule_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    max_courses_per_period INT NOT NULL,
    admin_factor NUMERIC(5,2),
    examination_factor NUMERIC(5,2)
);

CREATE TABLE teaching_activity (
    teaching_activity_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    activity_name VARCHAR(50) NOT NULL,
    factor NUMERIC(5,2)  
);

CREATE TABLE course_instance (
    instance_id VARCHAR(20) PRIMARY KEY, 
    study_period VARCHAR(10),
    num_students INT,
    course_layout_id INT NOT NULL,
    study_year INT NOT NULL,
    FOREIGN KEY (course_layout_id) REFERENCES course_layout(course_layout_id)
);


CREATE TABLE employee (
    employment_id VARCHAR(100) PRIMARY KEY,
    department_id INT NOT NULL,
    job_title_id INT NOT NULL,
    supervisor_manager VARCHAR(100),
    personal_number VARCHAR(12) NOT NULL,
    rule_id INT,
    current_salary_id INT,  
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (job_title_id) REFERENCES job_title(job_title_id),
    FOREIGN KEY (personal_number) REFERENCES person(personal_number),
    FOREIGN KEY (rule_id) REFERENCES teacher_rules(rule_id),
    FOREIGN KEY (current_salary_id) REFERENCES salary_history(salary_id)
);

CREATE TABLE employee_skill (
    employment_id VARCHAR(100) NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (employment_id, skill_id),
    FOREIGN KEY (employment_id) REFERENCES employee(employment_id),
    FOREIGN KEY (skill_id) REFERENCES skill_set(skill_id)
);

CREATE TABLE planned_activity (
    planned_activity_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planned_hours INT,
    instance_id VARCHAR(20) NOT NULL,
    teaching_activity_id INT NOT NULL,
    FOREIGN KEY (instance_id) REFERENCES course_instance(instance_id),
    FOREIGN KEY (teaching_activity_id) REFERENCES teaching_activity(teaching_activity_id)
);

CREATE TABLE planned_employee (
    employment_id VARCHAR(100) NOT NULL,
    planned_activity_id INT NOT NULL,
    PRIMARY KEY (employment_id, planned_activity_id),
    FOREIGN KEY (employment_id) REFERENCES employee(employment_id),
    FOREIGN KEY (planned_activity_id) REFERENCES planned_activity(planned_activity_id)
);