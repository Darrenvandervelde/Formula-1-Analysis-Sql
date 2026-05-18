/*
================================================================================
                        HOW TO IMPORT THE F1 CSV DATA
================================================================================

1. First things first:
   - Make sure you have already created the database and tables by running the schema file.
     **Do this before running this script!**

2. What this script does:
   - Loads all the Formula 1 2025 CSV files into your database.
   - Uses your local CSV files on your computer.

3. Getting the file paths:
   - Go to the folder where all the CSV files are.
   - Right-click the folder → Click "Copy as path".
   - Paste that path into the script where needed.
   - For Windows, make sure to **use double backslashes \\** in the path.

================================================================================
*/



USE formula_1_2025_complete;

SET GLOBAL local_infile = 1;

-- 1. circuits
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\circuits.csv'
INTO TABLE circuits
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(circuitId, circuitRef, name, location, country, lat, lng, alt, url);

-- 2. constructors
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\constructors.csv'
INTO TABLE constructors
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(constructorId, constructorRef, name, nationality, url);

-- 3. drivers
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\drivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(driverId, driverRef, number, code, forename, surname, dob, nationality, url);

-- 4. seasons
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\seasons.csv'
INTO TABLE seasons
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(year, url);

-- 5. status
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\status.csv'
INTO TABLE status
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(statusId, status);

-- 6. races
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\races.csv'
INTO TABLE races
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(raceId, year, round, circuitId, name, date, time, url, fp1_date, fp1_time, fp2_date, fp2_time, fp3_date, fp3_time, quali_date, quali_time, sprint_date, sprint_time);

-- 7. results
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\results.csv'
INTO TABLE results
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@resultId, @raceId, @driverId, @constructorId, @number, @grid, @position,
 @positionText, @positionOrder, @points, @laps, @time, @milliseconds,
 @fastestLap, @rank, @fastestLapTime, @fastestLapSpeed, @statusId)
SET
  resultId = @resultId,
  raceId = @raceId,
  driverId = @driverId,
  constructorId = @constructorId,
  number = NULLIF(@number,'\N'),
  grid = NULLIF(@grid,'\N'),
  position = NULLIF(@position,'\N'),
  positionText = @positionText,
  positionOrder = NULLIF(@positionOrder,'\N'),
  points = NULLIF(@points,'\N'),
  laps = NULLIF(@laps,'\N'),
  time = @time,
  milliseconds = NULLIF(@milliseconds,'\N'),
  fastestLap = NULLIF(@fastestLap,'\N'),
  fastestLapRank = NULLIF(@rank,'\N'),   -- map CSV 'rank' to renamed column
  fastestLapTime = @fastestLapTime,
  fastestLapSpeed = NULLIF(@fastestLapSpeed,'\N'),
  statusId = NULLIF(@statusId,'\N');


-- 8. driver_standings
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\driver_standings.csv'
INTO TABLE driver_standings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(driverStandingsId, raceId, driverId, points, position, positionText, wins);

-- 9. constructor_standings
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\constructor_standings.csv'
INTO TABLE constructor_standings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(constructorStandingsId, raceId, constructorId, points, position, positionText, wins);

-- 10. constructor_results
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\constructor_results.csv'
INTO TABLE constructor_results
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(constructorResultsId, raceId, constructorId, points, status);

-- 11. qualifying
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\qualifying.csv'
INTO TABLE qualifying
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(qualifyId, raceId, driverId, constructorId, number, position, q1, q2, q3);

-- 12. sprint_results
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\sprint_results.csv'
INTO TABLE sprint_results
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(resultId, raceId, driverId, constructorId, number, grid, position, positionText, positionOrder, points, laps, time, milliseconds, fastestLap, fastestLapTime, statusId);

-- 13. lap_times
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\lap_times.csv'
INTO TABLE lap_times
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(raceId, driverId, lap, position, time, milliseconds);

-- 14. pit_stops
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\OneDrive - ITonlinelearning Ltd\\Desktop\\formula_1_2025_complete_dataset\\pit_stops.csv'
INTO TABLE pit_stops
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(raceId, driverId, stop, lap, time, duration, milliseconds);

