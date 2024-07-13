SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema filmprod_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS filmprod_db ;

-- -----------------------------------------------------
-- Schema filmprod_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS filmprod_db;
USE filmprod_db ;

-- -----------------------------------------------------
-- Table individual
-- -----------------------------------------------------
DROP TABLE IF EXISTS individual;
CREATE TABLE IF NOT EXISTS individual (
  individual_id INT NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  middle_name VARCHAR(45) NULL,
  email VARCHAR(45) NOT NULL,
  contact_number BIGINT(20) NOT NULL,
  picture BLOB NOT NULL,
  PRIMARY KEY (individual_id),
  UNIQUE INDEX email_UNIQUE (email ASC),
  UNIQUE INDEX contact_number_UNIQUE (contact_number ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table department
-- -----------------------------------------------------
DROP TABLE IF EXISTS department;
CREATE TABLE IF NOT EXISTS department (
  department_id INT NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  department_head_id INT NOT NULL,
  email VARCHAR(45) NOT NULL,
  contact_no INT NOT NULL,
  PRIMARY KEY (department_id),
  UNIQUE INDEX contact_no_UNIQUE (contact_no ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table film_production_crew
-- -----------------------------------------------------
DROP TABLE IF EXISTS film_production_crew;
CREATE TABLE IF NOT EXISTS film_production_crew (
  crew_id INT NOT NULL,
  film_id INT NOT NULL,
  department_id INT NOT NULL,
  position_name VARCHAR(45) NOT NULL,
  skills VARCHAR(45) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NULL,
  individual_id INT NOT NULL,
  PRIMARY KEY (crew_id),
  UNIQUE INDEX individual_id_UNIQUE (individual_id ASC),
  INDEX fk_film_production_crew_department1_idx (department_id ASC),
  INDEX fk_film_production_crew_individual1_idx (individual_id ASC, film_id ASC),
  INDEX fk_film_production_crew_film_project1_idx (film_id ASC),
  CONSTRAINT fk_film_production_crew_individual1
    FOREIGN KEY (individual_id)
    REFERENCES individual (individual_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_film_production_crew_department1
    FOREIGN KEY (department_id)
    REFERENCES department (department_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_film_production_crew_film_project1
    FOREIGN KEY (film_id)
    REFERENCES film_project (film_project_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table film_project
-- -----------------------------------------------------
DROP TABLE IF EXISTS film_project;
CREATE TABLE IF NOT EXISTS film_project (
  film_project_id INT NOT NULL,
  title VARCHAR(45) NOT NULL,
  short_summary VARCHAR(250) NOT NULL,
  release_date DATE NOT NULL,
  production_company VARCHAR(45) NOT NULL,
  original_language VARCHAR(45) NOT NULL,
  age_ratings ENUM('Rated G', 'Rated PG', 'Rated PG-13', 'Rated R') NULL,
  status ENUM('Not Yet Started', 'Ongoing', 'Completed') NOT NULL,
  budget DOUBLE NOT NULL,
  box_office_revenue DOUBLE NULL,
  director_id INT NOT NULL,
  producer_id INT NOT NULL,
  PRIMARY KEY (film_project_id),
  INDEX (director_id ASC),
  INDEX (producer_id ASC),
  FOREIGN KEY (director_id)
    REFERENCES film_production_crew (crew_id),
FOREIGN KEY (producer_id)
    REFERENCES film_production_crew (crew_id)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table receipt
-- -----------------------------------------------------
DROP TABLE IF EXISTS receipt;
CREATE TABLE IF NOT EXISTS receipt (
  or_no INT NOT NULL,
  date DATE NOT NULL,
  total_cost DOUBLE NULL,
  PRIMARY KEY (or_no))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table expense
-- -----------------------------------------------------
DROP TABLE IF EXISTS expense;
CREATE TABLE IF NOT EXISTS expense (
  expense_id INT NOT NULL,
  film_id INT NOT NULL,
  department_id INT NOT NULL,
  description VARCHAR(100) NOT NULL,
  production_type ENUM('Pre-Production', 'Production', 'Post-Production') NOT NULL,
  or_no INT NOT NULL,
  PRIMARY KEY (expense_id),
  INDEX fk_expense_receipt1_idx (or_no ASC),
  INDEX (film_id ASC),
  INDEX (department_id ASC),
  CONSTRAINT fk_expense_receipt1
    FOREIGN KEY (or_no)
    REFERENCES receipt (or_no)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (film_id)
		REFERENCES film_project(film_project_id),
	FOREIGN KEY (department_id)
		REFERENCES department(department_id))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table position
-- -----------------------------------------------------
DROP TABLE IF EXISTS position;
CREATE TABLE IF NOT EXISTS position (
  position_name VARCHAR(45) NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (position_name),
  INDEX fk_position_department1_idx (department_id ASC),
  CONSTRAINT fk_position_department1
    FOREIGN KEY (department_id)
    REFERENCES department (department_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table film_production_casts
-- -----------------------------------------------------
DROP TABLE IF EXISTS film_production_casts;
CREATE TABLE IF NOT EXISTS filmprod_db.film_production_casts (
  cast_id INT NOT NULL,
  actor_id INT NOT NULL,
  film_id INT NOT NULL,
  role_name VARCHAR(45) NULL,
  role_type ENUM('Lead', 'Supporting', 'Background', 'Other') NOT NULL,
  PRIMARY KEY (cast_id),
  INDEX (film_id ASC),
  INDEX (actor_id ASC),
  FOREIGN KEY (actor_id)
	REFERENCES actor(actor_id),
FOREIGN KEY (film_id)
    REFERENCES film_project(film_project_id)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table actor
-- -----------------------------------------------------
DROP TABLE IF EXISTS actor;
CREATE TABLE IF NOT EXISTS filmprod_db.actor (
  actor_id INT NOT NULL,
  agency_id INT NULL,
  agent_id INT NULL,
  PRIMARY KEY (actor_id),
  INDEX (actor_id ASC),
  FOREIGN KEY (actor_id)
	REFERENCES individual(individual_id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table equipment
-- -----------------------------------------------------
DROP TABLE IF EXISTS equipment;
CREATE TABLE IF NOT EXISTS equipment (
  equipment_id INT NOT NULL,
  film_id INT NOT NULL,
  equipment_name VARCHAR(45) NOT NULL,
  equipment_type ENUM('Props', 'Camera', 'Lighting', 'Sound', 'Other') NOT NULL,
  qty_available INT NOT NULL,
  condition_ ENUM('Good', 'Fair', 'Poor', 'Need Repair', 'Out of Service') NOT NULL,
  PRIMARY KEY (equipment_id),
  INDEX fk_equipment_film_project1_idx (film_id ASC),
  CONSTRAINT fk_equipment_film_project1
    FOREIGN KEY (film_id)
    REFERENCES film_project (film_project_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table work_time_rates
-- -----------------------------------------------------
DROP TABLE IF EXISTS work_time_rates;
CREATE TABLE IF NOT EXISTS work_time_rates (
  rate_id INT NOT NULL,
  position VARCHAR(45) NOT NULL,
  hourly_rate FLOAT NOT NULL,
  overtime_rate FLOAT NOT NULL,
  PRIMARY KEY (rate_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table work_time_log
-- -----------------------------------------------------
DROP TABLE IF EXISTS work_time_log;
CREATE TABLE IF NOT EXISTS work_time_log (
    work_log_id INT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NULL,
    end_time TIME NULL,
    employee_id INT NOT NULL,
    total_hours INT NOT NULL,
    overtime_hours INT NULL,
    rate_id INT NULL,
    PRIMARY KEY (work_log_id),
    INDEX fk_work_time_log_work_time_rates1_idx (rate_id ASC),
    CONSTRAINT fk_work_time_log_work_time_rates1
        FOREIGN KEY (rate_id)
        REFERENCES work_time_rates (rate_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE = InnoDB;

INSERT INTO individual (individual_id, last_name, first_name, middle_name, email, contact_number, picture) VALUES 
(1000, 'Dela Cruz', 'Juan', 'R', 'juandelacruz@gmail.com', 9171234567, 'pic_1.png'),
(1001, 'Dela Cruz', 'Juanita', 'G', 'juanitadelacruz@gmail.com', 9272345678, 'pic_2.png'),
(1002, 'Rizal', 'Jose', 'P', 'joserizal@gmail.com', 9363456789, 'pic_3.png'),
(1003, 'Bonifacio', 'Andres', 'A', 'andresbonifacio@gmail.com', 9454567890, 'pic_4.png'),
(1004, 'Silang', 'Gabriela', 'R', 'gabrielasilang@gmail.com', 9555678901, 'pic_5.png'),
(1005, 'Luna', 'Juan', 'M', 'juanluna@gmail.com', 09646789012, 'pic_6.png'),
(1006, 'Ariaga', 'Marian', 'N', 'marian_ariaga@gmail.com', 9737890123, 'pic_7.png'),
(1007, 'Vinuya', 'Shane', 'T', 'shane_vinuya@gmail.com', 9828901234, 'pic_8.png'),
(1008, 'Cruz', 'Kath', 'R', 'kathleen_cruz@gmail.com', 9929012345, 'pic_9.png'),
(1009, 'Flores', 'Neil', 'S', 'neil_flores@gmail.com', 9030123456, 'pic_10.png'),
(1010, 'Swift', 'Taylor', 'A', 'taylor_swift@gmail.com', 9141234567, 'pic_11.png'),
(1011, 'Holland', 'Tom', 'S', 'tom_holland@gmail.com', 9252345678, 'pic_12.png'),
(1012, 'Reynolds', 'Ryan', 'R', 'ryan_reynolds@gmail.com', 9363956789, 'pic_13.png'),
(1013, 'Lawrence', 'Jennifer', 'S', 'jennifer_lawrence@gmail.com', 9474567890, 'pic_14.png'),
(1014, 'Hutcherson', 'Josh', 'R', 'josh_hutcherson@gmail.com', 9585678901, 'pic_15.png');

INSERT INTO film_project ( film_project_id, title, short_summary, release_date, production_company, original_language,
	age_ratings, status, budget, box_office_revenue, director_id, producer_id) VALUES
(
    2001, 'The Hunger Games', 'In a dystopian universe, two tributes from Panem''s 12 districts compete in the deadly game known as ''The Hunger Games''.',
    '2012-03-22', 'Lionsgate', 'English', 'Rated PG-13', 'Completed', 20000000.00, 500000000.00, 1000, 1000
),
(
    2002, 'Pride and Prejudice', 'Pride and Prejudice details the love story between Elizabeth Bennet and wealthy landowner Fitzwilliam Darcy, navigating societal biases to find love.',
    '2006-03-01', 'Universal Pictures', 'English', 'Rated PG', 'Completed', 5000000.00, 25000000.00, 1004, 1001
),
(
    2003, 'Shrek 5', 'Shrek 5 follows the life of Shrek''s children, Farkle, Fergus and Felicia as they grow up.',
    '2023-11-30', 'Dreamworks', 'English', 'Rated G', 'Ongoing', 10000000.00, 30000000.00, 1005, 1002
),
(
    2004, '4 Sisters and a Wedding', 'Siblings reunite to dissuade their brother from marriage, leading to the surfacing of buried emotions and long-held grievances.',
    '2023-06-26', 'ABS-CBN', 'Filipino', 'Rated PG', 'Completed', 1000000.00, 5000000.00, 1006, 1008
),
(
    2005, 'Shake, Rattle, and Roll 75', 'The 75th installation of the infamous Filipino horror anthology, "Shake, Rattle, and Roll"',
    '2025-07-15', 'ABS-CBN', 'Filipino', 'Rated PG-13', 'Not Yet Started', 1000000.00, 1500000.00, 1007, 1009
);

INSERT INTO film_production_crew (crew_id, film_id, department_id, position_name, skills, start_date, end_date, individual_id)
VALUES
(4001, 2001, 8000, 'Director', 'cinematography, media production', '2021-01-02', NULL, 1000),
(4002, 2002, 8001, 'Screenwriter', 'excellent language and writing skills', '2021-01-03', NULL, 1001),
(4003, 2003, 8002, 'Location Manager', 'planning and timekeeping skills', '2021-01-04', '2022-05-06', 1002),
(4004, 2004, 8003, 'Camera Operator', 'photography, media production', '2021-01-05', '2022-04-04', 1003),
(4005, 2005, 8004, 'Music Producer', 'music editing and production', '2021-01-06', '2022-09-28', 1004),
(4006, 2001, 8005, 'Make-up Artist', 'attention to detail and makeup theory', '2021-01-07', NULL, 1005),
(4007, 2002, 8006, 'Visual Effects Supervisor', 'knowledge of VFX and CGI', '2021-01-08', NULL, 1006),
(4008, 2003, 8007, 'Costume Designer', 'visual design, dressmaking, fine arts', '2021-01-09', '2022-08-15', 1007),
(4009, 2004, 8000, 'Producer', 'media and video production', '2021-01-10', NULL, 1008),
(4010, 2005, 8001, 'Script Coordinator', 'strong writing skills', '2021-01-11', NULL, 1009);

INSERT INTO department (department_id, department_name, department_head_id, email, contact_no)
VALUES
(8000, 'Production Department', 1000, 'production@gmail.com', 2889699),
(8001, 'Script Department', 1001, 'script@gmail.com', 4131234),
(8002, 'Location Department', 1002, 'location@gmail.com', 1236789),
(8003, 'Camera Department', 1003, 'camera@gmail.com', 2991234),
(8004, 'Sound Department', 1004, 'sound@gmail.com', 6782355),
(8005, 'Hair and Make-up Department', 1005, 'hair_makeup@gmail.com', 4210877),
(8006, 'Visual Effects Department', 1006, 'visual_effects@gmail.com', 6783456),
(8007, 'Wardrobe Department', 1007, 'wardrobe@gmail.com', 8901234),
(8008, 'Marketing Department', 1008, 'marketing@gmail.com', 5435432),
(8009, 'Cast Department', 1009, 'cast@gmail.com', 6437643);

INSERT INTO position (position_name, department_id)
VALUES
('Director', 8000),
('Screenwriter', 8001),
('Location Manager', 8002),
('Camera Operator', 8003),
('Music Producer', 8004),
('Make-up Artist', 8005),
('Visual Effects Supervisor', 8006),
('Costume Designer', 8007),
('Producer', 8000),
('Script Coordinator', 8001);


INSERT INTO film_production_casts (cast_id, actor_id, film_id, role_name, role_type) VALUES
(7000, 1013, 2001, 'Katniss Everdeen', 'Lead'),
(7001, 1014, 2001, 'Peeta Mellark', 'Lead'),
(7002, 1002, 2002, 'Fitzwilliam Darcy', 'Lead'),
(7003, 1003, 2002, 'Charles Bingley', 'Supporting'),
(7004, 1010, 2004, 'Bobbie Salazar', 'Supporting'),
(7005, 1011, 2003, 'Pinocchio', 'Background'),
(7006, 1012, 2005, 'Ghost', 'Other');

INSERT INTO actor (actor_id, agency_id, agent_id)
VALUES
(1002, 102, 202),
(1003, NULL, 203),
(1010, 103, 204),
(1011, 104, NULL),
(1012, NULL, NULL),
(1013, 105, 205),
(1014, NULL, 206);

INSERT INTO expense (expense_id, film_id, department_id, description, production_type, or_no)
VALUES
    (11000, 2001, 8009, 'Cast Pay', 'Production', 10000),
    (11001, 2002, 8009, 'Cast Pay', 'Production', 10001),
    (11002, 2003, 8009, 'Crew Pay', 'Production', 10002),
    (11003, 2004, 8009, 'Crew Pay', 'Production', 10003),
    (11004, 2005, 8009, 'Crew Pay', 'Production', 10004),
    (11005, 2001, 8003, 'Camera Equipment Purchase', 'Pre-Production', 10005),
    (11006, 2002, 8003, 'Lighting Gear Acquisition', 'Pre-Production', 10006),
    (11007, 2003, 8002, 'Set Design Materials', 'Pre-Production', 10007),
    (11008, 2004, 8004, 'Sound Equipment Renewal', 'Pre-Production', 10008),
    (11009, 2005, 8007, 'Costume and Wardrobe Supplies', 'Pre-Production', 10009),
    (11010, 2001, 8008, 'Marketing and Promotion', 'Post-Production', 10010),
    (11011, 2002, 8005, 'Makeup and Prosthetics Replenishment', 'Production', 10011),
    (11012, 2003, 8007, 'Props and Set Dressing', 'Production', 10012),
    (11013, 2004, 8002, 'Studio Rental Fee', 'Production', 10013),
    (11014, 2005, 8002, 'Location Scouting Expenses', 'Pre-Production', 10014),
    (11015, 2001, 8001, 'Script Development Costs', 'Pre-Production', 10015),
    (11016, 2002, 8007, 'Post-production Editing Software', 'Post-Production', 10016),
    (11017, 2003, 8000, 'Transportation Logistics', 'Production', 10017),
    (11018, 2004, 8006, 'Motion Tracking Equipment', 'Pre-Production', 10018);
    
INSERT INTO receipt (or_no, date, total_cost)
VALUES
    (10000, '2023-11-04', 365800),
    (10001, '2023-10-12', 12500),
    (10002, '2023-09-28', 888900),
    (10003, '2023-08-19', 759300),
    (10004, '2023-07-30', 490300),
    (10005, '2023-06-25', 28400),
    (10006, '2023-05-14', 645900),
    (10007, '2023-04-01', 123500),
    (10008, '2023-03-08', 890000),
    (10009, '2023-02-17', 56800),
    (10010, '2023-01-09', 675400),
    (10011, '2022-12-22', 231000),
    (10012, '2022-11-18', 912300),
    (10013, '2022-10-03', 78900),
    (10014, '2022-09-05', 456800),
    (10015, '2022-08-11', 1000000),
    (10016, '2022-07-27', 234600),
    (10017, '2022-06-19', 98800),
    (10018, '2022-05-30', 345700),
    (10019, '2022-04-08', 500000);

INSERT INTO work_time_rates (rate_id, position, hourly_rate, overtime_rate)
VALUES
(101, 'Director', 3500, 875),
(102, 'Screenwriter', 3000, 750),
(103, 'Location Manager', 1900, 225),
(104, 'Camera Operator', 1900, 225),
(105, 'Music Producer', 2800, 580),
(106, 'Make-up Artist', 1500, 200),
(107, 'Visual Effects Supervisor', 3500, 875),
(108, 'Costume Designer', 2900, 620),
(109, 'Producer', 3325, 840),
(110, 'Script Coordinator', 2500, 500),
(111, 'Actor', 2000, 250);

INSERT INTO work_time_log (work_log_id, date, start_time, end_time, employee_id, total_hours, overtime_hours, rate_id)
VALUES
(50006, '2023-06-12', '08:30:00', '17:30:00', 1004, 9, 1, 112),
(50007, '2023-07-08', '09:00:00', '18:00:00', 1005, 9, 0, 113),
(50008, '2023-08-01', '08:15:00', '16:45:00', 1006, 8, 0, 113),
(50009, '2023-09-18', '07:45:00', '16:15:00', 1007, 8, 1, 114),
(50010, '2023-10-25', '10:00:00', '18:30:00', 1008, 8, 0, 115),
(50011, '2023-11-30', '09:30:00', '18:30:00', 1009, 9, 1, 116),
(50012, '2023-12-20', '08:00:00', '17:00:00', 1010, 9, 0, 117),
(50013, '2024-01-05', '07:45:00', '16:45:00', 1011, 9, 0, 118),
(50014, '2024-02-12', '09:15:00', '18:15:00', 1012, 9, 0, 118),
(50015, '2024-03-22', '08:30:00', '17:30:00', 1013, 9, 1, 119),
(50016, '2024-04-15', '08:00:00', '17:00:00', 1014, 9, 0, 120),
(50017, '2024-05-09', '08:45:00', '17:45:00', 1015, 9, 1, 121),
(50018, '2024-06-28', '09:30:00', '18:30:00', 1016, 9, 0, 122),
(50019, '2024-07-20', '08:00:00', '17:00:00', 1017, 9, 1, 122),
(50020, '2024-08-14', '09:15:00', '18:15:00', 1018, 9, 0, 123),
(50021, '2024-09-03', '08:45:00', '17:45:00', 1019, 9, 0, 124),
(50022, '2024-10-28', '09:30:00', '18:30:00', 1020, 9, 1, 125),
(50023, '2024-11-15', '08:00:00', '17:00:00', 1021, 9, 0, 126),
(50024, '2024-12-06', '09:15:00', '18:15:00', 1022, 9, 0, 126),
(50025, '2025-01-20', '08:45:00', '17:45:00', 1023, 9, 1, 127);


INSERT INTO equipment (equipment_id, film_id, equipment_name, equipment_type, qty_available, condition_)
VALUES 
(1001, 2005, 'Mic001', 'Sound', 3, 'Fair'),
(1002, 2001, 'Cam002', 'Camera', 5, 'Good'),
(1003, 2005, 'Light001', 'Lighting', 8, 'Fair'),
(1004, 2002, 'Prop001', 'Props', 10, 'Good'),
(1005, 2004, 'Mic002', 'Sound', 2, 'Poor');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;