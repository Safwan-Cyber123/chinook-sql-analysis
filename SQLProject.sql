Use chinook;



             -- Most Reveneue Generated Countries
SELECT BillingCountry,
SUM(Total) AS TotalSpending
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSpending DESC;

                -- Top Customers By Spending
Select Concat(c.firstName,' ',c.lastName) as CustomerName,c.Country,c.CustomerId ,SUM(i.total) As Spender 
from customer as c Join invoice as i on c.CustomerId=i.CustomerId
GROUP BY i.CustomerId Order By Spender DESC LIMIT 10;


              -- Count of Customers by Country
SELECT Country, COUNT(CustomerId) AS CustomerCount
FROM customer 
GROUP BY Country
ORDER BY CustomerCount DESC;

                -- Customers in USA by State
Select state,count(customerid) as NumberOfCustomers
from customer where Country='USA' AND State IS NOT NULL
group by state order by NumberOfCustomers desc;

                       -- Total Reveneue
Select SUM(Total) as TotalRevenue
From invoice;

                      -- Top Selling Tracks
Select t.trackid,t.name,SUM(il.Quantity) 
as TotalSales, SUM(il.unitprice*il.Quantity)
 as TotalRevenue   
From track as t JOIN invoiceline as il
ON t.trackid=il.trackid
Group by t.trackid,t.name
Order by totalSales DESC limit 10;
 
              --  Most Popular Artists
Select a.name,a.artistid, SUM(il.unitprice*il.quantity)
as TotalRevenue
From artist as a Join album 
as al on a.artistid=al.artistid
JOIN track t on al.AlbumId=t.AlbumId
JOIN invoiceline il on t.TrackId=il.TrackId
Group by al.ArtistId order by TotalRevenue Desc LIMIT 1;

                    -- Popular Albums
Select al.title,
al.albumid,SUM(il.unitprice*il.quantity) as TotalRevenue
From album as al Join track as t 
On al.albumid=t.albumid
JOIN invoiceline as il
on t.trackid=il.trackid
Group by al.albumid
order by TotalRevenue Desc LIMIT 10;

                -- Most Popular Genre
Select g.name,SUM(il.unitprice*il.quantity) as TotalRevenue
From genre as g Join track as t 
On g.genreid=t.genreid
JOIN invoiceline as il
ON t.trackid=il.trackid
Group by g.name
order by TotalRevenue Desc LIMIT 1;


              --  Track Per Playlis
SELECT p.name,p.PlaylistId,count(pl.trackid) 
AS TrackPerPlaylist
From playlist as p 
JOIN playlisttrack as pl ON pl.PlaylistId=p.PlaylistId
GROUP BY p.PlaylistId ORDER by TrackPerPlaylist Desc;


               -- Playlist Per Track
SELECT t.name,t.TrackId,
count(pl.PlaylistId) 
AS PlaylistPerTrack
From track as t
JOIN playlisttrack as pl ON pl.trackid=t.trackid
GROUP BY t.trackid ORDER by PlaylistPerTrack Desc;







