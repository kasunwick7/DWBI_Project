
CREATE PROCEDURE dbo.UpdateDim_Property
@property_id int,
@Suburb nvarchar(Max),
@Address nvarchar(MAX),
@Postcode int,
@Bedroom int,
@Bathroom int,
@Landsize float,
@BuildingArea float,
@CouncilArea nvarchar(MAX),
@Regionname nvarchar(MAX)
AS
BEGIN
if not exists (select Property_SK
from dbo.Dim_Property
where Property_Alt_ID = @property_id)
BEGIN
insert into dbo.Dim_Property
(Property_Alt_ID,Suburb,Address,PostCode,Bedroom,Bathroom,LandSize,BuildingArea,CouncilArea,Region_Name,Insert_Date, Update_Date)
values
(@property_id, @Suburb, @Address, @Postcode,@Bedroom,@Bathroom,@Landsize ,@BuildingArea,@CouncilArea,@Regionname,GETDATE(),GETDATE())
END;
if exists (select Property_SK
from dbo.Dim_Property
where Property_Alt_ID = @property_id)
BEGIN
update dbo.Dim_Property
set Property_Alt_ID = @property_id,
Suburb = @Suburb,
Address = @Address,
PostCode = @Postcode,
Bedroom = @Bedroom,
Bathroom = @Bathroom,
LandSize = @Landsize,
BuildingArea = @BuildingArea,
CouncilArea = @CouncilArea,
Region_Name = @Regionname,
Insert_Date = GETDATE(),
Update_Date = GETDATE()
where Property_Alt_ID = @property_id
END;
END;

