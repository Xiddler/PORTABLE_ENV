
# Unix timezones

dir: /usr/share/zoneinfo


->% ls /usr/share/zoneinfo
Africa      Australia  Cuba     Etc      GMT+0      Iceland      Japan              Mexico   Pacific     PST8PDT    Turkey     WET
America     Brazil     EET      Europe   GMT-0      Indian       Kwajalein          MST      Poland      right      tzdata.zi  W-SU
Antarctica  Canada     Egypt    Factory  GMT0       Iran         leapseconds        MST7MDT  Portugal    ROC        UCT        zone1970.tab
Arctic      CET        Eire     GB       Greenwich  iso3166.tab  leap-seconds.list  Navajo   posix       ROK        Universal  zonenow.tab
Asia        Chile      EST      GB-Eire  Hongkong   Israel       Libya              NZ       posixrules  SECURITY   US         zone.tab
Atlantic    CST6CDT    EST5EDT  GMT      HST        Jamaica      MET                NZ-CHAT  PRC         Singapore  UTC        Zulu

examples
->% ls /usr/share/zoneinfo/Europe

Amsterdam  Berlin      Chisinau    Isle_of_Man  Kyiv        Malta      Oslo       Samara      Sofia      Uzhgorod   Warsaw
Andorra    Bratislava  Copenhagen  Istanbul     Lisbon      Mariehamn  Paris      San_Marino  Stockholm  Vaduz      Zagreb
Astrakhan  Brussels    Dublin      Jersey       Ljubljana   Minsk      Podgorica  Sarajevo    Tallinn    Vatican    Zaporozhye
Athens     Bucharest   Gibraltar   Kaliningrad  London      Monaco     Prague     Saratov     Tirane     Vienna     Zurich
Belfast    Budapest    Guernsey    Kiev         Luxembourg  Moscow     Riga       Simferopol  Tiraspol   Vilnius
Belgrade   Busingen    Helsinki    Kirov        Madrid      Nicosia    Rome       Skopje      Ulyanovsk  Volgograd

So that a timezone of Europe/Dublin or Europe/London are both valid but Europe/Glasgow is not

->% ls America

Adak            Blanc-Sablon   Coral_Harbour  Ensenada     Hermosillo    Lower_Princes  Monterrey     Phoenix         Santarem       Thule
Anchorage       Boa_Vista      Cordoba        Fortaleza    Indiana       Maceio         Montevideo    Port-au-Prince  Santiago       Thunder_Bay
Anguilla        Bogota         Costa_Rica     Fort_Nelson  Indianapolis  Managua        Montreal      Porto_Acre      Santo_Domingo  Tijuana
Antigua         Boise          Creston        Fort_Wayne   Inuvik        Manaus         Montserrat    Port_of_Spain   Sao_Paulo      Toronto
Araguaina       Buenos_Aires   Cuiaba         Glace_Bay    Iqaluit       Marigot        Nassau        Porto_Velho     Scoresbysund   Tortola
Argentina       Cambridge_Bay  Curacao        Godthab      Jamaica       Martinique     New_York      Puerto_Rico     Shiprock       Vancouver
Aruba           Campo_Grande   Danmarkshavn   Goose_Bay    Jujuy         Matamoros      Nipigon       Punta_Arenas    Sitka          Virgin
Asuncion        Cancun         Dawson         Grand_Turk   Juneau        Mazatlan       Nome          Rainy_River     St_Barthelemy  Whitehorse
Atikokan        Caracas        Dawson_Creek   Grenada      Kentucky      Mendoza        Noronha       Rankin_Inlet    St_Johns       Winnipeg
Atka            Catamarca      Denver         Guadeloupe   Knox_IN       Menominee      North_Dakota  Recife          St_Kitts       Yakutat
Bahia           Cayenne        Detroit        Guatemala    Kralendijk    Merida         Nuuk          Regina          St_Lucia       Yellowknife
Bahia_Banderas  Cayman         Dominica       Guayaquil    La_Paz        Metlakatla     Ojinaga       Resolute        St_Thomas
Barbados        Chicago        Edmonton       Guyana       Lima          Mexico_City    Panama        Rio_Branco      St_Vincent
Belem           Chihuahua      Eirunepe       Halifax      Los_Angeles   Miquelon       Pangnirtung   Rosario         Swift_Current
Belize          Ciudad_Juarez  El_Salvador    Havana       Louisville    Moncton        Paramaribo    Santa_Isabel    Tegucigalpa


America/Chicago is valid


# Unix set time
see zim-wiki/MAJORS/timedatectl

Set timezone to Europe/Dublin
->%  timedatectl set-timezone Europe/Dublin

Enable ntp
->%  sudo timedatectl set-ntp true

Synchronize hardware clock
->%  sudo hwclock --systohc

Check 
->% timedatectl
and
->% date

# TLA Timezones

Name 	Description 	                        Relative to GMT

GMT 	Greenwich Mean Time					    GMT
UTC 	Universal Coordinated Time				GMT

ACT 	Australia Central Time					GMT+9:30
AET 	Australia Eastern Time					GMT+10:00
AGT 	Argentina Standard Time					GMT-3:00
ART 	(Arabic) Egypt Standard Time 	        GMT+2:00
AST 	Alaska Standard Time					GMT-9:00
BET 	Brazil Eastern Time					    GMT-3:00
BST 	Bangladesh Standard Time				GMT+6:00
CAT 	Central African Time					GMT-1:00
CEST    Central European Summer Time            GMT+1:00
CNT 	Canada Newfoundland Time				GMT-3:30
CST 	Central Standard Time					GMT-6:00
CTT 	China Taiwan Time					    GMT+8:00
EAT 	Eastern African Time					GMT+3:00
ECT 	European Central Time					GMT+1:00
EET 	Eastern European Time					GMT+2:00
EST 	Eastern Standard Time					GMT-5:00
HST 	Hawaii Standard Time					GMT-10:00
IET 	Indiana Eastern Standard Time 	        GMT-5:00
IST 	India Standard Time					    GMT+5:30
JST 	Japan Standard Time					    GMT+9:00
MET 	Middle East Time					    GMT+3:30
MIT 	Midway Islands Time					    GMT-11:00
MST 	Mountain Standard Time					GMT-7:00
NET 	Near East Time					        GMT+4:00
NST 	New Zealand Standard Time				GMT+12:00
PLT 	Pakistan Lahore Time					GMT+5:00
PNT 	Phoenix Standard Time					GMT-7:00
PRT 	Puerto Rico and US Virgin Islands Time 	GMT-4:00
PST 	Pacific Standard Time					GMT-8:00
SST 	Solomon Standard Time					GMT+11:00
VST 	Vietnam Standard Time					GMT+7:00

# using nushell

--> date now | date to-timezone "America/Los_Angeles"
Tue, 25 Jun 2024 10:54:34 -0700 (now)

--> date now
Tue, 25 Jun 2024 18:54:58 +0100 (now)
