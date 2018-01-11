# JSONFormatter
a simple `jason to model code` MacOS tool

## json sample

```
{
"FixedTelephone" : null,
"IsSelect" : false,
"UserId" : 5651,
"Price" : 2.3,
"UnitName" :"haha",
"status" : 0,
"isMale":1
}
```
## converted to
```
var status:Bool?
var UserId:Int?
var UnitName:String?
var isMale:Bool?
var IsSelect:Bool?
var Price:Double?
var FixedTelephone:AnyObject?

```
## notice
<ul>
	<li>if value is <code>null</code>,it will be converted to AnyObject type</li>
	<li>if value is <code>0 or 1</code>,it default converted to Bool type </li>
</ul>
