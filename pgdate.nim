#[
template genType(name, fieldname: untyped, fieldtype: typedesc) =
  type
    name = object
      fieldname: fieldtype

genType(Test, foo, int)

var x = Test(foo: 4566)
echo(x.foo) 
]#

import date
import wrpgsql




var ndate : Date 
var ntime : Temps

ndate = newDate(true)
ntime  = newTemps(true)


echo $ndate
echo $ntime


ndate:=("2020-03-17")
echo " $ d:",$ndate
echo " sql d:",ndate.sql()
ntime:=("20:10:01")
echo " $ h:",$ntime
echo " sql h:",ntime.sql()
ndate:=("0001-01-01")
echo " $ d:",$ndate
echo " sql d:",ndate.sql()
ntime:=("00:00:00")
echo " $ h:",$ntime
echo " sql h:",ntime.sql()