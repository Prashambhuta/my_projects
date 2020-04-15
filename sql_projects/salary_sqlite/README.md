# SQLite Practice
## Database
Salary details of employees of SF.

## Install SQLite
### Ubuntu 18.04
```bash
sudo apt-get install sqlite3
```
**Installing GUI**
```bash
sudo snap install dbeaver-ce
```

## Running sqlite3 and accessing the database
**To launch sqlite3**
```
sqlite3
```
**To see list of database**
```sqlite
sqlite> .databases
```
**To connect**
```sqlite
sqlite> .open database_name.sqlite
```
**To see database info**
```sqlite
sqlite> .dbinfo
```
## To access tables
**To view list of tables**
```sqlite
sqlite> .tables
```
**To view column headers**
```sqlite
sqlite> pragma table_info(Salaries);
```
```sqlite
cid         name        type        notnull     dflt_value  pk        
----------  ----------  ----------  ----------  ----------  ----------
0           Id          INTEGER     0                       1         
1           EmployeeNa  TEXT        0                       0         
2           JobTitle    TEXT        0                       0         
3           BasePay     NUMERIC     0                       0         
4           OvertimePa  NUMERIC     0                       0         
5           OtherPay    NUMERIC     0                       0         
6           Benefits    NUMERIC     0                       0         
7           TotalPay    NUMERIC     0                       0         
8           TotalPayBe  NUMERIC     0                       0         
9           Year        INTEGER     0                       0         
10          Notes       TEXT        0                       0         
11          Agency      TEXT        0                       0         
12          Status      TEXT        0                       0  
```

**To get first 5 entries (head) of the table**
```sqlite
sqlite> select * from Salaries where id BETWEEN 1 and 5;
```
```sqlite
Id          EmployeeName    JobTitle                                        BasePay     OvertimePay  OtherPay    Benefits    TotalPay    TotalPayBenefits  Year        Notes       Agency         Status    
----------  --------------  ----------------------------------------------  ----------  -----------  ----------  ----------  ----------  ----------------  ----------  ----------  -------------  ----------
1           NATHANIEL FORD  GENERAL MANAGER-METROPOLITAN TRANSIT AUTHORITY  167411.18   0            400184.25               567595.43   567595.43         2011                    San Francisco            
2           GARY JIMENEZ    CAPTAIN III (POLICE DEPARTMENT)                 155966.02   245131.88    137811.38               538909.28   538909.28         2011                    San Francisco            
3           ALBERT PARDINI  CAPTAIN III (POLICE DEPARTMENT)                 212739.13   106088.18    16452.6                 335279.91   335279.91         2011                    San Francisco            
4           CHRISTOPHER CH  WIRE ROPE CABLE MAINTENANCE MECHANIC            77916       56120.71     198306.9                332343.61   332343.61         2011                    San Francisco            
5           PATRICK GARDNE  DEPUTY CHIEF OF DEPARTMENT,(FIRE DEPARTMENT)    134401.6    9737         182234.59               326373.19   326373.19         2011                    San Francisco            
```

## Min and Max of salaries
**To get the max value of salary**
```sqlite
sqlite> select Id, EmployeeName, BasePay, TotalPay, TotalPayBenefits from Salaries where TotalPay == (SELECT MAX(TotalPay) from Salaries);
```
```sqlite
Id          EmployeeName    BasePay     TotalPay    TotalPayBenefits
----------  --------------  ----------  ----------  ----------------
1           NATHANIEL FORD  167411.18   567595.43   567595.43      
```
**To get the min value of salary**
```sqlite
sqlite> select Id, EmployeeName, BasePay, TotalPay from Salaries where TotalPay == (SELECT MIN(TotalPay) from Salaries);
```
```sqlite
Id          EmployeeName  BasePay     TotalPay  
----------  ------------  ----------  ----------
148654      Joe Lopez     0           -618.13   
```

## Mean Salary
