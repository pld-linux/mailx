.\" {PTM/AB/0.2/12-12-1998/"mail - wysy³anie i odbieranie poczty"}
.\" translated by Adam Byrtek <alpha@irc.pl>
.\" ------------
.\"	$OpenBSD: mail.1,v 1.5 1994/06/29 05:09:32 deraadt Exp $
.\" Copyright (c) 1980, 1990, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	from: @(#)mail.1	8.2 (Berkeley) 12/30/93
.\" ------------
.Dd 30 grudnia 1993
.Dt MAIL 1
.Os BSD 4
.Sh NAZWA
.Nm mail
.Nd wysy³anie i odbieranie poczty
.Sh SK£ADNIA
.Nm mail
.Op Fl iInv
.Op Fl s Ar temat
.Op Fl c Ar adres-cc
.Op Fl b Ar adres-bcc
.Ar adres-docelowy...
.Nm mail
.Op Fl iInNv
.Fl f
.Op Ar plik
.Nm mail
.Op Fl iInNv
.Op Fl u Ar u¿ytkownik
.Sh WPROWADZENIE
.Nm Mail
to inteligentny system przetwarzania poczty, który korzysta
ze sk³adni linii poleceñ przypominaj±cej
.Xr \&ed 1 ,
operuj±c jednak na wiadomo¶ciach, a nie na liniach tekstu.
.Pp
.Bl -tag -width flag
.It Fl v
Tryb verbose.
Szczegó³owe informacje dotycz±ce wysy³ki s±
wy¶wietlane na terminalu u¿ytkownika.
.It Fl i
Ignoruj sygna³y przerwania od tty.
Ta opcja jest bardzo u¿yteczna podczas korzystania z
.Nm mail
poprzez linie telefoniczne z du¿± liczb± zak³óceñ.
.It Fl I
Zmusza mail do pracy w trybie interaktywnym, nawet
je¶li wej¶ciem nie jest terminal.
W szczególno¶ci znak specjalny 
.Sq Ic \&~
podczas wysy³ania poczty jest aktywny tylko w trybie
interaktywnym.
.It Fl n
Zakazuje czytania
.Pa /etc/mail.rc
po uruchomieniu programu.
.It Fl N
Zakazuje wy¶wietlania na pocz±tku nag³ówków wiadomo¶ci
w czasie czytania poczty czy edycji foldera pocztowego.
.It Fl s
Ustala temat z poziomu linii poleceñ
(tylko pierwszy argument po opcji
.Fl s
jest uznawany za temat; pamiêtaj, aby obj±æ cudzys³owani
tematy zawieraj±ce spacje).
.It Fl c
Wysy³a kopie do
.Ar listy
u¿ytkowników.
.It Fl b
Wysy³a ukryte kopie do
.Ar listy .
Lista to adresy oddzielone przecinkami.
.It Fl f
Czyta zawarto¶æ twojego pliku 
.Ar mbox
(lub innego podanego pliku) do obróbki. Gdy wyjdziesz,
.Nm mail
zapisuje nieskasowane wiadomo¶ci z powrotem do tego pliku.
.It Fl u
Równowa¿na z:
.Pp
.Dl mail -f /var/spool/mail/u¿ytkownik
.El
.Ss Wysy³anie poczty
Aby wys³aæ pocztê do jednej lub kilku osób, 
.Nm mail
mo¿e zostaæ wywo³any z adresami docelowymi jako parametrami.
Program nastêpnie spodziewa siê, ¿e wpiszesz swoj± wiadomo¶æ,
zakoñczon±
.Sq Li control\-D
na pocz±tku nowej linii.
Sekcja
.Ar Odpowiadanie na listy
po³o¿ona poni¿ej, opisuje pewne cechy 
.Nm mail
u³atwiaj±ce tworzenie listu.
.Pp
.Ss Czytanie poczty
Standardowe polecenie
.Nm mail
bez ¿adnych parametrów sprawdza twoj± pocztê, a nastêpnie
wypisuje nag³ówek ka¿dej znalezionej wiadomo¶ci.
Pocz±tkowo aktywna jest pierwsza widadomo¶æ (nr 1) i mo¿e
ona zostaæ pokazana za pomoc± polecenia
.Ic print
(które mo¿e zostaæ skrócone do
.Ql Ic p ) .
Mo¿esz poruszaæ siê po wiadomo¶ciach tak, jak poruszasz siê
pomiêdzy liniami w programie
.Xr \&ed 1 ,
za pomoc± poleceñ
.Ql Ic \&+
i
.Ql Ic \&\-
wybieraj±cych poprzedni± i nastêpn± wiadomo¶æ, oraz
numerów wiadomo¶ci.
.Pp
.Ss Kasowanie poczty
Po obejrzeniu wiadomo¶ci mo¿esz j± skasowaæ
za pomoc± polecenia
.Ic delete
.Ql Ic d
lub odpowiedzieæ na ni± u¿ywaj±c
.Ic reply
.Ql Ic r .
Skasowanie powoduje, ¿e program
.Nm mail
zapomina o tej wiadomo¶ci.
Proces ten nie jest nieodwracalny, taka wiadomo¶æ
mo¿e zostaæ odzyskana poleceniem
.Ic undeleted
.Ql Ic u
podaj±c jej numer, lub przez przerwanie pracy programu
.Nm mail
za pomoc± polecenia
.Ic exit
.Ql Ic x .
Najczê¶ciej jednak skasowane wiadomo¶ci po prostu znikn±,
aby ju¿ ich nigdy nie obejrzeæ.
.Pp
.Ss Wyszczególnianie wiadomo¶ci
Komendy takie jak
.Ic print
czy
.Ic delete
mog± zawieraæ jako argument listê numerów wiadomo¶ci, których
dotyczy dana komenda.
Tak wiêc
.Dq Li delete 1 2
kasuje wiadomo¶ci 1 i 2, podczas gdy
.Dq Li delete 1\-5
kasuje wiadomo¶ci od 1 do 5.
Specjalny znak
.Ql Li \&*
dotyczy wszystkich wiadomo¶ci, a
.Ql Li \&$
wskazuje na ostatni± wiadomo¶æ. Tak wiêc polecenie
.Ic top
które wy¶wietla kilka pierwszych linii widomo¶ci mo¿e
zostaæ u¿yte jako
.Dq Li top \&*
aby wy¶wietliæ pierwsze kilka linii wszystkich wiadomo¶ci.
.Pp
.Ss Odpowiadanie na listy
Mo¿esz u¿yæ komendy
.Ic reply
aby odpowiedzieæ na wiadomo¶æ, odsy³aj±c j± z powrotem
do nadawcy. Tekst który nastêpnie wpiszesz, a¿ do znaku
koñca pliku, bêdzie traktowany jako zawarto¶æ wiadomo¶ci.
Podczas wpisywania wiadomo¶ci
.Nm mail
traktuje specjalnie linie zaczynaj±ce siê znakiem
.Ql Ic \&~ .
Na przyk³ad wpisanie
.Ql Ic \&~m
(samego w linii) umie¶ci kopiê wiadomo¶ci na któr± odpowiadasz
przesuwaj±c j± o tabulator w prawo.
(patrz zmienna
.Em indentprefix
poni¿ej).
Pozosta³e opcje ustawiaj± pole tematu, dodaj± lub usuwaj± adresatów
wiadomo¶ci czy pozwalaj± ci wywo³aæ edytor lub pow³okê, aby
wykonaæ jakie¶ polecenia.
(Te opcje s± podane w podsumowaniu poni¿ej).
.Pp
.Ss Zakañczanie sesji
Mo¿esz zakoñczyæ pracê z programem
.Nm mail
za pomoc± polecenia
.Ic quit
.Ql Ic q .
Przegl±dniête wiadomo¶ci s± umieszczane w pliku
.Ar mbox
chyba ¿e zosta³y usuniête, w takim razie zostaj± skasowane.
Nieprzeczytane wiadomo¶ci wracaj± do skrzynki pocztowej.
(Patrz opcja
.Fl f
powy¿ej).
.Pp
.Ss Osobiste i systemowe listy dystrybucyjne
Mo¿liwe jest tak¿e tworzenie osobistych list dystrybucyjnych,
tak, aby poczta wys³ana do na przyk³ad pod adres
.Dq Li cohorts
trafi³a do grupy ludzi
Takie listy definiuje siê przez dodanie lini takiej jak
.Pp
.Dl alias cohorts bill ozalp jkf mark kridle@ucbcory
.Pp
do pliku
.Pa \&.mailrc
w twoim katalogu domowym.
Aktualna lista takich aliasów mo¿e byæ wy¶wietlona poleceniem
.Ic alias
w programie
.Nm mail .
Systemowe listy dystrybucyjne tworzy siê przez edycjê pliku
.Pa /etc/aliases ,
patrz tak¿e
.Xr aliases 5
i
.Xr sendmail 8 .
Maj± one nieco odmienn± sk³adniê.
W wysy³anej poczcie, aliasy osobiste zostan± rozszerzone,
tak, aby mo¿na by³o odpowiedzieæ nadawcy.
Systemowe
.Ic aliasy
nie s± rozszerzane podczas wysy³ania poczty, ale
ka¿da odpowiedz która powróci do tego komputera
zostanie rozszerzona podczas przechodzenia przez program
.Xr sendmail .
.Pp
.Ss Poczta sieciowa (ARPA, UUCP, Berknet)
Opisu adresów sieciowych szukaj w
.Xr mailaddr 7 .
.Pp
.Nm Mail
posiada wiele opcji, które mog± byæ ustawione w pliku
.Pa .mailrc
aby wp³yn±æ na zachowanie programów, tak wiêc
.Dq Li set askcc
uaktywnia opcjê
.Ar askcc .
(Podsumowanie tych opcji znajduje siê poni¿ej.)
.Sh SUMMARY
(Zaadaptowane z `Mail Reference Manual')
.Pp
Ka¿de polecenie jest wpisywane w osobnej linii i mo¿e
posiadaæ argumenty. Komenda nie musi zostaæ podana w ca³o¶ci,
u¿ywana pierwsza komenda pasuj±ca do podanego przedrostka.
Je¶li nie podano ¿adnego argumentu dla komend, które wymagaj±
listy wiadomo¶ci jako argumentu, to domy¶lnie przyjmowana
jest nastêpna wiadomo¶æ która spe³niaj±ca warunki komendy.
Je¶li nie istniej± ¿adne nastêpne wiadomo¶ci, to przeszukiwanie
odbywa siê w przeciwnym kierunku, a je¶li nie istnieje ¿adna
pasuj±ca wiadomo¶æ,
.Nm mail
wy¶wietla komunikat
.Dq Li No applicable messages
i przerywa wykonywanie polecenia.
.Bl -tag -width delete
.It Ic \&\-
Wy¶wietla poprzedni± wiadomo¶æ. Je¶li podano liczbowy argument
.Ar n ,
to wy¶wietla wiadomo¶æ odleg³± o
.Ar n
do ty³u w stosunku do aktualnej.
.It Ic \&?
Wy¶wietla ma³e podsumowanie komend.
.It Ic \&!
Wywo³uje komendê pow³oki
(patrz tak¿e
.Xr sh 1
i
.Xr csh 1 )
podan± jako argument.
.It Ic Print
.Pq Ic P
To samo co
.Ic print ,
ale dodatkowo wy¶wietla ignorowane pola nag³ówka.
Patrz tak¿e
.Ic print ,
.Ic ignore
i
.Ic retain .
.It Ic Reply
.Pq Ic R
Wysy³a odpowied¼ nadawcy. Nie wysy³± odpowiedzi
pozosta³ym adresatom.
.It Ic Type
.Pq Ic T
To samo co komenda
.Ic Print .
.It Ic alias
.Pq Ic a
Je¶li bez argumentów, wy¶wietla wszystkie zdefiniowane aliasy.
Je¶li jeden argument, wy¶wietla tylko ten alias.
Je¶li wiêcej argumentów, tworzy nowy alias lub zmienia stary.
.It Ic alternates
.Pq Ic alt
Komenda
.Ic alternates
jest u¿yteczna, je¶li posiadasz konta na kilku komputerach.
Mo¿e byæ ona u¿ywana do poinformowania programu
.Nm mail ,
¿e podany adres jest faktycznie twój.
Gdy odpowiadasz na wiadomo¶ci,
.Nm mail
nie wy¶le kopii listu na inne adresy podane w li¶cie
.Ic alternates .
Je¶li komenda
.Ic alternates
zosta³a wywo³ana bez argumentów, wy¶wietla aktualn± listê
adresów alternatywnych.
.It Ic chdir
.Pq Ic c
Zmienia aktualny katalog na podany. Je¶li nie podano katalogu,
to przechodzi do katalogu domowego u¿ytkownika.
.It Ic copy
.Pq Ic co
Komenda
.Ic copy
robi to samo, co
.Ic save ,
z wyj±tkiem tego, ¿e nie zaznacza zapisywanej wiadomo¶ci
jako usuniêtej.
.It Ic delete
.Pq Ic d
Zaznaczas wiadomo¶ci podane w argumencie jako usuniête.
Usuniête wiadomo¶ci nie zostan± zapisane w
.Ar mbox ,
ani nie bêd± dostêpne dla wiêkszo¶ci innych komend.
.It Ic dp
(tak¿e
.Ic dt )
Kasuje aktualn± wiadomo¶æ i wy¶wietla kolejn±. Je¶li nie
ma kolejnej wiadomo¶ci,
.Nm mail
wy¶wietli komunikat
.Dq Li "at EOF" .
.It Ic edit
.Pq Ic e
Wywo³uje edytor tekstowy po kolei dla ka¿dej wiadomo¶ci podanej
jako parametr. Po powrocie z wiadomo¶æ jest ponownie odczytywana.
.It Ic exit
.Pf ( Ic ex
lub
.Ic x )
Powoduje natychmiastowy powrót do pow³oki bez modyfikacji
skrzynki pocztowej, pliku
.Ar mbox
lub pliku podanego za pomoc± parametru
.Fl f  .
.It Ic file
.Pq Ic fi
To samo co
.Ic folder  .
.It Ic folders
Wy¶wietla nazwy folderów pocztowych.
.It Ic folder
.Pq Ic fo
Komenda
.Ic folder
prze³±cza program na nowy plik lub folder pocztowy.
Gdy bez argumentów, wy¶wietla nazwê pliku, z którego
aktualnie korzystamy. Je¶li podasz argument, program zapisze
wszystkie zmiany (takie jak skasowane wiadomo¶ci) których
dokona³e¶ w aktualnym pliku i odczyta nowy plik.
Wystêpuj± pewne specjalne znaki, oznaczaj±ce pewne pliki.
# oznacza poprzedni plik, % systemow± skrzynkê pocztow±,
%u¿ytkownik oznacza systemow± skrzynkê pocztow± dla danego
u¿ytkownika, & oznacza twój plik
.Ar mbox
a
\&+\&folder oznacza plik w twoim katalogu folderów.
.It Ic from
.Pq Ic f
Wypisuje nag³ówki podanych wiadomo¶ci.
.It Ic headers
.Pq Ic h
Wy¶wietla nag³ówki 18 wiadomo¶ci, je¶li podano argument
.Ql \&+ ,
to wy¶wietlane jest nastêpne 18 nag³ówków, a je¶li podano argument
.Ql \&\- ,
to 18 poprzednich.
.It Ic help
To samo co
.Ic \&?
.It Ic hold
.Pf ( Ic ho ,
tak¿e
.Ic preserve )
Zaznacza podane wiadomo¶ci do pozostawienia w systemowej
skrzynce pocztowej, zawiast przeniesienia do
.Ar mbox .
Nie anuluje komendy
.Ic delete .
.It Ic ignore
Dodaje listê pól nag³ówka do
.Ar listy ignorowania .
Pola nag³ówka na li¶cie ignorowania nie zostan±
pokazane na terminalu gdy wy¶wietlisz wiadomo¶æ.
Ta komenda jest bardzo u¿yteczna do ignorowania pewnych
pól nag³ówka generowanych przez komputer.
Komendy
.Ic Type
oraz
.Ic Print
mog± zostaæ u¿yte do wy¶wietlenia wiadomo¶ci w ca³o¶ci,
w³±czaj±c w to pola ignorowane.
Je¶li 
.Ic ignore
zostanie wywo³any bez parametrów,
to wy¶wietla aktualn± listê ignorowanych pól.
.It Ic mail
.Pq Ic m
Wysy³a list do adresów i list dystrybucyjnych podanych
w argumencie.
.It Ic mbox
Zaznacza wiadomo¶ci, które zostan± przeniesione do
.Ic mbox
gdy zakoñczysz pracê. Dzieje siê tak z wiadomo¶ciami,
którym
.Em nie
maj± ustawionej opcji
.Ic hold .
.It Ic next
.Pq Ic n
Podobne do
.Ic \&+
i
.Tn CR .
Przechodzi do nastêpnej wiadomo¶ci i wy¶wietla j±. Gdy podano
argument, przechodzi do nastêpnej pasuj±cej wiadomo¶ci.
.It Ic preserve
.Pq Ic pre
To samo, co
.Ic hold .
.It Ic print
.Pq Ic p
Wy¶wietla na terminalu ka¿d± podan± w argumencie wiadomo¶æ.
.It Ic quit
.Pq Ic q
Koñczy pracê, zapisuje wszystkie nieskasowane, niezapisane
wiadomo¶ci w pliku
.Ar mbox
w katalogu domowym u¿ytkownika, pozostawiaj±c wszystkie
wiadomo¶ci zaznaczone poleceniem
.Ic hold
czy
.Ic preserve
lub do których nigdy siê nie odwo³ywano w systemowej
skrzynce pocztowej i usuwa wszystkie pozosta³e wiadomo¶ci
z systemowej skrzynki pocztowej. Je¶li podczas tej sesji
pojawi³a siê nowa poczta, to zostanie wy¶wietlony komunikat
.Dq Li "You have new mail" .
Je¶li uruchomiono program z opcj±
.Fl f ,
to edytowany plik zostanie ponownie zapisany.
Program zwraca kontrolê do pow³oki, chyba ¿e zapis edytowanego
pliku nie powiedzie siê, w tej sytuacji u¿ytkownik mo¿e
wyj¶æ za pomoc± komendy
.Ic exit .
.It Ic reply
.Pq Ic r
Wysy³a odpowiedzi do nadwcy i wszystkich adresatów podanych
wiadomo¶ci. Wiadomo¶æ nie mo¿e byæ skasowana.
.It Ic respond
To samo, co
.Ic reply  .
.It Ic retain
Dodaje podane pola nag³ówka do
.Ar listy zatrzymanych
Podczas wy¶wietlania wiadomo¶ci na terminalu
zostan± pokazane tylko pola nag³ówka znajduj±ce siê
na li¶cie zatrzymanych. Wszystkie inne pola zostaj± ukryte.
Komendy
.Ic Type
i
.Ic Print
mog± zostaæ u¿yte do wy¶wietlenia ca³ej wiadomo¶ci.
Je¶li
.Ic retain
zostanie wywo³ane bez argumentów, to wy¶wietla aktualn±
listê zatrzymanych pól.
.It Ic save
.Pq Ic s
Dopisuje podane wiadomo¶ci na koniec podanego jako drugi
argument pliku. Nazwa pliku, ilo¶æ linii oraz liczba znaków
jest wy¶wietlana na terminalu.
.It Ic set
.Pq Ic se
Gdy bez argumentów, wy¶wietla warto¶ci wszystkich zmiennych.
W innym przypadku ustawia opcje. Argumenty s± w postaci
.Ar opcja=warto¶æ
(bez spacji przed lub za =) lub
.Ar opcja .
Argument mo¿e zostaæ ujêty w cudzys³owy, aby zamaskowaæ
spacje, tabulatory, np.
.Dq Li "set indentprefix=\*q->\*q"
.It Ic saveignore
Powoduje, ¿e podane wiadomo¶ci zapisywane za pomoc±
.Ic save
lub podczas automatycznego zapisu do
.Ar mbox
nie bêd± zawiera³y pól nag³ówka z listy pól ignorowanych.
.It Ic saveretain
Powoduje, ¿e w czasie zapisu podanych wiadomo¶ci za pomoc±
.Ic save
lub podczas automatycznego zapisu do
.Ar mbox
do³±czane s± jedynie pola nag³ówka znajduj±ce siê na
li¶cie zatrzymanych pól. Wywo³anie
.Ic Saveretain
automatycznie anuluje
.Ic saveignore .
.It Ic shell
.Pq Ic sh
Wywo³uje interaktywn± wersjê pow³oki.
.It Ic size
Wy¶wietla ilo¶æ znaków dla ka¿dej z podanych wiadomo¶ci.
.It Ic source
£aduje komendy z pliku.
.It Ic top
Wy¶wietla kilka pierwszych linii podanych wiadomo¶ci.
Ilo¶æ wy¶wietlanych linii zale¿y od zmiennej
.Ic toplines ,
warto¶ci± domy¶ln± jest piêæ.
.It Ic type
.Pq Ic t
To samo co
.Ic print  .
.It Ic unalias
Usuwa grupy adresów zdefiniowane przez komendê
.Ic alias .
Od teraz nazwa grupy nie ma ju¿ ¿adnego szczególnego znaczenia.
.It Ic undelete
.Pq Ic u
Zaznacza podane wiadomo¶ci jako
.Ic nie
usuniête.
.It Ic unread
.Pq Ic U
Zaznacza podane wiadomo¶ci jako
.Ic nie
przeczytane.
.It Ic unset
Wy³±cza podane opcji, przeciwieñstwo komendy
.Ic set .
.It Ic visual
.Pq Ic v
Wywo³uje pe³noekranowy edytor dla ka¿dej podanej wiadomo¶ci.
.It Ic write
.Pq Ic w
Podobne do
.Ic save ,
jednak zapisywana jest
.Ic tylko
sama tre¶æ wiadomo¶ci
.Pq Ar bez
nag³ówka). U¿yteczne w celach takich, jak na przyk³ad 
przesy³anie kodów ¼ród³owych poprzez pocztê.
.It Ic xit
.Pq Ic x
To samo, co
.Ic exit .
.It Ic z
.Nm Mail
wy¶wietla nag³ówki wiadomo¶ci tak, jak to
opisano przy poleceniu
.Ic headers .
Mo¿esz przenie¶æ siê do nastêpnego ekranu za pomoc± polecenia
.Ic \&z .
Mo¿esz tak¿e przenie¶æ siê do poprzedniego ekrazu u¿ywaj±c
.Ic \&z\&\- .
.El
.Ss Komendy z tyld±
.Pp
Poni¿ej znajduje siê podsumowanie komend z tyld±, które
u¿ywane s± podczas pisania wiadomo¶ci. Komendy z tyld± s±
rozpoznawane tylko wtedy, gdy znajduj± siê na pocz±tku linii.
The name
.Dq Em tilde\ escape
is somewhat of a misnomer since the actual escape
character can be set by the option
.Ic escape .
.Bl -tag -width Ds
.It Ic \&~! Ns Ar komenda
Wywo³uje podan± komendê pow³oki, a nastêpnie wraca do
edycji wiadomo¶ci.
.It Ic \&~b Ns Ar adres ...
Dodaje podane adresy do listy kopii wiadomo¶ci, ale nie
ujawnia ich w polu Cc: nag³ówka (ukryta kopia).
.It Ic \&~c Ns Ar adres ...
Dodaje podane adresy do listy kopii wiadomo¶ci.
.It Ic \&~d
Do³±cza zawarto¶æ pliku
.Dq Pa dead.letter
z katalogu domowego do edytowanej wiadomo¶ci.
.It Ic \&~e
Wywo³uje edytor tekstowy z napisan± dotychczas wiadomo¶ci±.
Po zakoñczeniu sesji mo¿esz kontynowaæ dodawanie tekstu
do wiadomo¶ci.
.It Ic \&~f Ns Ar wiadomo¶ci
Dodaje podane wiadomo¶ci do edytowanej wiadomo¶ci.
Gdy nie podano argumentu, dodaje aktualn± wiadomo¶æ.
Pola nag³ówka ignorowane (za pomoc± komendy
.Ic ignore
lub
.Ic retain )
nie zostaj± do³±czone.
.It Ic \&~F Ns Ar wiadomo¶ci
To samo, co
.Ic \&~f ,
jednak do³±cza wszystkie nag³ówki wiadomo¶ci.
.It Ic \&~h
Pozwala na edycjê nag³ówka wiadomo¶ci. Wy¶wietla po kolei
zawarto¶æ poszczególnych pól nag³ówka i pozwala na ich modyfikacjê.
.It Ic \&~m Ns Ar wiadomo¶ci
Dodaje podane wiadomo¶ci do edytowanej wiadomo¶ci, przesuniête
o tabulator, lub z dodan± warto¶ci± zmiennej
.Ar indentprefix .
Gdy nie podano argumentów, dodaje aktualn± wiadomo¶æ.
If no messages are specified,
read the current message.
Pola nag³ówka ignorowane (za pomoc± komendy
.Ic ignore
lub
.Ic retain )
nie zostaj± do³±czone.
.It Ic \&~M Ns Ar wiadomo¶ci
To samo, co
Identical to
.Ic \&~m ,
ale do³±czane s± wszystkie pola nag³ówka.
.It Ic \&~p
Wy¶wietla ca³o¶æ edytowanej wiadomo¶ci, poprzedzon±
zawarto¶ci± pól nag³ówka.
.It Ic \&~q
Anuluje edytowan± wiadomo¶æ, a nastêpnie, je¶li w³±czona
jest opcja
.Ic save ,
kopiuje j± do pliku
.Dq Pa dead.letter
w twoim katalogu domowym.
.It Ic \&~r Ns Ar plik
Dodaje zawarto¶æ podanego pliku do edytowanej wiadomo¶ci.
.It Ic \&~s Ns Ar tekst
Zmienia temat wiadomo¶ci na podany tekst.
.It Ic \&~\&t Ns Ar adres ...
Dodaje podane adresy do listy adresatów.
.It Ic \&~\&v
Wywo³uje alternatywny edytor tekstów (okre¶lony przez zmienn±
.Ev VISUAL )
dla edytowanej wiadomo¶ci. Zazwyczaj alternatywnym edytorem
jest edytor ekranowy. Po wyj¶ciu z edytora mo¿esz kontynuowaæ
edycjê wiadomo¶ci.
.It Ic \&~w Ns Ar plik
Zapisuje wiadomo¶æ do podanego pliku.
.It Ic \&~\&| Ns Ar komenda
Wysy³a wiadomo¶æ poprzez strumieñ do podanego polecenia.
Je¶li komenda nie zwróci nic na standardowym wyj¶æiu lub
zakoñczy pracê z b³êdem, oryginalna wiadomo¶æ zostanie
zachowana. Czêsto u¿ywanym poleceniem jest
.Xr fmt 1
s³u¿±cy do wyjustowania wiadomo¶ci.
.It Ic \&~: Ns Ar komenda-mail
Wykonuje podan± komendê programu mail. Nie wszystkie polecenia
s± jednak dozwolone.
.It Ic \&~~ Ns Ar tekst
Dodaje do wiadomo¶ci podany tekst, poprzedzony znakiem ~.
Je¶li znak escape zosta³ zmieniony, powiniene¶ wpisaæ go
dwukrotnie aby zosta³ on dodany do wiadomo¶ci.
.El
.Ss Opcje programu mail
Opcje s± ustawiane poprzez polecenia
.Ic set
oraz
.Ic unset .
Opcje mog± byæ binarne, w tej sytuacji istotne jest tylko
czy s± ustawione czy nie, albo tekstowe, w tej sytuacji istotna
jest warto¶æ danej opcji. Opcje binarne to:
.Bl -tag -width append
.It Ar append
Powoduje, ¿e wiadomo¶ci zapisane w
.Ar mbox
zostan± dopisane na koñcu, zamias zastêpowaæ dotychczasow±
zawarto¶æ pliku. Ta opcja powinna byæ zawsze w³±czona
(najlepiej w pliku
.Pa /etc/mail.rc ) .
.It Ar ask, asksub
Powoduje, ¿e 
.Nm mail
zawsze zapyta o temat wysy³anej wiadomo¶ci. Je¶li podasz
jedynie pust± liniê, nie bêdzie pola tematu.
.It Ar askcc
Powoduje, ¿e pod koniec edycji wiadomo¶ci jeste¶ pytany o
dodatkowych adresatów kopii. Podanie pustej linii oznacza,
¿e dotychczasowa lista kopii jest wystarczaj±ca.
.It Ar askbcc
Powoduje, ¿e pod koniec edycji wiadomo¶ci jeste¶ pytany o
dodatkowych adresatów ukrytych kopii. Podanie pustej linii oznacza,
¿e dotychczasowa lista ukrytych kopii jest wystarczaj±ca.
.It Ar autoprint
Powoduje, ¿e komenda
.Ic delete
zachowuje siê tak jak
.Ic dp .
Oznacza to, ¿e po skasowaniu wiadomo¶ci, zastêpna zostanie
wy¶wietlona automatycznie.
.It Ar debug
Ustawienie opcji
.Ar debug
dzia³a tak samo, jak podanie
.Fl d
w linii poleceñ i powoduje, ¿e
.Nm mail
wy¶wietla wszystkie informacje przydatne przy
debugowaniu programu.
.It Ar dot
Opcja
.Ar dot
powoduje, ¿e
.Nm mail
interpretuje pojedyncz± kropkê w pustej linii jako
koniec edytowanej wiadomo¶ci.
.It Ar hold
Ta opcja powoduje, ¿e wiadomo¶ci zawsze s±
zatrzymywane w skrzynce pocztowej.
.It Ar ignore
Powoduje, ¿e sygna³y przerwania z terminalu zostaj± ignorowane
i wy¶wietlone jako znak @.
.It Ar ignoreeof
Opcja ta jest powi±zana z
.Ar dot
i powoduje, ¿e
.Nm mail
nie uznaje control-d jako koñca wiadomo¶ci
.Ar Ignoreeof
dotyczny tak¿e wiersza poleceñ
.Nm mail .
.It Ar metoo
Zazwyczaj gdy w grupie znajduje siê nadawca, jest on usuwany
z pola adresatów. Ustawienie tej opcji powoduje dodanie
nadawcy do pola adresatów.
.It Ar noheader
Ustawienie opcji
.Ar noheader
powoduje to samo, co wywo³anie programu z parametrem
.Fl N .
.It Ar nosave
Standardowo, gdy przerwiesz edycjê wiadomo¶ci, zostanie
ona zapisana do pliku
.Dq Pa dead.letter
w twoim katalogu domowym. Ustawienie opcji
.Ar nosave
zapobiega temu.
.It Ar Replyall
Zamienia znaczenie komend
.Ic reply
i
.Ic Reply .
.It Ar quiet
Zapobiega wy¶wietlaniu varsji po uruchomieniu programu.
.It Ar searchheaders
Je¶li ta opcja jest ustawiona, to lista wiadomo¶ci podana
w postaci ``/x:y'' zostanie zamieniona na listê wszystkich
wiadomo¶ci zawieraj±cych tekst ``y'' w polu nag³ówka ``x''.
Wielko¶æ liter nie jest istotna.
.It Ar verbose
Ustawienie opcji
.Ar verbose
daje takie same efekty, jak u¿ycie opcji
.Fl v
w linii poleceñ. Gdy mail pracuje w trybie verbose, na
terminalu wy¶wietlane s± szczegó³y dotycz±ce dostarczania
wiadomo¶ci do adresata.
.El
.Ss Opcje tekstowe
.Bl -tag -width Va
.It Ev EDITOR
¦cie¿ka do edytora tekstowego u¿ywanego po wydaniu komendy
.Ic edit
lub
.Ic \&~e .
Je¶li nie zdefiniowana, u¿ywany jest domy¶lny edytor.
.It Ev LISTER
¦cie¿ka do programu wy¶wietlaj±cego katalogi wykorzystywanego
przez komendê
.Ic folders .
Domy¶lna warto¶æ to
.Pa /bin/ls .
.It Ev PAGER
¦cie¿ka do programu u¿ywanego przez komendê
.Ic more
lub gdy ustawiona jest opcja
.Ic crt .
Je¶li opcja nie zosta³a zdefiniowana, u¿ywana jest
domy¶lna przegl±darka
.Xr more 1 .
.It Ev SHELL
¦cie¿ka do pow³oki u¿ywana przez komendê
.Ic \&!
i
.Ic \&~! .
Je¶li opcja nie zosta³a zdefiniowana, u¿ywana
jest domy¶lna pow³oka.
.It Ev VISUAL
¦cie¿ka do edytora tekstów u¿ywanego przez komendê
.Ic visual
i
.Ic \&~v .
.It Va crt
Warto¶æ tej opcji ustala, jak d³uga musi byæ wiadomo¶æ,
aby program
.Ev PAGER
musia³ zostaæ wykorzystany do jej obejrzenia. Je¶li opcja
.Va crt
ma pust± warto¶æ, to u¿yywana jest liczba linii terminala
(patrz te¿
.Xr stty 1 ) .
.It Ar escape
Je¶li zdefiniowana, pierwszy znak tej opcji ustala znak
u¿ywany zamiast ~.
.It Ar folder
Nazwa katalogu, w którym przechowywane s± foldery
wiadomo¶ci. Je¶li nazwa znaczyna siê od `/',
.Nm mail
uznaje j± za ¶cie¿kê absolutn±, w innym przypadku jest
to ¶cie¿ka wzglêdem twojego katalogu domowego.
.It Ev MBOX
Nazwa pliku
.Ar mbox .
Mo¿e to byæ nazwa foldera. Domy¶ln± nazw± jest
.Dq Li mbox
w katalogu domowym u¿ytkownika.
.It Ar record
Je¶li zdefiniowana, oznacza nazwê pliku, do którego zapisywana
jest ka¿da wysy³ana wiadomo¶æ. Je¶li niezdefiniowana, to
wysy³ane wiadomo¶ci nie s± zapisywane.
.It Ar indentprefix
Tekst u¿ywany przez komendê ``~m'' do oznaczania wiadomo¶ci,
zamiast domy¶lnego znaku tabulacji (^I). Pamiêtaj, aby obj±æ
warto¶æ cudzys³owami je¶li zawiera spacje lub tabulatory.
.It Ar toplines
Je¶li zdefiniowana, ustala liczbê linii wy¶wietlanych przez
komendê
.Ic top .
Domy¶lnie wy¶wietlanych jest pierwszych piêæ linii.
.El
.Sh ¦RODOWISKO
.Nm Mail
korzysta ze zmiennych ¶rodowiskowych
.Ev HOME
oraz
.Ev USER .
.Sh PLIKI
.Bl -tag -width /usr/lib/mail.*help -compact
.It Pa /var/spool/mail/*
Skrzynka pocztowa.
.It ~/mbox
Przeczytana poczta u¿ytkownika.
.It ~/.mailrc
Plik zawieraj±cy pocz±tkowe komendy mail.
.It Pa /tmp/R*
Pliki tymczasowe.
.It Pa /usr/lib/mail.*help
Pliki pomocy.
.It Pa /etc/mail.rc
Systemowy plik inicjalizacyjny.
.El
.Sh PATRZ TAK¯E
.Xr fmt 1 ,
.Xr newaliases 1 ,
.Xr vacation 1 ,
.Xr aliases 5 ,
.Xr mailaddr 7 ,
.Xr sendmail 8
oraz
.Rs
.%T "The Mail Reference Manual" .
.Re
.Sh HISTORIA
Komenda
.Nm mail
pojawi³a siê w
.At v6 .
Ta strona man pochodzi z dokumentu
.%T "The Mail Reference Manual"
którego autorem jest Kurt Shoens.
.Sh BUGS
Istniej± opcje nie opisane w tym dokumencie. Wiêkszo¶æ z
nich nie jest u¿yteczna dla zwyk³ego u¿ytkownika.
.Pp
.\" This bug is not the case in this particular distribution.
.\" Usually, .Nm mail is just a link to .Nm Mail, which can be confusing.
