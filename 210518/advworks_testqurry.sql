SELECT pc.ProductCategoryID 
     , pc.Name
  FROM SalesLT.ProductCategory AS pc
;

-- data수 295개
-- product category를 기준으로 OUTER JOIN 299 NULL 4
SELECT pd.Name AS product_Name, pd.ProductNumber
     , pd.Color, pd.StandardCost
	 , pd.ListPrice, pd.Size, pd.Weight
	 --, pc.ProductCategoryID
	 , pc.Name AS category_Name
  FROM SalesLT.Product AS pd
 RIGHT OUTER JOIN SalesLT.ProductCategory AS pc
    ON pd.ProductCategoryID = pc.ProductCategoryID

-- CUSTOMER 847개, ADDRESS 450개, CustomerAddress 417개
-- 1
SELECT CONCAT(c.Title, ' ', c.FirstName, ' ', c.MiddleName, c.LastName) AS FullName
     , c.CompanyName, c.EmailAddress, c.Phone
  FROM SalesLT.Customer AS c

SELECT ad.AddressID
     , ad.PostalCode 
     , CONCAT(ad.AddressLine1, ' ', ad.AddressLine2, ',', ad.City, ',', ad.StateProvince) AS addr
  FROM SalesLT.Address AS ad
SELECT * FROM SalesLT.CustomerAddress AS ca

