

select fs.House_Price,fs.Final_Cost,fs.Broker_Cost,fs.Assessment_Tax,fs.Insurance_Cost,ss.Seller_Name,dp.Address,dp.BuildingArea,dp.CouncilArea,dp.Region_Name,dp.Suburb,dp.LandSize,dd.Date,dd.Year,dd.Month,dd.Quarter
from Fact_Sold fs
inner join Dim_Property dp on fs.Property_ID = dp.Property_SK
inner join Dim_SellerDetails ss on fs.Seller_ID = ss.Seller_SK
inner join DimDate dd on fs.Date_ID = dd.DateKey
where fs.Final_Cost > 10000