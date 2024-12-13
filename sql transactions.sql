SET autocommit = 0;

START TRANSACTION;

update productdb.City
set cityName = 'AA'
where cityId = 1;

COMMIT;

ROLLBACK;

SET autocommit = 1