use quanlysinhvien;
select *
from student
where StudentName like 'h%';

select *
from class
where month (StartDate) = 12;

select *
from subject
where Credit between 3 and 5;

update student
set ClassID = 2
where StudentName = 'Hung';


select S.StudentName, Sub.SubName, m.Mark
from student S join mark m on S.StudentID = m.StudentID join subject Sub on Sub.SubID = m.SubID
order by  Mark desc, SubName  ;

