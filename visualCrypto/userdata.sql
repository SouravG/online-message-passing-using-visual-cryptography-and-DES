delimiter $$

CREATE TABLE `userdata` (
  `slno` int(8) NOT NULL AUTO_INCREMENT,
  `uno` varchar(90) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `dob` varchar(60) DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `phone` int(12) DEFAULT NULL,
  `active` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`slno`),
  UNIQUE KEY `uno` (`uno`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8$$

