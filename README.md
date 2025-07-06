# 📚 Online Education Platform Database (PostgreSQL)

This project models the core database structure of an online education platform using PostgreSQL. It includes detailed management of users, courses, categories, certificates, blog posts, and participation relationships.

## 📂 Table of Contents

- [Database Tables](#database-tables)
  - [Members](#1-members)
  - [Categories](#2-categories)
  - [Courses](#3-courses)
  - [Enrollments](#4-enrollments)
  - [Certificates](#5-certificates)
  - [Certificate_assignments](#6-certificate_assignments)
  - [Blogpost](#7-blogpost)
- [Relationships](#relationships)
- [Database Schema](#database-schema)
- [Setup](#setup)

---

## Database Tables

### 1. `Members`

Stores information about platform users.

| Column           | Type           | Description                    |
|------------------|----------------|--------------------------------|
| `user_id`        | serial         | Primary key                    |
| `user_name`      | varchar(50)    | Unique username                |
| `user_mail`      | varchar(100)   | Unique email address           |
| `user_password`  | varchar(255)   | Password (hashed)              |
| `register_time`  | timestamp      | Registration date              |
| `user_firstname` | varchar(50)    | First name                     |
| `user_lastname`  | varchar(50)    | Last name                      |

---

### 2. `Categories`

Defines course categories.

| Column          | Type           | Description           |
|------------------|----------------|------------------------|
| `category_id`    | serial         | Primary key            |
| `category_name`  | varchar(100)   | Name of the category   |

---

### 3. `Courses`

Contains course-related information.

| Column             | Type           | Description                      |
|--------------------|----------------|----------------------------------|
| `course_id`        | serial         | Primary key                      |
| `course_name`      | varchar(200)   | Name of the course               |
| `course_desc`      | text           | Description                      |
| `course_start_date`| date           | Start date                       |
| `course_finish_date`| date          | End date                         |
| `course_teacher`   | varchar(100)   | Instructor name                  |
| `course_category`  | serial         | Foreign key → `Categories`       |

---

### 4. `Enrollments`

Tracks user participation in courses.

| Column           | Type           | Description                   |
|------------------|----------------|-------------------------------|
| `enrollment_id`  | serial         | Primary key                   |
| `user_id`        | serial         | Foreign key → `Members`       |
| `course_id`      | serial         | Foreign key → `Courses`       |
| `status`         | varchar(50)    | Default: "Enrolled"           |

---

### 5. `Certificates`

Stores certificates related to courses.

| Column            | Type           | Description                      |
|-------------------|----------------|----------------------------------|
| `certificate_id`  | serial         | Primary key                      |
| `course_id`       | serial         | Foreign key → `Courses`          |
| `certificate_code`| varchar(100)   | Unique certificate code          |
| `certificate_date`| date           | Default: current date            |

---

### 6. `Certificate_assignments`

Assigns certificates to users.

| Column           | Type   | Description                           |
|------------------|--------|---------------------------------------|
| `assigment_id`   | serial | Primary key                           |
| `user_id`        | serial | Foreign key → `Members`               |
| `course_id`      | serial | Foreign key → `Courses`               |
| `certificate_id` | serial | Foreign key → `Certificates`          |

---

### 7. `Blogpost`

Stores blog posts written by users.

| Column         | Type          | Description                        |
|----------------|---------------|------------------------------------|
| `post_id`      | serial        | Primary key                        |
| `baslik`       | varchar(250)  | Title                              |
| `icerik`       | text          | Content                            |
| `yayin_taihi`  | timestamp     | Default: current date              |
| `yazar`        | serial        | Foreign key → `Members(user_id)`   |

---

## 🔗 Relationships

- A **user** can enroll in multiple **courses** → `Enrollments`
- A **course** belongs to one **category** → `Courses.course_category → Categories.category_id`
- A **course** can have a **certificate** → `Certificates`
- A **certificate** can be assigned to a **user** for a **course** → `Certificate_assignments`
- A **user** can write multiple **blog posts** → `Blogpost`

---

## 🗂 Database Schema

To better understand the database structure and relationships, refer to the **`Database Schema`** file included in the project. It provides a visual overview of all tables and their connections.

---

## ⚙️ Setup

1. Start your PostgreSQL server.
2. Run the `proje.sql` file using the PostgreSQL terminal or GUI (e.g., PgAdmin):

```bash
psql -U postgres -d Database -f proje.sql
