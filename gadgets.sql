/*
	database: gadgets
	tables: gadget, gcompany, gtype

	gadget --> gcompany (gCompanyId)
	gtype --> gadget (gId)

*/

use gadgets;
create table gcompany (gCompanyId int(3), cName varchar(30), PRIMARY KEY (gCompanyId));
create table gadget (gId int(3), gName varchar(30), gCompanyId int(3), PRIMARY KEY (gid), FOREIGN KEY (gCompanyId) REFERENCES gcompany (gCompanyId) ON DELETE  CASCADE);	
create table gtype (gId int(3), gType varchar(20), FOREIGN KEY (gId) REFERENCES gadget (gId) ON DELETE CASCADE );

/* alter table gcompany */
alter table gcompany modify cName varchar(35);

/* insert into table gcompany*/
insert into gcompany values(1,"dell");
insert into gcompany values(2,"sony");
insert into gcompany values(32,"samsung");
insert into gcompany values(11,"motorola");

/* insert into gadget */
insert into gadget values(1,"Mobile Phone",32);
insert into gadget values(4,"Mobile Phone",11);
insert into gadget values(2,"Laptop",2);
insert into gadget values(3,"Laptop",1);insert into gadget values(1,"Mobile Phone",32);	

/* insert into gtype */
insert into gtype values(1,'electronic');
insert into gtype values(1,'3rd gen');
insert into gtype values(1,'4g');
insert into gtype values(3,'4g');
insert into gtype values(2,'4th gen');

/*
	use joins to extract data from tables
	problems:
	1. show gadget name and gadget types
*/

select gName as name, gType as type 
FROM gadget LEFT JOIN gtype ON gadget.gId = gtype.gId;

select gName as name, gType as type 
FROM gadget RIGHT JOIN gtype ON gadget.gId = gtype.gId;

select gName as name, gType as type 
FROM gadget INNER JOIN gtype ON gadget.gId = gtype.gId;

select gadget.gId, gCompanyId as cId, gName as name, gType as type 
FROM gadget INNER JOIN gtype ON gadget.gId = gtype.gId;

select gadget.gId, gCompanyId as cId, gName as name, gType as type 
FROM gadget LEFT OUTER JOIN gtype ON gadget.gId = gtype.gId;

select gadget.gId, gCompanyId as cId, gName as name, gType as type 
FROM gadget RIGHT OUTER JOIN gtype ON gadget.gId = gtype.gId;

select gadget.gId, gCompanyId as cId, gName as name, gType as type 
FROM gadget OUTER JOIN gtype ON gadget.gId = gtype.gId;