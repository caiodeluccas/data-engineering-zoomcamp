-- ==========================================
-- Homework 1 - Data Engineering Zoomcamp
-- ==========================================

-- Question 3
-- How many trips had trip_distance <= 1 mile?

SELECT COUNT (*)
FROM green_taxi_data
WHERE lpep_pickup_datetime >= '2025-11-01'
AND lpep_dropoff_datetime < '2025-12-01'
AND trip_distance <= 1;

-- Answer = 8007

-- Question 4
-- Pick up day with the longest trip

SELECT DATE (lpep_pickup_datetime)
FROM green_taxi_data
WHERE trip_distance < 100
ORDER BY trip_distance DESC
LIMIT 1

--Answer 2025-11-14

-- Question 5
-- Pickup zone with largest total_amount

SELECT
	z."Zone",
	SUM(t.total_amount) AS soma
FROM green_taxi_data t
LEFT JOIN taxi_zone_data z
	ON t."PULocationID" = z."LocationID"
WHERE t.lpep_pickup_datetime >= '2025-11-18'
AND t.lpep_pickup_datetime < '2025-11-19'
GROUP BY z."Zone"
ORDER BY soma DESC
LIMIT 1;

--Answer East Harlem North


-- Question 6
-- Largest tip from East Harlem North

SELECT
    dropoff."Zone",
    MAX(t.tip_amount) AS largest_tip
FROM green_taxi_data t
LEFT JOIN taxi_zone_data pickup
    ON t."PULocationID" = pickup."LocationID"
LEFT JOIN taxi_zone_data dropoff
    ON t."DOLocationID" = dropoff."LocationID"
WHERE t.lpep_pickup_datetime >= '2025-11-01'
  AND t.lpep_pickup_datetime < '2025-12-01'
  AND pickup."Zone" = 'East Harlem North'
GROUP BY dropoff."Zone"
ORDER BY largest_tip DESC
LIMIT 1;

--Answer Yorkville West
