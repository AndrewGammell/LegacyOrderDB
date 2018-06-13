CREATE DATABASE `order` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date_ordered` date NOT NULL,
  `date_recieved` date DEFAULT NULL,
  `status` enum('shipped','received','cancelled') NOT NULL,
  `created_staff_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_staff_id` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_staff_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_staff_id` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `created` varchar(45) NOT NULL,
  `lastUpdated` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `order`.`orders` (`order_id`, `date_ordered`, `status`, `created_staff_id`, `created_date`, `updated_staff_id`) 
VALUES ('1', '2018-06-13', 'shipped', '1', '2018-06-13', '1');

INSERT INTO `order`.`orders_details` (`order_id`, `product_id`, `quantity`, `unit_price`, `created_staff_id`, `created_date`)
VALUES ('1', '1', '1', '1', '1', '2018-06-13');

INSERT INTO `order`.`person` (`ID`, `firstname`, `lastname`, `email`, `password`, `dob`, `created`) 
VALUES ('2', 'Tom', 'Selleck', 'tomselleck@test.com', 'selleck', '1942-08-08', '2018-0606');

