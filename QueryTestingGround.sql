ALTER AUTHORIZATION ON DATABASE::npcampground TO [sa]

declare @park_id int
select @park_id = 1
declare @from_date date
select @from_date = '2020-06-18'
declare @to_date date
select @to_date = '2020-06-23'
SELECT DISTINCT TOP 5 site.site_id, campground.campground_id, site.site_number, site.max_occupancy, site.accessible, site.max_rv_length, site.utilities, campground.daily_fee
	FROM campground
	JOIN site ON campground.campground_id = site.campground_id
	LEFT JOIN reservation ON site.site_id = reservation.site_id
	WHERE park_id = @park_id AND site.site_id NOT IN (SELECT site.site_id FROM site
	LEFT JOIN reservation ON site.site_id = reservation.site_id
	WHERE park_id = @park_id AND from_date < @to_date AND to_date > @from_date)

SELECT *
	FROM campground
	JOIN site ON campground.campground_id = site.campground_id
	LEFT JOIN reservation ON site.site_id = reservation.site_id
	WHERE park_id = 1
SELECT name FROM campground
SELECT * FROM park
SELECT * FROM reservation
SELECT * FROM site
--Returns available sites in a chosen campground
--declare @campground_id int
--select @campground_id = 1
--declare @from_date date
--select @from_date = '2020-06-18'
--declare @to_date date
--select @to_date = '2020-06-23'
--SELECT DISTINCT site.site_id, campground.campground_id, site.site_number, site.max_occupancy, site.accessible, site.max_rv_length, site.utilities, campground.daily_fee
--	FROM site
--	JOIN campground ON site.campground_id = campground.campground_id
--	LEFT JOIN reservation ON site.site_id = reservation.site_id
--	WHERE campground.campground_id = @campground_id AND site.site_id NOT IN (SELECT site.site_id FROM site
--	LEFT JOIN reservation ON site.site_id = reservation.site_id
--	WHERE campground_id = @campground_id AND from_date < @to_date AND to_date > @from_date)
SELECT *
	FROM site
	LEFT JOIN reservation ON site.site_id = reservation.site_id
	WHERE campground_id = 1

declare @from_date date
select @from_date = '2020-06-14'
declare @to_date date
select @to_date = '2020-06-19'

SELECT *
FROM campground

SELECT * FROM reservation r
	JOIN site s ON r.site_id = s.site_id
	JOIN campground c ON s.campground_id = c.campground_id
	JOIN park p ON c.park_id = p.park_id
	WHERE from_date <= GETDATE()+30

SELECT * FROM campground
	JOIN site ON campground.campground_id = site.campground_id
	WHERE campground.park_id = 1

