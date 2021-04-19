select u.Email, r.Name
from [dbo].[AspNetUsers] u join [dbo].[AspNetUserRoles] ur on u.Id = ur.UserId join [dbo].[AspNetRoles] r on ur.RoleId = r.Id
order by r.Name