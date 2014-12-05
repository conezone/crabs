-- ---
-- Table 'members'
-- 
-- ---

DROP TABLE IF EXISTS `members`;
		
CREATE TABLE `members` (
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `display_name` TEXT NOT NULL
);

-- Event Types
DROP TABLE IF EXISTS `event_types`;

CREATE TABLE `event_types` (
  `type` CHAR(1) PRIMARY KEY NOT NULL,
  `value` TEXT NOT NULL
);

INSERT INTO `event_types` VALUES ('a', 'Athletic');
INSERT INTO `event_types` VALUES ('d', 'Drinking');
INSERT INTO `event_types` VALUES ('o', 'Other');

-- ---
-- Table 'events'
-- 
-- ---

DROP TABLE IF EXISTS `events`;
		
CREATE TABLE `events` (
  `name` TEXT NOT NULL,
  `rules` TEXT NOT NULL,
  `type` CHAR(1) NOT NULL REFERENCES event_types(type)
);

-- ---
-- Table 'weeks'
-- 
-- ---

DROP TABLE IF EXISTS `weeks`;
		
CREATE TABLE `weeks` (
  `date` INTEGER NOT NULL
);

-- ---
-- Table 'events_weeks'
-- 
-- ---

DROP TABLE IF EXISTS `events_weeks`;
		
CREATE TABLE `events_weeks` (
  `events_id` INTEGER NOT NULL,
  `weeks_id` INTEGER NOT NULL,
  FOREIGN KEY (events_id) REFERENCES `events` (`id`),
  FOREIGN KEY (weeks_id) REFERENCES `weeks` (`id`)
);

-- ---
-- Table 'results'
-- 
-- ---

DROP TABLE IF EXISTS `results`;
		
CREATE TABLE `results` (
  `rank` INTEGER NOT NULL,
  `events_id` INTEGER NOT NULL,
  `members_id` INTEGER NOT NULL,
  FOREIGN KEY (events_id) REFERENCES `events` (`id`),
  FOREIGN KEY (members_id) REFERENCES `members` (`id`)
);

-- ---
-- Table 'seasons'
-- 
-- ---

DROP TABLE IF EXISTS `seasons`;
		
CREATE TABLE `seasons` (
  `start_date` INTEGER NOT NULL,
  `end_date` INTEGER NOT NULL
);

-- ---
-- Table 'seasons_weeks'
-- 
-- ---

DROP TABLE IF EXISTS `seasons_weeks`;
		
CREATE TABLE `seasons_weeks` (
  `weeks_id` INTEGER NOT NULL,
  `seasons_id` INTEGER NOT NULL,
  FOREIGN KEY (weeks_id) REFERENCES `weeks` (`id`),
  FOREIGN KEY (seasons_id) REFERENCES `seasons` (`id`)
);

-- ---
-- Table 'seasons_members'
-- 
-- ---

DROP TABLE IF EXISTS `seasons_members`;
		
CREATE TABLE `seasons_members` (
  `members_id` INTEGER NOT NULL,
  `seasons_id` INTEGER NOT NULL,
  FOREIGN KEY (members_id) REFERENCES `members` (`id`),
  FOREIGN KEY (seasons_id) REFERENCES `seasons` (`id`)
);

-- ---
-- Table 'rank_values'
-- 
-- ---

DROP TABLE IF EXISTS `rank_values`;
		
CREATE TABLE `rank_values` (
  `rank` INTEGER NOT NULL,
  `value` INTEGER NOT NULL
);


