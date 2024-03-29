DELIMITER $$


DROP TRIGGER IF EXISTS `trgTblFile_before_update`
$$
CREATE TRIGGER `trgTblFile_before_update` BEFORE UPDATE ON `TblFile` FOR EACH ROW BEGIN

DECLARE nonNullKeys INT DEFAULT 0;

SET nonNullKeys = nonNullKeys + (NEW.orderID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.productID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.orderItemsID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.orderShipmentID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.inHouseOrderShipmentID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.customerID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.rgaRequestStatusID IS NOT NULL);
SET nonNullKeys = nonNullKeys + (NEW.orderCustomerVisibleID IS NOT NULL);

IF nonNullKeys <> 1 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exactly one of the foreign keys must be NON NULL.';
END IF;

END
$$


DELIMITER ;