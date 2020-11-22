Select distinct GroupId From RaspisaniyeZanyatiy as R
    join (SELECT AU.id, AU.PositionValue, KO.Adress,KO.NameKorpus FROM Auditor AS AU JOIN Korpus AS KO ON AU.KorpusId = KO.id) as A on A.id = R.AuditorId 
    join DenNedeli as DN ON R.DenNedeliId = DN.id 
    Where A.id = 212 AND R.DenNedeliId = 3 AND A.NameKorpus = 'Основной'