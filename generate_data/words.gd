
[General]
Version=1

[Preferences]
Username=
Password=2559
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=KENIGSBU
Name=CUSTOMERSERVICEWORDS
Count=5

[Record]
Name=WORD_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=WORD
Type=VARCHAR2
Size=50
Data=SQL(select dbms_random.string('A', 1) str from dual)
Master=

