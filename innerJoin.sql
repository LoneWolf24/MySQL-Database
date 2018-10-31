############################################################################################
SELECT
    customer.fname,
    customer.lname,
    animal.name,
    animal.species
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    animal.species LIKE 'horse';
############################################################################################

############################################################################################
SELECT
    customer.fname,
    customer.lname,
    animal.name,
    animal.species
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    animal.species LIKE 'horse' AND animal.name LIKE 'c%';
############################################################################################

####################################### Order By ###########################################
SELECT
    customer.fname,
    customer.lname,
    animal.name,
    animal.species,
    animal.yearborn
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    animal.species LIKE 'dog' AND animal.yearborn > 2012
ORDER BY
    animal.yearborn
DESC
    ;
############################################################################################

#################################### Aliases ###############################################
SELECT
    customer.fname AS 'Customer First Name',
    customer.lname AS 'Customer Last Name',
    animal.name AS 'Animal Name',
    animal.species,
    animal.yearborn,
    animal.gender
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    animal.species LIKE 'dog' AND animal.yearborn > 2012
ORDER BY
    animal.yearborn
DESC
    ;
############################################################################################


############################### Class Challange #1 #########################################
### Find customer whose last name ends with son and order them alphabatically ##############

SELECT
    customer.fname,
    customer.lname,
    animal.name,
    animal.species,
    animal.gender,
    animal.yearborn
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    customer.lname LIKE '%son'
ORDER BY
    customer.lname;
############################################################################################

############################### Class Challange #2 #########################################
################# Find customer who lives in idaho and has female cats #####################

SELECT
    customer.fname,
    customer.lname,
    customer.state,
    animal.name,
    animal.species,
    animal.gender,
    animal.yearborn
FROM
    customer
INNER JOIN
    animal
ON
    customer.IDcustomer = animal.IDcustomer
WHERE
    customer.state LIKE 'id' AND animal.species LIKE 'cat' AND animal.gender LIKE 'f' OR animal.species LIKE 'dog' AND animal.gender LIKE 'f' AND customer.state LIKE 'id'
ORDER BY animal.species, animal.yearborn ASC;
## ASC - A's would be in last position and Z's would be first position
## DESC - alphabatically sorts, also default
############################################################################################




var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "toor",
  database: "B2VetOffice"
});

con.connect(function(err) {
  if (err) throw err;
  var sql = "
        SELECT
        customer.fname,
        customer.lname,
        customer.state,
        animal.name,
        animal.species,
        animal.gender,
        animal.yearborn
        FROM
            customer
        INNER JOIN
            animal
        ON
            customer.IDcustomer = animal.IDcustomer
        WHERE
            customer.state LIKE 'id' AND animal.species LIKE 'cat' AND animal.gender LIKE 'f' OR animal.species LIKE 'dog' AND animal.gender LIKE 'f' AND customer.state LIKE 'id'
        ORDER BY animal.species, animal.yearborn ASC
  ";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result);
  });
});

########################################################################################################
################################################ THREE TABLE JOIN ######################################
### Example from w3schools
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

### My custom  version of the W3school example above
SELECT customer.fname, animal.species, animal.gender, animal.name, diagnosis.evaluation
FROM ((customer
INNER JOIN animal ON customer.IDcustomer = animal.IDcustomer)
INNER JOIN diagnosis ON animal.IDanimal = diagnosis.IDanimal) 
WHERE animal.species LIKE 'dog' AND animal.gender LIKE 'f' AND diagnosis.evaluation LIKE '%Rabies%';

