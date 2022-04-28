
[General]
Version=1

[Preferences]
Username=
Password=2165
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=YULIS
Name=MAINTENANCE
Count=20000

[Record]
Name=CHECKING_DATE
Type=DATE
Size=
Data=Random(25-04-2017, 28-04-2022)
Master=

[Record]
Name=MAINTENANCE_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=FACILITY_ID
Type=NUMBER
Size=
Data=Random(1, 2000)
Master=

[Record]
Name=EMPLOYEE_ID
Type=NUMBER
Size=
Data=Random(1, 1000)
Master=

