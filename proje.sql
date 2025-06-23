create table Members(
user_id serial primary key,
user_name varchar(50) not null unique ,
user_mail varchar(100) not null unique,
user_password varchar(255) not null,
register_time timestamp not null default current_date,
user_firstname varchar(50) not null,
user_lastname varchar(50) not null
)

create table Courses(
course_id serial primary key,
course_name varchar(200),
course_desc text,
course_start_date date,
course_finish_date date,
course_teacher varchar(100),
course_category serial not null,
foreign key (course_category) references Categories (category_id)
)


create table Categories(
category_id serial primary key,
category_name varchar(100)
)


create table enrollments(
enrollment_id serial primary key,
user_id serial not null,
course_id serial not null,
status varchar(50) default 'Enrolled',
foreign key (course_id) references Members (user_id),
foreign key (course_id) references Courses (course_id)
)

create table Certificates(
course_id serial not null,
certificate_id serial primary key,
certificate_code varchar(100) unique,
certificate_date date default current_date,
foreign key (course_id) references Courses (course_id)
)


create table Certificate_assignments(
assigment_id serial primary key,
user_id serial not null,
course_id serial not null,
certificate_id serial not null,
foreign key (user_id) references Members(user_id),
foreign key (course_id) references Courses(course_id),
foreign key (certificate_id) references Certificates(certificate_id)
)


create table blogpost(
post_id serial primary key,
baslik varchar(250),
icerik text,
yayin_taihi timestamp default current_date,
yazar serial not null,
foreign key (yazar) references Members (user_id)
)





