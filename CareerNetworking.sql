CREATE DATABASE CareerNetworking;

USE CareerNetworking;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    account_type VARCHAR(20),
    created_at DATETIME
);

CREATE TABLE Profile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    headline VARCHAR(255),
    summary TEXT,
    location VARCHAR(255),
    work_mode VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Experience (
    exp_id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT NOT NULL,
    job_title VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    FOREIGN KEY (profile_id) REFERENCES Profile(profile_id)
);

CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255),
    industry VARCHAR(100),
    size_category VARCHAR(50)
);

CREATE TABLE JobPosting (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    posted_by INT,
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    employment_type VARCHAR(20),
    min_salary INT,
    max_salary INT,
    experience_level VARCHAR(20),
    FOREIGN KEY (company_id) REFERENCES Company(company_id),
    FOREIGN KEY (posted_by) REFERENCES User(user_id)
);

CREATE TABLE Application (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL,
    user_id INT NOT NULL,
    status VARCHAR(20),
    applied_at DATETIME,
    FOREIGN KEY (job_id) REFERENCES JobPosting(job_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    subject VARCHAR(255),
    body TEXT,
    sent_at DATETIME,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

CREATE TABLE Connection (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id1 INT NOT NULL,
    user_id2 INT NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (user_id1) REFERENCES User(user_id),
    FOREIGN KEY (user_id2) REFERENCES User(user_id)
);
