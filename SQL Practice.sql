
CREATE TABLE users (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(20),
  emailid VARCHAR(100),
  phoneno VARCHAR(20),
  createdat DATETIME DEFAULT GETDATE()
);

INSERT INTO users(name, emailid, phoneno)
VALUES ('mohith', 'mm@gmail.com', '9988');

INSERT INTO users(name, emailid, phoneno)
VALUES ('nitin', 'nngmail.com', '9898');

SELECT * FROM users where name like '%i%';
SELECT upper(name) as Names FROM users;
SELECT lower(name) as Names FROM users;
CREATE TABLE userdata (
  id INT PRIMARY KEY IDENTITY(1,1),
  userid INT,
  followerscount INT DEFAULT 0,
  followingcount INT DEFAULT 0,
  postcount INT DEFAULT 0,
  bio VARCHAR(200),
  FOREIGN KEY (userid) REFERENCES users(id)
);
INSERT INTO userdata(userid,followerscount,followingcount,postcount,bio)
VALUES('1','10','10','20','hey this is mohith new to app')
INSERT INTO userdata(userid,followerscount,followingcount,postcount,bio)
VALUES('2','15','15','25','hey this is nitin new to app')
update userdata set followingcount=20 where id=1;
update userdata set followingcount=10 where id=2;
-- delete FROM userdata where id=2;
SELECT *FROM userdata where followerscount in (10,15);
SELECT *FROM userdata where followerscount between 10 and 15;
SELECT *FROM userdata where followingcount >12;
SELECT count(*) as how FROM userdata;
SELECT sum(followingcount) as Count FROM userdata;
SELECT avg(followerscount) as Counts FROM userdata;
SELECT min(followingcount) as Min FROM userdata where  bio like 'hey%' ;
SELECT max(followerscount)as Max from userdata where bio like 'hey%';
CREATE TABLE posts (
  id INT PRIMARY KEY IDENTITY(1,1),
  userid INT,
  postdesc VARCHAR(200),
  likescount INT DEFAULT 0,
  commentscount INT DEFAULT 0,
  posted DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (userid) REFERENCES users(id)
);
INSERT INTO posts(userid,postdesc,likescount,commentscount)
VALUES('1','hey how are you','100','60')
SELECT *FROM posts;


CREATE TABLE postmedia (
  id INT PRIMARY KEY IDENTITY(1,1),
  postid INT,
  imagelink VARCHAR(250),
  FOREIGN KEY (postid) REFERENCES posts(id)
);
INSERT INTO postmedia(postid,imagelink) VALUES('1','www.google.com1');
INSERT INTO postmedia(postid,imagelink) VALUES('1','www.google.com2');
SELECT *FROM postmedia;

CREATE TABLE postcomments (
  id INT PRIMARY KEY IDENTITY(1,1),
  postid INT,
  commentedBy INT,
  comment VARCHAR(200),
  commentedon DATETIME DEFAULT GETDATE(),
  FOREIGN KEY (postid) REFERENCES posts(id),
  FOREIGN KEY (commentedBy) REFERENCES users(id)
);

CREATE TABLE userfollowers (
  id INT PRIMARY KEY IDENTITY(1,1),
  userid INT,
  followerid INT,
  FOREIGN KEY (userid) REFERENCES users(id),
  FOREIGN KEY (followerid) REFERENCES users(id)
);

CREATE TABLE userfollowing (
  id INT PRIMARY KEY IDENTITY(1,1),
  userid INT,
  followingid INT,
  FOREIGN KEY (userid) REFERENCES users(id),
  FOREIGN KEY (followingid) REFERENCES users(id)
);
SELECT *FROM users;
GO
create view vw_users as SELECT *FROM users;
GO
SELECT *FROM vw_users;

******joins******

CREATE TABLE students (
  rollno INT PRIMARY KEY AUTO_INCREMENT,
  studentname VARCHAR(200)
);

CREATE TABLE courses (
  courseid INT,
  coursename VARCHAR(200),
  rollno INT,
  FOREIGN KEY (rollno) REFERENCES students(rollno)
);


INSERT INTO students (studentname) VALUES ('mohith'), ('nitin'),('vivek'),('sukesh');
SELECT * FROM students;
insert into courses(courseid,coursename,rollno) values ('1','python','1'),('2','java','2'),('3','dbms','3'),('4','sql',null);
select * from courses;
select * from students inner join courses on students.rollno=courses.rollno;
-- select * from students left join courses on students.rollno=courses.rollno;
-- select * from students right join courses on students.rollno=courses.rollno;
-- select * from students natural join courses;
select * from students cross join courses;


