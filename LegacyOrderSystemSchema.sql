CREATE DATABASE `legacy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

CREATE TABLE legacy.`orders` (
  `orderId` int(11) NOT NULL DEFAULT '-1',
  `dateOrdered` date NOT NULL,
  `dateReceived` date DEFAULT NULL,
  `status` enum('SHIPPED','RECEIVED','CANCELLED') NOT NULL,
  `createdStaffId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `updatedStaff_id` int(11) DEFAULT NULL,
  `updatedDate` date DEFAULT NULL,
  `customerId` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderId_UNIQUE` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE legacy.`ordersDetails` (
  `orderId` int(11) NOT NULL DEFAULT '-1',
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` int(11) NOT NULL,
  `createdStaffId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `updatedStaffId` int(11) DEFAULT NULL,
  `updatedDate` date DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderId_UNIQUE` (`orderId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE legacy.`person` (
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

INSERT INTO `legacy`.`orders` (`orderId`, `dateOrdered`, `status`, `createdStaffId`, `createdDate`, `customerId`) VALUES ('123', '2018-06-21', 'SHIPPED', '456', '2018-06-21', '123');

INSERT INTO `legacy`.`ordersdetails` (`orderId`, `productId`, `quantity`, `unitPrice`, `createdStaffId`, `createdDate`, `customerId`) VALUES ('123', '1', '100', '1', '456', '2018-06-21', '123');

INSERT INTO `legacy`.`person` (`id`, `firstname`, `lastname`, `email`, `password`, `dob`, `lastCreated`) VALUES ('123', 'John', 'Doe', 'test@test.test', 'secret', '1952-07-10', '2018-06-21');
