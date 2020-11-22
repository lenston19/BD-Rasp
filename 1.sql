Select C.NameChetnostDneyNedeli, DN.NameDenNedeli, N.TimeStart, N.TimeEnd , D.NameDisciplina, (TEACH.NameDoljnost + ' - ' + TEACH.FIOTeacher) as Teacher, AuditorId, T.NameTypeLearn From RaspisaniyeZanyatiy as R join Disciplina as D on R.DisciplinaId = D.id 
    join (SELECT AU.id, AU.PositionValue, KO.Adress,KO.NameKorpus FROM Auditor AS AU JOIN Korpus AS KO ON AU.KorpusId = KO.id) as A on A.id = R.AuditorId 
    join TypeLearn as T on R.TypeLearnId = T.id join NumberLearn as N on R.NumberLearnId = N.id join ChetnostDneyNedeli as C on R.ChetnostDneyNedeliId = C.id
    join DenNedeli as DN ON R.DenNedeliId = DN.id join [Group] as G on R.GroupId = G.id join (Select TC.id, FIOTeacher, DO.NameDoljnost From Teacher as TC join Doljnost as DO on TC.DoljnostId = DO.id) as TEACH 
    on R.TeacherId = TEACH.id
    Where R.ChetnostDneyNedeliId = 2 AND R.GroupId = 'ИСТ-311' AND R.DenNedeliId = 1