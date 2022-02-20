create database TravelonTheGo;
use TravelonTheGo;
create table PASSENGER
(
Passenger_name varchar(30),
category varchar(30),
gender varchar(20),
boarding_city varchar(30),
destination_city varchar(30),
distance int,
bus_type varchar(30)
);
create table PRICE
(
bus_type varchar(30),
distance int,
price int
);
insert into PASSENGER values("Sejal","AC","F","Bengaluru","Chennai",350,"sleeper");
insert into PASSENGER values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into PASSENGER values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into PASSENGER values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into PASSENGER values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into PASSENGER values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into PASSENGER values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into PASSENGER values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into PASSENGER values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");
insert into PRICE values("Sleeper", 350 ,770);
insert into PRICE values("Sleeper", 500 ,1100);
insert into PRICE values("Sleeper", 600, 1320);
insert into PRICE values("Sleeper", 700, 1540);
insert into PRICE values("Sleeper", 1000 ,2200);
insert into PRICE values("Sleeper", 1200 ,2640);
insert into PRICE values("Sleeper", 1500 ,2700);
insert into PRICE values("Sitting", 500, 620);
insert into PRICE values("Sitting", 600 ,744);
insert into PRICE values("Sitting", 700 ,868);
insert into PRICE values("Sitting", 1000 ,1240);
insert into PRICE values("Sitting", 1200 ,1488);
insert into PRICE values("Sitting",1500 ,1860);

select gender,count(gender) from PASSENGER where passenger.distance >=600 group by gender;
select bus_type,min(price) from price where bus_type="Sleeper";
select distinct passenger_name from passenger where passenger_name like "s%";
select distinct passenger.passenger_name,passenger.boarding_city,passenger.destination_city,price.bus_type,price.price from passenger left join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type;
select passenger_name,price from (select distinct passenger.passenger_name,passenger.boarding_city,passenger.destination_city,price.bus_type,price.price,passenger.distance from passenger left join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type)a where bus_type="sitting" and distance=1000;
select distinct(distance) from passenger order by distance asc;
select bus_type,price from price where distance in (select distance from passenger where boarding_city="Panaji" and destination_city="Bengaluru"); 
select passenger_name,(distance/total)*100 as perc from (select a.* , sum(distance) as total from passenger a) b;    
select xyz.passenger_name, xyz.distance/(select sum(distance) as total  from passenger) *100 as perc
from passenger xyz ;    
select distance,price,
case
when price>1000 then "Expensive"
when price>500 or price<1000 then "Average cost"
else "Cheap"
end as work
from price;

      
 