IF OBJECT_ID('Raspisaniye', 'U') IS NOT NULL DROP database Raspisaniye

CREATE DATABASE Raspisaniye

use Raspisaniye

CREATE TABLE Faculty(
    id int not null IDENTITY(1,1),
    NameFaculty NVARCHAR(100),
    constraint pk_Faculty primary key(ID)
)

create TABLE FormStudy(
    id int not null IDENTITY(1,1),
    NameFormStudy NVARCHAR(20)
    constraint pk_FormStudy primary key(ID)
)

create TABLE Speciality(
    id int not null IDENTITY(1,1),
    NameSpeciality NVARCHAR(150)
    constraint pk_Speciality primary key(ID)
)

create table Korpus(
	id int not null identity(1,1),
	NameKorpus NVARCHAR(100),
	Adress NVARCHAR(200),
	constraint pk_Korpus primary key(ID)
)

create table Auditor(
    id int not null,
    PositionValue int,
	KorpusId int not null,
    constraint pk_Auditor primary key(ID),
	constraint fk_Auditor_Korpus foreign key(KorpusId)
    references Korpus(ID),
)

create table Disciplina(
    id int not null IDENTITY(1,1),
    NameDisciplina NVARCHAR(100),
    constraint pk_Disciplina primary key(ID)
)

create table DenNedeli(
    id int not null IDENTITY(1,1),
    NameDenNedeli NVARCHAR(30),
    constraint pk_DenNedeli primary key(ID)
)

create table ChetnostDneyNedeli(
    id int not null IDENTITY(1,1),
    NameChetnostDneyNedeli NVARCHAR(15),
    constraint pk_ChetnostDneyNedelii primary key(ID)
)

create table NumberLearn(
    id int not null IDENTITY(1,1),
    TimeStart Time,
    TimeEnd Time,
    constraint pk_NumberLearn primary key(ID)
)

create table TypeLearn(
    id int not null IDENTITY(1,1),
    NameTypeLearn NVARCHAR(30),
    constraint pk_TypeLearn primary key(ID)
)




create table Kafedra(
    id int not null IDENTITY(1,1),
    NameKafedra NVARCHAR(100),
    constraint pk_Kafedra primary key(ID)
)

create table Doljnost(
    id int not null IDENTITY(1,1),
    NameDoljnost NVARCHAR(100),
    constraint pk_Doljnost primary key(ID)
)


create table [Group](
    id nvarchar(10) not null,
    StudentValue int,
    FacultyId int not null,
    FormStudyId int not null,
    SpecialityId int not null
    constraint pk_Group primary key(ID),
    constraint fk_Group_Faculty foreign key(FacultyId)
    references Faculty(ID),
    constraint fk_Group_FormStudy foreign key(FormStudyId)
    references FormStudy(ID),
    constraint fk_Group_Speciality foreign key(SpecialityId)
    references Speciality(ID),
)

create table Teacher(
    id int not null IDENTITY(1,1),
    FIOTeacher NVARCHAR(150),
    KafedraId int not null,
    DoljnostId int not null,
    constraint pk_Teacher primary key(ID),
    constraint fk_Teacher_Kafedra foreign key(KafedraId)
    references Kafedra(ID),
    constraint fk_Teacher_Doljnost foreign key(DoljnostId)
    references Doljnost(ID),
)



create table RaspisaniyeZanyatiy(
    id int not null IDENTITY(1,1),
    GroupId nvarchar(10) not null,
    AuditorId int not null,
    TeacherId int not null,
    DisciplinaId int not null,
    DenNedeliId int not null,
    ChetnostDneyNedeliId int not null,
    TypeLearnId int not null,
    NumberLearnId int not null,
    constraint pk_RaspisaniyeZanyatiy primary key(ID),
    constraint fk_RaspisaniyeZanyatiy_Group foreign key(GroupId)
    references [Group](ID),
    constraint fk_RaspisaniyeZanyatiy_Disciplina foreign key(DisciplinaId)
    references Disciplina(ID),
    constraint fk_RaspisaniyeZanyatiy_Auditor foreign key(AuditorId)
    references Auditor(ID),
    constraint fk_RaspisaniyeZanyatiy_DenNedeli foreign key(DenNedeliId)
    references DenNedeli(ID),
    constraint fk_RaspisaniyeZanyatiy_ChetnostDneyNedeli foreign key(ChetnostDneyNedeliId)
    references ChetnostDneyNedeli(ID),
    constraint fk_RaspisaniyeZanyatiy_NumberLearn foreign key(NumberLearnId)
    references NumberLearn(ID),
    constraint fk_RaspisaniyeZanyatiy_TypeLearn foreign key(TypeLearnId)
    references TypeLearn(ID),
    constraint fk_RaspisaniyeZanyatiy_Teacher foreign key(TeacherId)
    references Teacher(ID)
)

insert into Faculty(NameFaculty)
values('Менеджмента и предпринимательства'),
	('Торгового дела'),
	('Компьютерных технологий и информационной безопасности'),
	('Учетно-экономический'),
	('Экономики и финансов'),
	('Юридический'),
	('Лингвистики и журналистики')

insert into FormStudy(NameFormStudy)
values('Очная'),
	('Заочная')

insert into Speciality(NameSpeciality)
values('Прикладная информатика'),
	('Информационные системы и технологии'),
	('Информационная безопасность'),
	('Бизнес-информатика'),
	('Прикладная математика и информатика'),
	('Программная инженерия')

insert into Korpus(NameKorpus,Adress)
values('Основной','344002, г. Ростов-на-Дону, ул. Большая Садовая, д. 69'),
	('МИП','344082, г. Ростов-на-Дону, пер. Островского, 62'),
	('Юридический','344010, г. Ростов-на-Дону, ул. М. Горького, 166'),
	('ЛИЖ','344002, г. Ростов-на-Дону, ул. Тургеневская, 49')

