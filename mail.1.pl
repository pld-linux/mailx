.\" {PTM/AB/0.2/12-12-1998/"mail - wysy�anie i odbieranie poczty"}
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
.Nd wysy�anie i odbieranie poczty
.Sh SK�ADNIA
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
.Op Fl u Ar u�ytkownik
.Sh WPROWADZENIE
.Nm Mail
to inteligentny system przetwarzania poczty, kt�ry korzysta
ze sk�adni linii polece� przypominaj�cej
.Xr \&ed 1 ,
operuj�c jednak na wiadomo�ciach, a nie na liniach tekstu.
.Pp
.Bl -tag -width flag
.It Fl v
Tryb verbose.
Szczeg�owe informacje dotycz�ce wysy�ki s�
wy�wietlane na terminalu u�ytkownika.
.It Fl i
Ignoruj sygna�y przerwania od tty.
Ta opcja jest bardzo u�yteczna podczas korzystania z
.Nm mail
poprzez linie telefoniczne z du�� liczb� zak��ce�.
.It Fl I
Zmusza mail do pracy w trybie interaktywnym, nawet
je�li wej�ciem nie jest terminal.
W szczeg�lno�ci znak specjalny 
.Sq Ic \&~
podczas wysy�ania poczty jest aktywny tylko w trybie
interaktywnym.
.It Fl n
Zakazuje czytania
.Pa /etc/mail.rc
po uruchomieniu programu.
.It Fl N
Zakazuje wy�wietlania na pocz�tku nag��wk�w wiadomo�ci
w czasie czytania poczty czy edycji foldera pocztowego.
.It Fl s
Ustala temat z poziomu linii polece�
(tylko pierwszy argument po opcji
.Fl s
jest uznawany za temat; pami�taj, aby obj�� cudzys�owani
tematy zawieraj�ce spacje).
.It Fl c
Wysy�a kopie do
.Ar listy
u�ytkownik�w.
.It Fl b
Wysy�a ukryte kopie do
.Ar listy .
Lista to adresy oddzielone przecinkami.
.It Fl f
Czyta zawarto�� twojego pliku 
.Ar mbox
(lub innego podanego pliku) do obr�bki. Gdy wyjdziesz,
.Nm mail
zapisuje nieskasowane wiadomo�ci z powrotem do tego pliku.
.It Fl u
R�wnowa�na z:
.Pp
.Dl mail -f /var/spool/mail/u�ytkownik
.El
.Ss Wysy�anie poczty
Aby wys�a� poczt� do jednej lub kilku os�b, 
.Nm mail
mo�e zosta� wywo�any z adresami docelowymi jako parametrami.
Program nast�pnie spodziewa si�, �e wpiszesz swoj� wiadomo��,
zako�czon�
.Sq Li control\-D
na pocz�tku nowej linii.
Sekcja
.Ar Odpowiadanie na listy
po�o�ona poni�ej, opisuje pewne cechy 
.Nm mail
u�atwiaj�ce tworzenie listu.
.Pp
.Ss Czytanie poczty
Standardowe polecenie
.Nm mail
bez �adnych parametr�w sprawdza twoj� poczt�, a nast�pnie
wypisuje nag��wek ka�dej znalezionej wiadomo�ci.
Pocz�tkowo aktywna jest pierwsza widadomo�� (nr 1) i mo�e
ona zosta� pokazana za pomoc� polecenia
.Ic print
(kt�re mo�e zosta� skr�cone do
.Ql Ic p ) .
Mo�esz porusza� si� po wiadomo�ciach tak, jak poruszasz si�
pomi�dzy liniami w programie
.Xr \&ed 1 ,
za pomoc� polece�
.Ql Ic \&+
i
.Ql Ic \&\-
wybieraj�cych poprzedni� i nast�pn� wiadomo��, oraz
numer�w wiadomo�ci.
.Pp
.Ss Kasowanie poczty
Po obejrzeniu wiadomo�ci mo�esz j� skasowa�
za pomoc� polecenia
.Ic delete
.Ql Ic d
lub odpowiedzie� na ni� u�ywaj�c
.Ic reply
.Ql Ic r .
Skasowanie powoduje, �e program
.Nm mail
zapomina o tej wiadomo�ci.
Proces ten nie jest nieodwracalny, taka wiadomo��
mo�e zosta� odzyskana poleceniem
.Ic undeleted
.Ql Ic u
podaj�c jej numer, lub przez przerwanie pracy programu
.Nm mail
za pomoc� polecenia
.Ic exit
.Ql Ic x .
Najcz�ciej jednak skasowane wiadomo�ci po prostu znikn�,
aby ju� ich nigdy nie obejrze�.
.Pp
.Ss Wyszczeg�lnianie wiadomo�ci
Komendy takie jak
.Ic print
czy
.Ic delete
mog� zawiera� jako argument list� numer�w wiadomo�ci, kt�rych
dotyczy dana komenda.
Tak wi�c
.Dq Li delete 1 2
kasuje wiadomo�ci 1 i 2, podczas gdy
.Dq Li delete 1\-5
kasuje wiadomo�ci od 1 do 5.
Specjalny znak
.Ql Li \&*
dotyczy wszystkich wiadomo�ci, a
.Ql Li \&$
wskazuje na ostatni� wiadomo��. Tak wi�c polecenie
.Ic top
kt�re wy�wietla kilka pierwszych linii widomo�ci mo�e
zosta� u�yte jako
.Dq Li top \&*
aby wy�wietli� pierwsze kilka linii wszystkich wiadomo�ci.
.Pp
.Ss Odpowiadanie na listy
Mo�esz u�y� komendy
.Ic reply
aby odpowiedzie� na wiadomo��, odsy�aj�c j� z powrotem
do nadawcy. Tekst kt�ry nast�pnie wpiszesz, a� do znaku
ko�ca pliku, b�dzie traktowany jako zawarto�� wiadomo�ci.
Podczas wpisywania wiadomo�ci
.Nm mail
traktuje specjalnie linie zaczynaj�ce si� znakiem
.Ql Ic \&~ .
Na przyk�ad wpisanie
.Ql Ic \&~m
(samego w linii) umie�ci kopi� wiadomo�ci na kt�r� odpowiadasz
przesuwaj�c j� o tabulator w prawo.
(patrz zmienna
.Em indentprefix
poni�ej).
Pozosta�e opcje ustawiaj� pole tematu, dodaj� lub usuwaj� adresat�w
wiadomo�ci czy pozwalaj� ci wywo�a� edytor lub pow�ok�, aby
wykona� jakie� polecenia.
(Te opcje s� podane w podsumowaniu poni�ej).
.Pp
.Ss Zaka�czanie sesji
Mo�esz zako�czy� prac� z programem
.Nm mail
za pomoc� polecenia
.Ic quit
.Ql Ic q .
Przegl�dni�te wiadomo�ci s� umieszczane w pliku
.Ar mbox
chyba �e zosta�y usuni�te, w takim razie zostaj� skasowane.
Nieprzeczytane wiadomo�ci wracaj� do skrzynki pocztowej.
(Patrz opcja
.Fl f
powy�ej).
.Pp
.Ss Osobiste i systemowe listy dystrybucyjne
Mo�liwe jest tak�e tworzenie osobistych list dystrybucyjnych,
tak, aby poczta wys�ana do na przyk�ad pod adres
.Dq Li cohorts
trafi�a do grupy ludzi
Takie listy definiuje si� przez dodanie lini takiej jak
.Pp
.Dl alias cohorts bill ozalp jkf mark kridle@ucbcory
.Pp
do pliku
.Pa \&.mailrc
w twoim katalogu domowym.
Aktualna lista takich alias�w mo�e by� wy�wietlona poleceniem
.Ic alias
w programie
.Nm mail .
Systemowe listy dystrybucyjne tworzy si� przez edycj� pliku
.Pa /etc/aliases ,
patrz tak�e
.Xr aliases 5
i
.Xr sendmail 8 .
Maj� one nieco odmienn� sk�adni�.
W wysy�anej poczcie, aliasy osobiste zostan� rozszerzone,
tak, aby mo�na by�o odpowiedzie� nadawcy.
Systemowe
.Ic aliasy
nie s� rozszerzane podczas wysy�ania poczty, ale
ka�da odpowiedz kt�ra powr�ci do tego komputera
zostanie rozszerzona podczas przechodzenia przez program
.Xr sendmail .
.Pp
.Ss Poczta sieciowa (ARPA, UUCP, Berknet)
Opisu adres�w sieciowych szukaj w
.Xr mailaddr 7 .
.Pp
.Nm Mail
posiada wiele opcji, kt�re mog� by� ustawione w pliku
.Pa .mailrc
aby wp�yn�� na zachowanie program�w, tak wi�c
.Dq Li set askcc
uaktywnia opcj�
.Ar askcc .
(Podsumowanie tych opcji znajduje si� poni�ej.)
.Sh SUMMARY
(Zaadaptowane z `Mail Reference Manual')
.Pp
Ka�de polecenie jest wpisywane w osobnej linii i mo�e
posiada� argumenty. Komenda nie musi zosta� podana w ca�o�ci,
u�ywana pierwsza komenda pasuj�ca do podanego przedrostka.
Je�li nie podano �adnego argumentu dla komend, kt�re wymagaj�
listy wiadomo�ci jako argumentu, to domy�lnie przyjmowana
jest nast�pna wiadomo�� kt�ra spe�niaj�ca warunki komendy.
Je�li nie istniej� �adne nast�pne wiadomo�ci, to przeszukiwanie
odbywa si� w przeciwnym kierunku, a je�li nie istnieje �adna
pasuj�ca wiadomo��,
.Nm mail
wy�wietla komunikat
.Dq Li No applicable messages
i przerywa wykonywanie polecenia.
.Bl -tag -width delete
.It Ic \&\-
Wy�wietla poprzedni� wiadomo��. Je�li podano liczbowy argument
.Ar n ,
to wy�wietla wiadomo�� odleg�� o
.Ar n
do ty�u w stosunku do aktualnej.
.It Ic \&?
Wy�wietla ma�e podsumowanie komend.
.It Ic \&!
Wywo�uje komend� pow�oki
(patrz tak�e
.Xr sh 1
i
.Xr csh 1 )
podan� jako argument.
.It Ic Print
.Pq Ic P
To samo co
.Ic print ,
ale dodatkowo wy�wietla ignorowane pola nag��wka.
Patrz tak�e
.Ic print ,
.Ic ignore
i
.Ic retain .
.It Ic Reply
.Pq Ic R
Wysy�a odpowied� nadawcy. Nie wysy�� odpowiedzi
pozosta�ym adresatom.
.It Ic Type
.Pq Ic T
To samo co komenda
.Ic Print .
.It Ic alias
.Pq Ic a
Je�li bez argument�w, wy�wietla wszystkie zdefiniowane aliasy.
Je�li jeden argument, wy�wietla tylko ten alias.
Je�li wi�cej argument�w, tworzy nowy alias lub zmienia stary.
.It Ic alternates
.Pq Ic alt
Komenda
.Ic alternates
jest u�yteczna, je�li posiadasz konta na kilku komputerach.
Mo�e by� ona u�ywana do poinformowania programu
.Nm mail ,
�e podany adres jest faktycznie tw�j.
Gdy odpowiadasz na wiadomo�ci,
.Nm mail
nie wy�le kopii listu na inne adresy podane w li�cie
.Ic alternates .
Je�li komenda
.Ic alternates
zosta�a wywo�ana bez argument�w, wy�wietla aktualn� list�
adres�w alternatywnych.
.It Ic chdir
.Pq Ic c
Zmienia aktualny katalog na podany. Je�li nie podano katalogu,
to przechodzi do katalogu domowego u�ytkownika.
.It Ic copy
.Pq Ic co
Komenda
.Ic copy
robi to samo, co
.Ic save ,
z wyj�tkiem tego, �e nie zaznacza zapisywanej wiadomo�ci
jako usuni�tej.
.It Ic delete
.Pq Ic d
Zaznaczas wiadomo�ci podane w argumencie jako usuni�te.
Usuni�te wiadomo�ci nie zostan� zapisane w
.Ar mbox ,
ani nie b�d� dost�pne dla wi�kszo�ci innych komend.
.It Ic dp
(tak�e
.Ic dt )
Kasuje aktualn� wiadomo�� i wy�wietla kolejn�. Je�li nie
ma kolejnej wiadomo�ci,
.Nm mail
wy�wietli komunikat
.Dq Li "at EOF" .
.It Ic edit
.Pq Ic e
Wywo�uje edytor tekstowy po kolei dla ka�dej wiadomo�ci podanej
jako parametr. Po powrocie z wiadomo�� jest ponownie odczytywana.
.It Ic exit
.Pf ( Ic ex
lub
.Ic x )
Powoduje natychmiastowy powr�t do pow�oki bez modyfikacji
skrzynki pocztowej, pliku
.Ar mbox
lub pliku podanego za pomoc� parametru
.Fl f  .
.It Ic file
.Pq Ic fi
To samo co
.Ic folder  .
.It Ic folders
Wy�wietla nazwy folder�w pocztowych.
.It Ic folder
.Pq Ic fo
Komenda
.Ic folder
prze��cza program na nowy plik lub folder pocztowy.
Gdy bez argument�w, wy�wietla nazw� pliku, z kt�rego
aktualnie korzystamy. Je�li podasz argument, program zapisze
wszystkie zmiany (takie jak skasowane wiadomo�ci) kt�rych
dokona�e� w aktualnym pliku i odczyta nowy plik.
Wyst�puj� pewne specjalne znaki, oznaczaj�ce pewne pliki.
# oznacza poprzedni plik, % systemow� skrzynk� pocztow�,
%u�ytkownik oznacza systemow� skrzynk� pocztow� dla danego
u�ytkownika, & oznacza tw�j plik
.Ar mbox
a
\&+\&folder oznacza plik w twoim katalogu folder�w.
.It Ic from
.Pq Ic f
Wypisuje nag��wki podanych wiadomo�ci.
.It Ic headers
.Pq Ic h
Wy�wietla nag��wki 18 wiadomo�ci, je�li podano argument
.Ql \&+ ,
to wy�wietlane jest nast�pne 18 nag��wk�w, a je�li podano argument
.Ql \&\- ,
to 18 poprzednich.
.It Ic help
To samo co
.Ic \&?
.It Ic hold
.Pf ( Ic ho ,
tak�e
.Ic preserve )
Zaznacza podane wiadomo�ci do pozostawienia w systemowej
skrzynce pocztowej, zawiast przeniesienia do
.Ar mbox .
Nie anuluje komendy
.Ic delete .
.It Ic ignore
Dodaje list� p�l nag��wka do
.Ar listy ignorowania .
Pola nag��wka na li�cie ignorowania nie zostan�
pokazane na terminalu gdy wy�wietlisz wiadomo��.
Ta komenda jest bardzo u�yteczna do ignorowania pewnych
p�l nag��wka generowanych przez komputer.
Komendy
.Ic Type
oraz
.Ic Print
mog� zosta� u�yte do wy�wietlenia wiadomo�ci w ca�o�ci,
w��czaj�c w to pola ignorowane.
Je�li 
.Ic ignore
zostanie wywo�any bez parametr�w,
to wy�wietla aktualn� list� ignorowanych p�l.
.It Ic mail
.Pq Ic m
Wysy�a list do adres�w i list dystrybucyjnych podanych
w argumencie.
.It Ic mbox
Zaznacza wiadomo�ci, kt�re zostan� przeniesione do
.Ic mbox
gdy zako�czysz prac�. Dzieje si� tak z wiadomo�ciami,
kt�rym
.Em nie
maj� ustawionej opcji
.Ic hold .
.It Ic next
.Pq Ic n
Podobne do
.Ic \&+
i
.Tn CR .
Przechodzi do nast�pnej wiadomo�ci i wy�wietla j�. Gdy podano
argument, przechodzi do nast�pnej pasuj�cej wiadomo�ci.
.It Ic preserve
.Pq Ic pre
To samo, co
.Ic hold .
.It Ic print
.Pq Ic p
Wy�wietla na terminalu ka�d� podan� w argumencie wiadomo��.
.It Ic quit
.Pq Ic q
Ko�czy prac�, zapisuje wszystkie nieskasowane, niezapisane
wiadomo�ci w pliku
.Ar mbox
w katalogu domowym u�ytkownika, pozostawiaj�c wszystkie
wiadomo�ci zaznaczone poleceniem
.Ic hold
czy
.Ic preserve
lub do kt�rych nigdy si� nie odwo�ywano w systemowej
skrzynce pocztowej i usuwa wszystkie pozosta�e wiadomo�ci
z systemowej skrzynki pocztowej. Je�li podczas tej sesji
pojawi�a si� nowa poczta, to zostanie wy�wietlony komunikat
.Dq Li "You have new mail" .
Je�li uruchomiono program z opcj�
.Fl f ,
to edytowany plik zostanie ponownie zapisany.
Program zwraca kontrol� do pow�oki, chyba �e zapis edytowanego
pliku nie powiedzie si�, w tej sytuacji u�ytkownik mo�e
wyj�� za pomoc� komendy
.Ic exit .
.It Ic reply
.Pq Ic r
Wysy�a odpowiedzi do nadwcy i wszystkich adresat�w podanych
wiadomo�ci. Wiadomo�� nie mo�e by� skasowana.
.It Ic respond
To samo, co
.Ic reply  .
.It Ic retain
Dodaje podane pola nag��wka do
.Ar listy zatrzymanych
Podczas wy�wietlania wiadomo�ci na terminalu
zostan� pokazane tylko pola nag��wka znajduj�ce si�
na li�cie zatrzymanych. Wszystkie inne pola zostaj� ukryte.
Komendy
.Ic Type
i
.Ic Print
mog� zosta� u�yte do wy�wietlenia ca�ej wiadomo�ci.
Je�li
.Ic retain
zostanie wywo�ane bez argument�w, to wy�wietla aktualn�
list� zatrzymanych p�l.
.It Ic save
.Pq Ic s
Dopisuje podane wiadomo�ci na koniec podanego jako drugi
argument pliku. Nazwa pliku, ilo�� linii oraz liczba znak�w
jest wy�wietlana na terminalu.
.It Ic set
.Pq Ic se
Gdy bez argument�w, wy�wietla warto�ci wszystkich zmiennych.
W innym przypadku ustawia opcje. Argumenty s� w postaci
.Ar opcja=warto��
(bez spacji przed lub za =) lub
.Ar opcja .
Argument mo�e zosta� uj�ty w cudzys�owy, aby zamaskowa�
spacje, tabulatory, np.
.Dq Li "set indentprefix=\*q->\*q"
.It Ic saveignore
Powoduje, �e podane wiadomo�ci zapisywane za pomoc�
.Ic save
lub podczas automatycznego zapisu do
.Ar mbox
nie b�d� zawiera�y p�l nag��wka z listy p�l ignorowanych.
.It Ic saveretain
Powoduje, �e w czasie zapisu podanych wiadomo�ci za pomoc�
.Ic save
lub podczas automatycznego zapisu do
.Ar mbox
do��czane s� jedynie pola nag��wka znajduj�ce si� na
li�cie zatrzymanych p�l. Wywo�anie
.Ic Saveretain
automatycznie anuluje
.Ic saveignore .
.It Ic shell
.Pq Ic sh
Wywo�uje interaktywn� wersj� pow�oki.
.It Ic size
Wy�wietla ilo�� znak�w dla ka�dej z podanych wiadomo�ci.
.It Ic source
�aduje komendy z pliku.
.It Ic top
Wy�wietla kilka pierwszych linii podanych wiadomo�ci.
Ilo�� wy�wietlanych linii zale�y od zmiennej
.Ic toplines ,
warto�ci� domy�ln� jest pi��.
.It Ic type
.Pq Ic t
To samo co
.Ic print  .
.It Ic unalias
Usuwa grupy adres�w zdefiniowane przez komend�
.Ic alias .
Od teraz nazwa grupy nie ma ju� �adnego szczeg�lnego znaczenia.
.It Ic undelete
.Pq Ic u
Zaznacza podane wiadomo�ci jako
.Ic nie
usuni�te.
.It Ic unread
.Pq Ic U
Zaznacza podane wiadomo�ci jako
.Ic nie
przeczytane.
.It Ic unset
Wy��cza podane opcji, przeciwie�stwo komendy
.Ic set .
.It Ic visual
.Pq Ic v
Wywo�uje pe�noekranowy edytor dla ka�dej podanej wiadomo�ci.
.It Ic write
.Pq Ic w
Podobne do
.Ic save ,
jednak zapisywana jest
.Ic tylko
sama tre�� wiadomo�ci
.Pq Ar bez
nag��wka). U�yteczne w celach takich, jak na przyk�ad 
przesy�anie kod�w �r�d�owych poprzez poczt�.
.It Ic xit
.Pq Ic x
To samo, co
.Ic exit .
.It Ic z
.Nm Mail
wy�wietla nag��wki wiadomo�ci tak, jak to
opisano przy poleceniu
.Ic headers .
Mo�esz przenie�� si� do nast�pnego ekranu za pomoc� polecenia
.Ic \&z .
Mo�esz tak�e przenie�� si� do poprzedniego ekrazu u�ywaj�c
.Ic \&z\&\- .
.El
.Ss Komendy z tyld�
.Pp
Poni�ej znajduje si� podsumowanie komend z tyld�, kt�re
u�ywane s� podczas pisania wiadomo�ci. Komendy z tyld� s�
rozpoznawane tylko wtedy, gdy znajduj� si� na pocz�tku linii.
The name
.Dq Em tilde\ escape
is somewhat of a misnomer since the actual escape
character can be set by the option
.Ic escape .
.Bl -tag -width Ds
.It Ic \&~! Ns Ar komenda
Wywo�uje podan� komend� pow�oki, a nast�pnie wraca do
edycji wiadomo�ci.
.It Ic \&~b Ns Ar adres ...
Dodaje podane adresy do listy kopii wiadomo�ci, ale nie
ujawnia ich w polu Cc: nag��wka (ukryta kopia).
.It Ic \&~c Ns Ar adres ...
Dodaje podane adresy do listy kopii wiadomo�ci.
.It Ic \&~d
Do��cza zawarto�� pliku
.Dq Pa dead.letter
z katalogu domowego do edytowanej wiadomo�ci.
.It Ic \&~e
Wywo�uje edytor tekstowy z napisan� dotychczas wiadomo�ci�.
Po zako�czeniu sesji mo�esz kontynowa� dodawanie tekstu
do wiadomo�ci.
.It Ic \&~f Ns Ar wiadomo�ci
Dodaje podane wiadomo�ci do edytowanej wiadomo�ci.
Gdy nie podano argumentu, dodaje aktualn� wiadomo��.
Pola nag��wka ignorowane (za pomoc� komendy
.Ic ignore
lub
.Ic retain )
nie zostaj� do��czone.
.It Ic \&~F Ns Ar wiadomo�ci
To samo, co
.Ic \&~f ,
jednak do��cza wszystkie nag��wki wiadomo�ci.
.It Ic \&~h
Pozwala na edycj� nag��wka wiadomo�ci. Wy�wietla po kolei
zawarto�� poszczeg�lnych p�l nag��wka i pozwala na ich modyfikacj�.
.It Ic \&~m Ns Ar wiadomo�ci
Dodaje podane wiadomo�ci do edytowanej wiadomo�ci, przesuni�te
o tabulator, lub z dodan� warto�ci� zmiennej
.Ar indentprefix .
Gdy nie podano argument�w, dodaje aktualn� wiadomo��.
If no messages are specified,
read the current message.
Pola nag��wka ignorowane (za pomoc� komendy
.Ic ignore
lub
.Ic retain )
nie zostaj� do��czone.
.It Ic \&~M Ns Ar wiadomo�ci
To samo, co
Identical to
.Ic \&~m ,
ale do��czane s� wszystkie pola nag��wka.
.It Ic \&~p
Wy�wietla ca�o�� edytowanej wiadomo�ci, poprzedzon�
zawarto�ci� p�l nag��wka.
.It Ic \&~q
Anuluje edytowan� wiadomo��, a nast�pnie, je�li w��czona
jest opcja
.Ic save ,
kopiuje j� do pliku
.Dq Pa dead.letter
w twoim katalogu domowym.
.It Ic \&~r Ns Ar plik
Dodaje zawarto�� podanego pliku do edytowanej wiadomo�ci.
.It Ic \&~s Ns Ar tekst
Zmienia temat wiadomo�ci na podany tekst.
.It Ic \&~\&t Ns Ar adres ...
Dodaje podane adresy do listy adresat�w.
.It Ic \&~\&v
Wywo�uje alternatywny edytor tekst�w (okre�lony przez zmienn�
.Ev VISUAL )
dla edytowanej wiadomo�ci. Zazwyczaj alternatywnym edytorem
jest edytor ekranowy. Po wyj�ciu z edytora mo�esz kontynuowa�
edycj� wiadomo�ci.
.It Ic \&~w Ns Ar plik
Zapisuje wiadomo�� do podanego pliku.
.It Ic \&~\&| Ns Ar komenda
Wysy�a wiadomo�� poprzez strumie� do podanego polecenia.
Je�li komenda nie zwr�ci nic na standardowym wyj��iu lub
zako�czy prac� z b��dem, oryginalna wiadomo�� zostanie
zachowana. Cz�sto u�ywanym poleceniem jest
.Xr fmt 1
s�u��cy do wyjustowania wiadomo�ci.
.It Ic \&~: Ns Ar komenda-mail
Wykonuje podan� komend� programu mail. Nie wszystkie polecenia
s� jednak dozwolone.
.It Ic \&~~ Ns Ar tekst
Dodaje do wiadomo�ci podany tekst, poprzedzony znakiem ~.
Je�li znak escape zosta� zmieniony, powiniene� wpisa� go
dwukrotnie aby zosta� on dodany do wiadomo�ci.
.El
.Ss Opcje programu mail
Opcje s� ustawiane poprzez polecenia
.Ic set
oraz
.Ic unset .
Opcje mog� by� binarne, w tej sytuacji istotne jest tylko
czy s� ustawione czy nie, albo tekstowe, w tej sytuacji istotna
jest warto�� danej opcji. Opcje binarne to:
.Bl -tag -width append
.It Ar append
Powoduje, �e wiadomo�ci zapisane w
.Ar mbox
zostan� dopisane na ko�cu, zamias zast�powa� dotychczasow�
zawarto�� pliku. Ta opcja powinna by� zawsze w��czona
(najlepiej w pliku
.Pa /etc/mail.rc ) .
.It Ar ask, asksub
Powoduje, �e 
.Nm mail
zawsze zapyta o temat wysy�anej wiadomo�ci. Je�li podasz
jedynie pust� lini�, nie b�dzie pola tematu.
.It Ar askcc
Powoduje, �e pod koniec edycji wiadomo�ci jeste� pytany o
dodatkowych adresat�w kopii. Podanie pustej linii oznacza,
�e dotychczasowa lista kopii jest wystarczaj�ca.
.It Ar askbcc
Powoduje, �e pod koniec edycji wiadomo�ci jeste� pytany o
dodatkowych adresat�w ukrytych kopii. Podanie pustej linii oznacza,
�e dotychczasowa lista ukrytych kopii jest wystarczaj�ca.
.It Ar autoprint
Powoduje, �e komenda
.Ic delete
zachowuje si� tak jak
.Ic dp .
Oznacza to, �e po skasowaniu wiadomo�ci, zast�pna zostanie
wy�wietlona automatycznie.
.It Ar debug
Ustawienie opcji
.Ar debug
dzia�a tak samo, jak podanie
.Fl d
w linii polece� i powoduje, �e
.Nm mail
wy�wietla wszystkie informacje przydatne przy
debugowaniu programu.
.It Ar dot
Opcja
.Ar dot
powoduje, �e
.Nm mail
interpretuje pojedyncz� kropk� w pustej linii jako
koniec edytowanej wiadomo�ci.
.It Ar hold
Ta opcja powoduje, �e wiadomo�ci zawsze s�
zatrzymywane w skrzynce pocztowej.
.It Ar ignore
Powoduje, �e sygna�y przerwania z terminalu zostaj� ignorowane
i wy�wietlone jako znak @.
.It Ar ignoreeof
Opcja ta jest powi�zana z
.Ar dot
i powoduje, �e
.Nm mail
nie uznaje control-d jako ko�ca wiadomo�ci
.Ar Ignoreeof
dotyczny tak�e wiersza polece�
.Nm mail .
.It Ar metoo
Zazwyczaj gdy w grupie znajduje si� nadawca, jest on usuwany
z pola adresat�w. Ustawienie tej opcji powoduje dodanie
nadawcy do pola adresat�w.
.It Ar noheader
Ustawienie opcji
.Ar noheader
powoduje to samo, co wywo�anie programu z parametrem
.Fl N .
.It Ar nosave
Standardowo, gdy przerwiesz edycj� wiadomo�ci, zostanie
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
Zapobiega wy�wietlaniu varsji po uruchomieniu programu.
.It Ar searchheaders
Je�li ta opcja jest ustawiona, to lista wiadomo�ci podana
w postaci ``/x:y'' zostanie zamieniona na list� wszystkich
wiadomo�ci zawieraj�cych tekst ``y'' w polu nag��wka ``x''.
Wielko�� liter nie jest istotna.
.It Ar verbose
Ustawienie opcji
.Ar verbose
daje takie same efekty, jak u�ycie opcji
.Fl v
w linii polece�. Gdy mail pracuje w trybie verbose, na
terminalu wy�wietlane s� szczeg�y dotycz�ce dostarczania
wiadomo�ci do adresata.
.El
.Ss Opcje tekstowe
.Bl -tag -width Va
.It Ev EDITOR
�cie�ka do edytora tekstowego u�ywanego po wydaniu komendy
.Ic edit
lub
.Ic \&~e .
Je�li nie zdefiniowana, u�ywany jest domy�lny edytor.
.It Ev LISTER
�cie�ka do programu wy�wietlaj�cego katalogi wykorzystywanego
przez komend�
.Ic folders .
Domy�lna warto�� to
.Pa /bin/ls .
.It Ev PAGER
�cie�ka do programu u�ywanego przez komend�
.Ic more
lub gdy ustawiona jest opcja
.Ic crt .
Je�li opcja nie zosta�a zdefiniowana, u�ywana jest
domy�lna przegl�darka
.Xr more 1 .
.It Ev SHELL
�cie�ka do pow�oki u�ywana przez komend�
.Ic \&!
i
.Ic \&~! .
Je�li opcja nie zosta�a zdefiniowana, u�ywana
jest domy�lna pow�oka.
.It Ev VISUAL
�cie�ka do edytora tekst�w u�ywanego przez komend�
.Ic visual
i
.Ic \&~v .
.It Va crt
Warto�� tej opcji ustala, jak d�uga musi by� wiadomo��,
aby program
.Ev PAGER
musia� zosta� wykorzystany do jej obejrzenia. Je�li opcja
.Va crt
ma pust� warto��, to u�yywana jest liczba linii terminala
(patrz te�
.Xr stty 1 ) .
.It Ar escape
Je�li zdefiniowana, pierwszy znak tej opcji ustala znak
u�ywany zamiast ~.
.It Ar folder
Nazwa katalogu, w kt�rym przechowywane s� foldery
wiadomo�ci. Je�li nazwa znaczyna si� od `/',
.Nm mail
uznaje j� za �cie�k� absolutn�, w innym przypadku jest
to �cie�ka wzgl�dem twojego katalogu domowego.
.It Ev MBOX
Nazwa pliku
.Ar mbox .
Mo�e to by� nazwa foldera. Domy�ln� nazw� jest
.Dq Li mbox
w katalogu domowym u�ytkownika.
.It Ar record
Je�li zdefiniowana, oznacza nazw� pliku, do kt�rego zapisywana
jest ka�da wysy�ana wiadomo��. Je�li niezdefiniowana, to
wysy�ane wiadomo�ci nie s� zapisywane.
.It Ar indentprefix
Tekst u�ywany przez komend� ``~m'' do oznaczania wiadomo�ci,
zamiast domy�lnego znaku tabulacji (^I). Pami�taj, aby obj��
warto�� cudzys�owami je�li zawiera spacje lub tabulatory.
.It Ar toplines
Je�li zdefiniowana, ustala liczb� linii wy�wietlanych przez
komend�
.Ic top .
Domy�lnie wy�wietlanych jest pierwszych pi�� linii.
.El
.Sh �RODOWISKO
.Nm Mail
korzysta ze zmiennych �rodowiskowych
.Ev HOME
oraz
.Ev USER .
.Sh PLIKI
.Bl -tag -width /usr/lib/mail.*help -compact
.It Pa /var/spool/mail/*
Skrzynka pocztowa.
.It ~/mbox
Przeczytana poczta u�ytkownika.
.It ~/.mailrc
Plik zawieraj�cy pocz�tkowe komendy mail.
.It Pa /tmp/R*
Pliki tymczasowe.
.It Pa /usr/lib/mail.*help
Pliki pomocy.
.It Pa /etc/mail.rc
Systemowy plik inicjalizacyjny.
.El
.Sh PATRZ TAK�E
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
pojawi�a si� w
.At v6 .
Ta strona man pochodzi z dokumentu
.%T "The Mail Reference Manual"
kt�rego autorem jest Kurt Shoens.
.Sh BUGS
Istniej� opcje nie opisane w tym dokumencie. Wi�kszo�� z
nich nie jest u�yteczna dla zwyk�ego u�ytkownika.
.Pp
.\" This bug is not the case in this particular distribution.
.\" Usually, .Nm mail is just a link to .Nm Mail, which can be confusing.