-- ADD RANK VALUES
sqlite> INSERT INTO rank_values VALUES (1, 10);
sqlite> INSERT INTO rank_values VALUES (2, 8);
sqlite> INSERT INTO rank_values VALUES (3, 6);
sqlite> INSERT INTO rank_values VALUES (4, 4);
sqlite> INSERT INTO rank_values VALUES (5, 3);
sqlite> INSERT INTO rank_values VALUES (6, 2);
sqlite> INSERT INTO rank_values VALUES (7, 1);
sqlite> INSERT INTO rank_values VALUES (8, 0);
sqlite> INSERT INTO rank_values VALUES (9, 0);
sqlite> INSERT INTO rank_values VALUES (10, 0);
sqlite> INSERT INTO rank_values VALUES (11, 0);
sqlite> INSERT INTO rank_values VALUES (12, 0);
sqlite> INSERT INTO rank_values VALUES (13, 0);
sqlite> INSERT INTO rank_values VALUES (14, 0);
sqlite> INSERT INTO rank_values VALUES (15, 0);
sqlite> INSERT INTO rank_values VALUES (16, 0);
sqlite> INSERT INTO rank_values VALUES (17, 0);
sqlite> INSERT INTO rank_values VALUES (18, 0);
sqlite> INSERT INTO rank_values VALUES (19, 0);
sqlite> INSERT INTO rank_values VALUES (20, 0);

-- ADD SEASON 1!
INSERT INTO seasons VALUES (1380931200, 1386374400);

-- members
INSERT INTO members VALUES ('Blake', 'Hedlund', 'Blake');
INSERT INTO members VALUES ('Charlie', 'Satterfield', 'Chuckles');
INSERT INTO members VALUES ('Chris', 'Orme', 'Ormesauce');
INSERT INTO members VALUES ('Steven', 'Growney', 'Growney');
INSERT INTO members VALUES ('Heather', 'Zygutis (Dale)', 'Heat');
INSERT INTO members VALUES ('James', 'Plasencia', 'James');
INSERT INTO members VALUES ('Jimmy', 'Sinha', 'Prashant');
INSERT INTO members VALUES ('Lauryn', 'Holbert', 'Dakota');
INSERT INTO members VALUES ('Jonathan', 'Neely', 'Neely');
INSERT INTO members VALUES ('Saran', 'Tumnee', 'Saran');
INSERT INTO members VALUES ('Scott', 'Heeney', 'Scott');
INSERT INTO members VALUES ('Tom', 'Dale', 'Tommy D');
INSERT INTO members VALUES ('Zack', 'Gholikey', 'Zack');

-- add them to the season
sqlite> INSERT INTO seasons_members VALUES (1, 1);
sqlite> INSERT INTO seasons_members VALUES (2, 1);
sqlite> INSERT INTO seasons_members VALUES (3, 1);
sqlite> INSERT INTO seasons_members VALUES (4, 1);
sqlite> INSERT INTO seasons_members VALUES (5, 1);
sqlite> INSERT INTO seasons_members VALUES (6, 1);
sqlite> INSERT INTO seasons_members VALUES (7, 1);
sqlite> INSERT INTO seasons_members VALUES (8, 1);
sqlite> INSERT INTO seasons_members VALUES (9, 1);
sqlite> INSERT INTO seasons_members VALUES (10, 1);
sqlite> INSERT INTO seasons_members VALUES (11, 1);
sqlite> INSERT INTO seasons_members VALUES (12, 1);
sqlite> INSERT INTO seasons_members VALUES (13, 1);

-- add season 1 dates
sqlite> INSERT INTO weeks VALUES (1380931200);
sqlite> INSERT INTO weeks VALUES (1381536000);
sqlite> INSERT INTO weeks VALUES (1382140800);
sqlite> INSERT INTO weeks VALUES (1382745600);
sqlite> INSERT INTO weeks VALUES (1383436800);
sqlite> INSERT INTO weeks VALUES (1384041600);
sqlite> INSERT INTO weeks VALUES (1384646400);
sqlite> INSERT INTO weeks VALUES (1385251200);
sqlite> INSERT INTO weeks VALUES (1385856000);
sqlite> INSERT INTO weeks VALUES (1386374400);

