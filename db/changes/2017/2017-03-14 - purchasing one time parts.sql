ALTER TABLE `Products`
	ADD COLUMN `PurchasingIsOneTimePart` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '=1 this is a one time part that will be automatically archived when ordered' AFTER `PurchasingImage`;