


/* Transakcje - zgrupwoanie wielu poleceń, jesli jedno będzie miało błąd to cofane są wszystkie wczesniejsze operacje od rozpoczętej transakcji */
START TRANSACTION;
INSERT INTO employees ( `name`, `surname`, `email`, `profession`, `department`, `salary`, `age`, `city`, `country` ) 
VALUES ( 'Gargamel', 'Nowak', 'gargamel@example.com', 'programmer', 'IT', 7000, 25, NULL, 'Polska' );

UPDATE employees SET salary = 7555 WHERE name = 'Gargamel';
COMMIT;

