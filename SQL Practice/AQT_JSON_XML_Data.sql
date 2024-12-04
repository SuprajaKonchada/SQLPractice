-- Extract dimensions, weight from the JSON column and supplier details from the XML column
SELECT 
    ProductID,
    JSON_VALUE(ProductSpecificationsJSON, '$.Dimensions.Height') AS Height,
    JSON_VALUE(ProductSpecificationsJSON, '$.Dimensions.Width') AS Width,
    JSON_VALUE(ProductSpecificationsJSON, '$.Dimensions.Depth') AS Depth,
    JSON_VALUE(ProductSpecificationsJSON, '$.Weight') AS Weight,
	SupplierDetailsXML.value('(/Supplier/Name)[1]', 'NVARCHAR(50)') AS SupplierName,
    SupplierDetailsXML.value('(/Supplier/Location)[1]', 'NVARCHAR(50)') AS SupplierLocation,
    SupplierDetailsXML.value('(/Supplier/Contact)[1]', 'NVARCHAR(20)') AS SupplierContact
FROM ProductInfo;

-- Update JSON and XML content in the table
UPDATE ProductInfo
SET 
    ProductSpecificationsJSON = JSON_MODIFY(ProductSpecificationsJSON, '$.Weight', '1.8 kg'),
    SupplierDetailsXML.modify('replace value of (/Supplier/Location/text())[1] with "Boston"')
WHERE ProductID = 1;

SELECT 
    ProductID, 
    ProductSpecificationsJSON, 
    SupplierDetailsXML 
FROM ProductInfo
WHERE ProductID = 1;


