/* Maynor Alex Moreno
COMP 269_801RL
CH  16 & 18 In Class
Due 12.18.17 */

-- CH 16 Question 1 -- TESTED
USE ap;

DROP TRIGGER IF EXISTS invoices_before_update;

DELIMITER //

CREATE TRIGGER invoices_before_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
BEGIN
  DECLARE sum_line_item_amount DECIMAL(9,2);
  DECLARE payment_credit_total DECIMAL(9,2);
  
  SELECT SUM(line_item_amount) 
  INTO sum_line_item_amount
  FROM invoice_line_items
  WHERE invoice_id = NEW.invoice_id;
  
  SELECT payment_total + credit_total
  INTO payment_credit_total
  FROM Invoices
  WHERE invoice_id = NEW.invoice_id;
  
  IF sum_line_item_amount != NEW.invoice_total THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Line item total must match invoice total.';
  END IF;
  IF payment_credit_total > New.invoice_total THEN
	SIGNAL SQLSTATE 'HY000'
		SET MESSAGE_TEXT = 'The sum of the payment and credit totals is greater than the invoice total.';
  END IF;
END//

DELIMITER ;

UPDATE invoices
SET credit_total = 50
WHERE invoice_id = 2;

SELECT invoice_id, invoice_total, credit_total, payment_total 
FROM invoices WHERE invoice_id = 2;

-- CH 16 QUESTION 2 -- TESTED
USE ap;

DROP TABLE IF EXISTS invoices_audit;

CREATE TABLE invoices_audit
(
  vendor_id           INT             NOT NULL,
  invoice_number      VARCHAR(50)     NOT NULL,
  invoice_total       DECIMAL(9,2)    NOT NULL,
  action_type         VARCHAR(50)     NOT NULL,
  action_date         DATETIME        NOT NULL
);

DROP TRIGGER IF EXISTS invoices_after_update;

DELIMITER //

CREATE TRIGGER invoices_after_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
BEGIN
    INSERT INTO invoices_audit VALUES
    (OLD.vendor_id, OLD.invoice_number, OLD.invoice_total, 
    'UPDATED', NOW());
END//
DELIMITER ;

UPDATE Invoices
SET invoice_number = 1001-1001
WHERE invoice_id = 1;

SELECT * FROM invoices_audit;

-- CH 18 Question 1 -- TESTED (by using workbench...)
-- CH 18 Question 2 -- TESTED

CREATE USER ray@localhost IDENTIFIED BY 'temp';
GRANT USAGE 
ON ap.* 
TO ray@localhost
WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE
ON ap.Vendors
TO ray@localhost
WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE
ON ap.Invoices
TO ray@localhost
WITH GRANT OPTION;

GRANT SELECT, INSERT
ON ap.Invoice_Line_Items
TO ray@localhost
WITH GRANT OPTION;

-- CH 18 Question 3 -- TESTED
SHOW GRANTS FOR ray@localhost;