insert into Auditor(id, PositionValue,KorpusId)
values('210','20','1'),
	('212','20','1'),
	('213','20','1'),
	('214','20','1')

insert into Disciplina(NameDisciplina)
values('Управление данными'),
	('Базы данных'),
	('Мобильные технологии'),
	('Введение в специальность')

insert into DenNedeli(NameDenNedeli)
values('Понедельник'),
	('Вторник'),
	('Среда'),
	('Четверг'),
	('Пятница'),
	('Суббота')

insert into ChetnostDneyNedeli(NameChetnostDneyNedeli)
values('Четная'),
	('Нечетная')

insert into NumberLearn(TimeStart, TimeEnd)
values('08:30:00','10:00:00'),
	('10:10:00','11:40:00'),
	('11:50:00','13:20:00'),
	('13:50:00','15:20:00'),
	('15:30:00','17:00:00')

insert into TypeLearn(NameTypeLearn)
values('Лекция'),
	('Практика'),
	('Лабораторная')

insert into Kafedra(NameKafedra)
values('Информационных систем и прикладной информатики'),
	('Фундаментальной и прикладной математики'),
	('Информационных технологий и защиты информации')

insert into Doljnost(NameDoljnost)
values('Ассистент'),
	('Ст. преподаватель'),
	('Доцент'),
	('Профессор')

insert into [Group](id,StudentValue, FacultyId, FormStudyId, SpecialityId)
values('ИСТ-311','15','3','1','2'),
	('ИСТ-331','18','3','1','2')

insert into Teacher(FIOTeacher,KafedraId, DoljnostId)
values('Долженко Алексей Иванович','1','4'),
	('Гречкина Вера Юрьевна','1','1')

insert into RaspisaniyeZanyatiy(GroupId,AuditorId, TeacherId, DisciplinaId, DenNedeliId, ChetnostDneyNedeliId, TypeLearnId,NumberLearnId)
values('ИСТ-311','212','1','1','1','1','1','1'),
	('ИСТ-311','213','2','4','2','1','3','2'),
	('ИСТ-311','212','2','1','3','1','3','3'),
	('ИСТ-311','213','2','1','3','2','3','4'),
	('ИСТ-311','212','2','4','4','2','3','5'),
	('ИСТ-331','213','1','1','1','1','1','1'),
	('ИСТ-331','212','1','2','2','1','1','2'),
	('ИСТ-331','213','1','3','2','2','1','3'),
	('ИСТ-331','212','1','2','3','2','2','4'),
	('ИСТ-331','213','2','3','4','1','3','5'),
    ('ИСТ-311','212','1','1','1','2','1','1')


Select C.NameChetnostDneyNedeli, DN.NameDenNedeli, N.TimeStart, N.TimeEnd , D.NameDisciplina, (TEACH.NameDoljnost + ' - ' + TEACH.FIOTeacher) as Teacher, AuditorId, T.NameTypeLearn From RaspisaniyeZanyatiy as R join Disciplina as D on R.DisciplinaId = D.id 
    join (SELECT AU.id, AU.PositionValue, KO.Adress,KO.NameKorpus FROM Auditor AS AU JOIN Korpus AS KO ON AU.KorpusId = KO.id) as A on A.id = R.AuditorId 
    join TypeLearn as T on R.TypeLearnId = T.id join NumberLearn as N on R.NumberLearnId = N.id join ChetnostDneyNedeli as C on R.ChetnostDneyNedeliId = C.id
    join DenNedeli as DN ON R.DenNedeliId = DN.id join [Group] as G on R.GroupId = G.id join (Select TC.id, FIOTeacher, DO.NameDoljnost From Teacher as TC join Doljnost as DO on TC.DoljnostId = DO.id) as TEACH 
    on R.TeacherId = TEACH.id
    Where R.ChetnostDneyNedeliId = 2 AND R.GroupId = 'ИСТ-311' AND R.DenNedeliId = 1

Select distinct GroupId From RaspisaniyeZanyatiy as R
    join (SELECT AU.id, AU.PositionValue, KO.Adress,KO.NameKorpus FROM Auditor AS AU JOIN Korpus AS KO ON AU.KorpusId = KO.id) as A on A.id = R.AuditorId 
    join DenNedeli as DN ON R.DenNedeliId = DN.id 
    Where A.id = 212 AND R.DenNedeliId = 3 AND A.NameKorpus = 'Основной'

Select C.NameChetnostDneyNedeli, DN.NameDenNedeli, TEACH.FIOTeacher, N.TimeStart, N.TimeEnd, D.NameDisciplina, GroupId, AuditorId, T.NameTypeLearn From RaspisaniyeZanyatiy as R join Disciplina as D on R.DisciplinaId = D.id 
    join (SELECT AU.id, AU.PositionValue, KO.Adress,KO.NameKorpus FROM Auditor AS AU JOIN Korpus AS KO ON AU.KorpusId = KO.id) as A on A.id = R.AuditorId 
    join TypeLearn as T on R.TypeLearnId = T.id join NumberLearn as N on R.NumberLearnId = N.id join ChetnostDneyNedeli as C on R.ChetnostDneyNedeliId = C.id
    join DenNedeli as DN ON R.DenNedeliId = DN.id join [Group] as G on R.GroupId = G.id join (Select TC.id, FIOTeacher, DO.NameDoljnost From Teacher as TC join Doljnost as DO on TC.DoljnostId = DO.id) as TEACH 
    on R.TeacherId = TEACH.id
    Where TEACH.FIOTeacher = 'Долженко Алексей Иванович'