select UserId,UserName,
(FirstName+ ' '+ISNULL(MiddleName,'')+' '+LastName) as Full_Name,
(case when Gender=1 then 'Male'
when Gender = 2 then 'Female' else 'Other' end) as Gender
,FORMAT (DateOfBirth, 'dd-MM-yy') as Date_Of_Birth
,ContactNo,ReligionName 
from UserRegistration 
inner join Conf_Religion on UserRegistration.ReligionId = Conf_Religion.ReligionId
where (UserRegistration.ReligionId = 0 or 0=0 )
and (Gender = 0 or 0=0) 

select UserId,UserName,
(FirstName+ ' '+ISNULL(MiddleName,'')+' '+LastName) as Full_Name,
(case when Gender=1 then 'Male'
when Gender = 2 then 'Female' else 'Other' end) as Gender
,FORMAT (DateOfBirth, 'dd-MM-yy') as Date_Of_Birth
,ContactNo
,(case when ReligionId=1 then 'Islam'
when ReligionId = 2 then 'Hindu' else 'Other' end) as Religion_Name 
from UserRegistration 

where (UserRegistration.ReligionId = 0 or 0=0 )
and (Gender = 0 or 0=0) 