-- add events
sqlite> INSERT INTO events VALUES ('Soccer', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Basketball', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Home Run Derby', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Tennis', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Bowling', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Military Hike', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Track and Field', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Football', 'To come...', 'a');
sqlite> INSERT INTO events VALUES ('Flip-cup', 'To come...', 'd');
sqlite> INSERT INTO events VALUES ('Beer Pong', 'To come...', 'd');
sqlite> INSERT INTO events VALUES ('Beer Endurance', 'To come...', 'd');
sqlite> INSERT INTO events VALUES ('Bar Race', 'To come...', 'd');
sqlite> INSERT INTO events VALUES ('Poker', 'To come...', 'o');
sqlite> INSERT INTO events VALUES ('Gun Range', 'To come...', 'o');
sqlite> INSERT INTO events VALUES ('Wing Eating', 'To come...', 'o');
sqlite> INSERT INTO events VALUES ('Bar Games', 'To come...', 'o');

-- add weeks ot the season
sqlite> INSERT INTO seasons_weeks VALUES (1, 1);
sqlite> INSERT INTO seasons_weeks VALUES (2, 1);
sqlite> INSERT INTO seasons_weeks VALUES (3, 1);
sqlite> INSERT INTO seasons_weeks VALUES (4, 1);
sqlite> INSERT INTO seasons_weeks VALUES (5, 1);
sqlite> INSERT INTO seasons_weeks VALUES (6, 1);
sqlite> INSERT INTO seasons_weeks VALUES (7, 1);
sqlite> INSERT INTO seasons_weeks VALUES (8, 1);

-- add events and weeks
sqlite> INSERT INTO events_weeks VALUES (1, 1);
sqlite> INSERT INTO events_weeks VALUES (9, 2);
sqlite> INSERT INTO events_weeks VALUES (13, 2);
sqlite> INSERT INTO events_weeks VALUES (2, 2);
sqlite> INSERT INTO events_weeks VALUES (3, 5);
sqlite> INSERT INTO events_weeks VALUES (4, 4);
sqlite> INSERT INTO events_weeks VALUES (10, 4);
sqlite> INSERT INTO events_weeks VALUES (5, 4);
sqlite> INSERT INTO events_weeks VALUES (6, 3);
sqlite> INSERT INTO events_weeks VALUES (14, 6);
sqlite> INSERT INTO events_weeks VALUES (11, 6);
sqlite> INSERT INTO events_weeks VALUES (7, 8);
sqlite> INSERT INTO events_weeks VALUES (15, 8);
sqlite> INSERT INTO events_weeks VALUES (16, 8);
sqlite> INSERT INTO events_weeks VALUES (8, 8);
sqlite> INSERT INTO events_weeks VALUES (12, 8);

-- results
sqlite> INSERT INTO results VALUES (1, 1, 5);
sqlite> INSERT INTO results VALUES (2, 1, 3);
sqlite> INSERT INTO results VALUES (3, 1, 2);
sqlite> INSERT INTO results VALUES (4, 1, 9);
sqlite> INSERT INTO results VALUES (5, 1, 6);
sqlite> INSERT INTO results VALUES (6, 1, 1);
sqlite> INSERT INTO results VALUES (7, 1, 4);
sqlite> INSERT INTO results VALUES (8, 1, 11);
sqlite> INSERT INTO results VALUES (9, 1, 12);
sqlite> INSERT INTO results VALUES (10, 1, 8);
sqlite> INSERT INTO results VALUES (1, 2, 3);
sqlite> INSERT INTO results VALUES (2, 2, 12);
sqlite> INSERT INTO results VALUES (3, 2, 10);
sqlite> INSERT INTO results VALUES (4, 2, 1);
sqlite> INSERT INTO results VALUES (5, 2, 8);
sqlite> INSERT INTO results VALUES (6, 2, 5);
sqlite> INSERT INTO results VALUES (7, 2, 9);
sqlite> INSERT INTO results VALUES (1, 3, 11);
sqlite> INSERT INTO results VALUES (2, 3, 12);
sqlite> INSERT INTO results VALUES (3, 3, 13);
sqlite> INSERT INTO results VALUES (4, 3, 4);
sqlite> INSERT INTO results VALUES (5, 3, 9);
sqlite> INSERT INTO results VALUES (6, 3, 8);
sqlite> INSERT INTO results VALUES (7, 3, 3);
sqlite> INSERT INTO results VALUES (8, 3, 5);
sqlite> INSERT INTO results VALUES (1, 4, 2);
sqlite> INSERT INTO results VALUES (2, 4, 12);
sqlite> INSERT INTO results VALUES (3, 4, 7);
sqlite> INSERT INTO results VALUES (4, 4, 1);
sqlite> INSERT INTO results VALUES (5, 4, 10);
sqlite> INSERT INTO results VALUES (6, 4, 8);
sqlite> INSERT INTO results VALUES (7, 4, 3);
sqlite> INSERT INTO results VALUES (8, 4, 5);
sqlite> INSERT INTO results VALUES (9, 4, 6);
sqlite> INSERT INTO results VALUES (10, 4, 4);
sqlite> INSERT INTO results VALUES (11, 4, 9);
sqlite> INSERT INTO results VALUES (1, 5, 13);
sqlite> INSERT INTO results VALUES (2, 5, 12);
sqlite> INSERT INTO results VALUES (3, 5, 9);
sqlite> INSERT INTO results VALUES (4, 5, 5);
sqlite> INSERT INTO results VALUES (5, 5, 4);
sqlite> INSERT INTO results VALUES (6, 5, 3);
sqlite> INSERT INTO results VALUES (7, 5, 10);
sqlite> INSERT INTO results VALUES (8, 5, 6);
sqlite> INSERT INTO results VALUES (9, 5, 8);
sqlite> INSERT INTO results VALUES (1, 6, 10);
sqlite> INSERT INTO results VALUES (2, 6, 5);
sqlite> INSERT INTO results VALUES (3, 6, 9);
sqlite> INSERT INTO results VALUES (4, 6, 12);
sqlite> INSERT INTO results VALUES (5, 6, 4);
sqlite> INSERT INTO results VALUES (6, 6, 7);
sqlite> INSERT INTO results VALUES (7, 6, 8);
sqlite> INSERT INTO results VALUES (1, 7, 3);
sqlite> INSERT INTO results VALUES (2, 7, 9);
sqlite> INSERT INTO results VALUES (3, 7, 1);
sqlite> INSERT INTO results VALUES (4, 7, 10);
sqlite> INSERT INTO results VALUES (5, 7, 7);
sqlite> INSERT INTO results VALUES (6, 7, 12);
sqlite> INSERT INTO results VALUES (7, 7, 5);
sqlite> INSERT INTO results VALUES (8, 7, 4);
sqlite> INSERT INTO results VALUES (1, 8, 1);
sqlite> INSERT INTO results VALUES (2, 8, 3);
sqlite> INSERT INTO results VALUES (3, 8, 12);
sqlite> INSERT INTO results VALUES (4, 8, 4);
sqlite> INSERT INTO results VALUES (5, 8, 5);
sqlite> INSERT INTO results VALUES (6, 8, 10);
sqlite> INSERT INTO results VALUES (7, 8, 7);
sqlite> INSERT INTO results VALUES (8, 8, 9);
sqlite> INSERT INTO results VALUES (1, 9, 3);
sqlite> INSERT INTO results VALUES (2, 9, 13);
sqlite> INSERT INTO results VALUES (3, 9, 5);
sqlite> INSERT INTO results VALUES (4, 9, 11);
sqlite> INSERT INTO results VALUES (5, 9, 4);
sqlite> INSERT INTO results VALUES (6, 9, 12);
sqlite> INSERT INTO results VALUES (7, 9, 1);
sqlite> INSERT INTO results VALUES (8, 9, 8);
sqlite> INSERT INTO results VALUES (9, 9, 7);
sqlite> INSERT INTO results VALUES (10, 9, 9);
sqlite> INSERT INTO results VALUES (1, 10, 4);
sqlite> INSERT INTO results VALUES (2, 10, 5);
sqlite> INSERT INTO results VALUES (3, 10, 12);
sqlite> INSERT INTO results VALUES (4, 10, 9);
sqlite> INSERT INTO results VALUES (5, 10, 6);
sqlite> INSERT INTO results VALUES (6, 10, 3);
sqlite> INSERT INTO results VALUES (7, 10, 2);
sqlite> INSERT INTO results VALUES (8, 10, 13);
sqlite> INSERT INTO results VALUES (9, 10, 8);
sqlite> INSERT INTO results VALUES (1, 11, 1);
sqlite> INSERT INTO results VALUES (2, 11, 12);
sqlite> INSERT INTO results VALUES (3, 11, 3);
sqlite> INSERT INTO results VALUES (4, 11, 5);
sqlite> INSERT INTO results VALUES (5, 11, 9);
sqlite> INSERT INTO results VALUES (6, 11, 4);
sqlite> INSERT INTO results VALUES (7, 11, 2);
sqlite> INSERT INTO results VALUES (1, 12, 3);
sqlite> INSERT INTO results VALUES (2, 12, 12);
sqlite> INSERT INTO results VALUES (3, 12, 5);
sqlite> INSERT INTO results VALUES (4, 12, 8);
sqlite> INSERT INTO results VALUES (5, 12, 4);
sqlite> INSERT INTO results VALUES (5, 12, 7);
sqlite> INSERT INTO results VALUES (1, 13, 8);
sqlite> INSERT INTO results VALUES (2, 13, 3);
sqlite> INSERT INTO results VALUES (3, 13, 1);
sqlite> INSERT INTO results VALUES (4, 13, 5);
sqlite> INSERT INTO results VALUES (5, 13, 12);
sqlite> INSERT INTO results VALUES (6, 13, 11);
sqlite> INSERT INTO results VALUES (7, 13, 7);
sqlite> INSERT INTO results VALUES (8, 13, 4);
sqlite> INSERT INTO results VALUES (9, 13, 13);
sqlite> INSERT INTO results VALUES (10, 13, 9);
sqlite> INSERT INTO results VALUES (1, 14, 1);
sqlite> INSERT INTO results VALUES (2, 14, 12);
sqlite> INSERT INTO results VALUES (3, 14, 9);
sqlite> INSERT INTO results VALUES (4, 14, 5);
sqlite> INSERT INTO results VALUES (5, 14, 4);
sqlite> INSERT INTO results VALUES (6, 14, 3);
sqlite> INSERT INTO results VALUES (1, 15, 13);
sqlite> INSERT INTO results VALUES (2, 15, 6);
sqlite> INSERT INTO results VALUES (3, 15, 7);
sqlite> INSERT INTO results VALUES (4, 15, 3);
sqlite> INSERT INTO results VALUES (5, 15, 12);
sqlite> INSERT INTO results VALUES (7, 15, 9);
sqlite> INSERT INTO results VALUES (8, 15, 4);
sqlite> INSERT INTO results VALUES (9, 15, 8);
sqlite> INSERT INTO results VALUES (1, 16, 1);
sqlite> INSERT INTO results VALUES (2, 16, 9);
sqlite> INSERT INTO results VALUES (3, 16, 12);
sqlite> INSERT INTO results VALUES (4, 16, 3);
sqlite> INSERT INTO results VALUES (5, 16, 4);
sqlite> INSERT INTO results VALUES (6, 16, 13);
sqlite> INSERT INTO results VALUES (7, 16, 7);
sqlite> INSERT INTO results VALUES (8, 16, 5);
sqlite> INSERT INTO results VALUES (9, 16, 8);
sqlite> INSERT INTO results VALUES (10, 16, 6);
