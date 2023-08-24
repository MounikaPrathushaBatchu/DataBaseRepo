select  id, category,active
                 from  EquipmentCategory where (active = 1
                 or id=(select equipmentcategory_id from equipmentsubcategory where id
                 =(select EQUIPMENTSUBCATEGORY_ID from equipment where id= 20)))
                 order by sortorder,upper(category);
                 
select * from equipmentsubcategory;
select * from EquipmentCategory;
select * from Equipment where caterdocs_id is not null and active=1;
javamaintenanceapi2.getuploadfilename;

select      E.Name name,
                            EC.Id categoryid,
                            ESC.Id subcategoryid,
                            E.QUANTITY quantity,
                            E.Cost price,
                            E.OurCost cost,
                            E.Comments comments,
                            E.Active active,
                            nvl(E.platter,0) platter,
                            E.SortOrder sortorder,
                            E.CaterDocs_Id,
                            javamaintenanceapi2.getuploadfilename(e.caterdocs_id) filename,
                            E.scalable,
                            E.qty_per_person
                from        Equipment E,
                            EquipmentCategory EC,
                            EquipmentSubCategory ESC
                where       E.EquipmentSubCategory_ID = ESC.Id
                and         ESC.EquipmentCategory_id= EC.Id
                and         E.Id =10;
                
Select * from CATERDOCS where id=1369;
Select * from CATERDOCS;

select NVL(substr(name,INSTR(name,'/')+1,LENGTH(name)),null) name,mime_type,doc_size from caterdocs where id = 1369;
select blob_content from caterdocs where id = 1369;