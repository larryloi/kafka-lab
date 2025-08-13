

### Sample records
```shell
echo -e "yyyymm,currency,unit_per_usd,usd_per_unit,mop_per_unit,unit_per_mop\n202505,HKD,7.76672174,0.12875445,1.03000000,0.97087379\n202505,MOP,7.99972339,0.12500432,," > ./input/exrate01.csv

echo -e "yyyymm,currency,unit_per_usd,usd_per_unit,mop_per_unit,unit_per_mop\n202505,HKD,7.76672174,0.12875445,1.03000000,0.97087379\n202505,MOP,7.99972339,0.12500432,11.0992,12.01001" > ./input/exrate01.csv

echo -e "yyyymm,currency,unit_per_usd,usd_per_unit,mop_per_unit,unit_per_mop\n202505,CAD,7.76672174,0.12875445,1.03000000,0.97087379\n202505,EUR,7.99972339,0.12500432,1.000,1.000"> ./input/exrate03.csv

echo -e "yyyymm,currency,unit_per_usd,usd_per_unit,mop_per_unit,unit_per_mop\n202405,CAD,7.76672174,0.12875445,1.03000000,0.97087379\n202405,EUR,7.99972339,0.12500432,1.000,1.000"> ./input/exrate202405.csv

echo -e "yyyymm,currency,unit_per_usd,usd_per_unit,mop_per_unit,unit_per_mop\n202405,HKD,7.76672174,0.12875445,1.03000000,0.97087379\n202405,MOP,7.99972339,0.12500432,11.0992,12.01001" > ./input/exrate202405.csv
```


### Destination table.
```sql

CREATE TABLE dwh.dbo.exrate01 (
  yyyymm VARCHAR(6) NOT NULL,
  currency VARCHAR(10) NOT NULL,
  unit_per_usd DECIMAL(20,10),
  usd_per_unit DECIMAL(20,10),
  mop_per_unit DECIMAL(20,10),
  unit_per_mop DECIMAL(20,10),
   PRIMARY KEY (yyyymm, currency)
);

```