CREATE TABLE `qa_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_categrory` varchar(30) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `item_price` double DEFAULT 0,
  `item_us_price` double DEFAULT NULL,
  `item_uae_price` double DEFAULT NULL,
  `item_gbp_price` double DEFAULT NULL,
  `item_euro_price` double DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO qa_items (item_categrory,item_id,item_name,item_price,item_us_price,item_uae_price,item_gbp_price,item_euro_price,is_deleted) VALUES
	 ('Apostille',1001,'Apostille',180.0,180.0,800.0,180.0,180.0,0),
	 ('Apostille',1002,'Birth Certificate Apostille',180.0,180.0,800.0,180.0,180.0,0),
	 ('Apostille',1003,'Death Certificate Apostille',180.0,180.0,800.0,180.0,180.0,0),
	 ('Apostille',1004,'Marriage Certificate Apostille',180.0,180.0,800.0,180.0,180.0,0),
	 ('Apostille',1005,'Power of Attorney Apostille',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1006,'Notarized',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1007,'Signature Notarization',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1008,'Certified Copy of Passport Id',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1009,'Affidavit Notarization',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1010,'Power of Attorney',180.0,180.0,800.0,180.0,180.0,0);
INSERT INTO qa_items (item_categrory,item_id,item_name,item_price,item_us_price,item_uae_price,item_gbp_price,item_euro_price,is_deleted) VALUES
	 ('Notarization',1011,'Birth Certificate Notarization',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1012,'Death Certificate Notarization',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1013,'Marriage Certificate',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1014,'Minor Travel Consent',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1015,'Shareholder Structure',180.0,180.0,800.0,180.0,180.0,0),
	 ('Notarization',1016,'Letter Apartment',180.0,180.0,800.0,180.0,180.0,0);
	 
	 
CREATE TABLE `qa_addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `default_price` double DEFAULT NULL,
  `us_price` double DEFAULT NULL,
  `uae_price` double DEFAULT NULL,
  `gbp_price` double DEFAULT NULL,
  `euro_price` double DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO qa_addons (name,default_price,us_price,uae_price,gbp_price,euro_price,is_deleted) VALUES
	 ('Add Notarization',80.0,80.0,300.0,80.0,80.0,0),
	 ('Add Translation',70.0,70.0,400.0,70.0,70.0,0),
	 ('Add Certified Copy of Passport/ID',60.0,60.0,400.0,60.0,60.0,0),
	 ('Express Service',60.0,60.0,400.0,60.0,60.0,0);
	 
ALTER TABLE `qa_order` 
ADD COLUMN `product_id` INT(6) NULL DEFAULT '1001' AFTER `quantity`,
ADD COLUMN `product_price` DOUBLE NULL DEFAULT '180.0' AFTER `product_id`;

	 