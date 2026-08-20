CREATE DATABASE IF NOT EXISTS formula_1_2025_complete;
USE formula_1_2025_complete;

-- === Core Tables ===

CREATE TABLE `drivers` (
  `driverId` INT PRIMARY KEY,
  `driverRef` VARCHAR(50),
  `number` INT NULL,
  `code` VARCHAR(10),
  `forename` VARCHAR(100),
  `surname` VARCHAR(100),
  `dob` DATE NULL,
  `nationality` VARCHAR(50),
  `url` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `constructors` (
  `constructorId` INT PRIMARY KEY,
  `constructorRef` VARCHAR(50),
  `name` VARCHAR(100),
  `nationality` VARCHAR(50),
  `url` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `circuits` (
  `circuitId` INT PRIMARY KEY,
  `circuitRef` VARCHAR(50),
  `name` VARCHAR(100),
  `location` VARCHAR(100),
  `country` VARCHAR(100),
  `lat` DECIMAL(10,6),
  `lng` DECIMAL(10,6),
  `alt` INT,
  `url` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `status` (
  `statusId` INT PRIMARY KEY,
  `status` VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seasons` (
  `year` YEAR PRIMARY KEY,
  `url` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === Race Info ===
CREATE TABLE `races` (
  `raceId` INT PRIMARY KEY,
  `year` YEAR,
  `round` INT,
  `circuitId` INT,
  `name` VARCHAR(150),
  `date` DATE,
  `time` TIME NULL,
  `url` VARCHAR(255),
  `fp1_date` DATE NULL,
  `fp1_time` TIME NULL,
  `fp2_date` DATE NULL,
  `fp2_time` TIME NULL,
  `fp3_date` DATE NULL,
  `fp3_time` TIME NULL,
  `quali_date` DATE NULL,
  `quali_time` TIME NULL,
  `sprint_date` DATE NULL,
  `sprint_time` TIME NULL,
  FOREIGN KEY (`circuitId`) REFERENCES `circuits`(`circuitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === Results & Related Tables ===
CREATE TABLE `results` (
  `resultId` INT PRIMARY KEY,
  `raceId` INT,
  `driverId` INT,
  `constructorId` INT,
  `number` INT NULL,
  `grid` INT NULL,
  `position` INT NULL,
  `positionText` VARCHAR(20),
  `positionOrder` INT NULL,
  `points` DECIMAL(6,2) DEFAULT 0,
  `laps` INT NULL,
  `time` VARCHAR(50) NULL,
  `milliseconds` INT NULL,
  `fastestLap` INT NULL,
  `fastestLapRank` INT NULL,           -- renamed from 'rank'
  `fastestLapTime` VARCHAR(20) NULL,
  `fastestLapSpeed` DECIMAL(8,3) NULL,
  `statusId` INT NULL,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`),
  FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`),
  FOREIGN KEY (`statusId`) REFERENCES `status`(`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `driver_standings` (
  `driverStandingsId` INT PRIMARY KEY,
  `raceId` INT,
  `driverId` INT,
  `points` DECIMAL(6,2),
  `position` INT,
  `positionText` VARCHAR(20),
  `wins` INT,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `constructor_standings` (
  `constructorStandingsId` INT PRIMARY KEY,
  `raceId` INT,
  `constructorId` INT,
  `points` DECIMAL(6,2),
  `position` INT,
  `positionText` VARCHAR(20),
  `wins` INT,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `constructor_results` (
  `constructorResultsId` INT PRIMARY KEY,
  `raceId` INT,
  `constructorId` INT,
  `points` DECIMAL(6,2),
  `status` VARCHAR(100) NULL,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `qualifying` (
  `qualifyId` INT PRIMARY KEY,
  `raceId` INT,
  `driverId` INT,
  `constructorId` INT,
  `number` INT NULL,
  `position` INT NULL,
  `q1` VARCHAR(20) NULL,
  `q2` VARCHAR(20) NULL,
  `q3` VARCHAR(20) NULL,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`),
  FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sprint_results` (
  `resultId` INT PRIMARY KEY,
  `raceId` INT,
  `driverId` INT,
  `constructorId` INT,
  `number` INT NULL,
  `grid` INT NULL,
  `position` INT NULL,
  `positionText` VARCHAR(20),
  `positionOrder` INT NULL,
  `points` DECIMAL(6,2),
  `laps` INT NULL,
  `time` VARCHAR(50) NULL,
  `milliseconds` INT NULL,
  `fastestLap` INT NULL,
  `fastestLapTime` VARCHAR(20) NULL,
  `statusId` INT NULL,
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`),
  FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`),
  FOREIGN KEY (`statusId`) REFERENCES `status`(`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === Lap Times & Pit Stops ===
CREATE TABLE `lap_times` (
  `raceId` INT,
  `driverId` INT,
  `lap` INT,
  `position` INT NULL,
  `time` VARCHAR(20),
  `milliseconds` INT,
  PRIMARY KEY (`raceId`,`driverId`,`lap`),
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pit_stops` (
  `raceId` INT,
  `driverId` INT,
  `stop` INT,
  `lap` INT NULL,
  `time` VARCHAR(20),
  `duration` VARCHAR(20),
  `milliseconds` INT,
  PRIMARY KEY (`raceId`,`driverId`,`stop`),
  FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
  FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
