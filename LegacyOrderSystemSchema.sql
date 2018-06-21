
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL DEFAULT '-1',
  `date_ordered` date NOT NULL,
  `date_received` date DEFAULT NULL,
  `status` enum('SHIPPED','RECEIVED','CANCELLED') NOT NULL,
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
  `id` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `lastCreated` date NOT NULL,
  `lastUpdated` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `legacy`.`orders` (`order_id`, `date_ordered`, `status`, `created_staff_id`, `created_date`) VALUES ('123', '2018-06-21', 'SHIPPED', '456', '2018-06-21');

INSERT INTO `legacy`.`orders_details` (`order_id`, `product_id`, `quantity`, `unit_price`, `created_staff_id`, `created_date`) VALUES ('123', '001', '100', '1', '456', '2018-06-21');

INSERT INTO `legacy`.`person` (`id`, `firstname`, `lastname`, `email`, `password`, `dob`, `lastCreated`) VALUES ('987', 'John', 'Doe', 'test@test.test', 'secret', '1952-07-10', '2018-06-21');
