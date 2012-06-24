Summary:	/bin/mail - the "traditional" way to mail via shell scripts
Summary(pl):	Tradycyjna metoda wysy�ania poczty przy pomocy komendy z shella
Name:		mailx
Version:	8.1.1
Release:	22
License:	BSD
Group:		Applications/Mail
Source0:	ftp://ftp.ptb.de/pub/mail/unix/%{name}-%{version}.tar.gz
Source1:	mail.1.pl
Patch0:		%{name}-misc.diff
Patch1:		%{name}-man.patch
Patch2:		%{name}-nullchar.patch
Patch3:		%{name}-nopanic.patch
Patch4:		%{name}-debian.diff
Patch5:		%{name}-pathnames.patch
Patch6:		%{name}-date.patch
Patch7:		%{name}-siglj.patch
Patch8:		%{name}-environ.patch
Patch9:		%{name}-bug10074.patch
Patch10:	%{name}-version.patch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
The /bin/mail program can be used to send quick mail messages, and is
often used in shell scripts.

%description -l de
Das /bin/mail-Programm dient zum Versenden von Quick-Mail- Nachrichten
und wird h�ufig in Shell-Skripts verwendet.

%description -l fr
Le programme /bin/mail peut �tre utilis� pour envoyer des mails
rapides et est souvent utilis� dans les scripts shell.

%description -l pl
Przy pomocy programu /bin/mail mo�na wysy�a� poczt�. Cz�sto jest on
wykorzystywany w skryptach shella.

%description -l tr
/bin/mail program� h�zl� olarak mektup g�ndermek i�in kullan�labilir.
Genellikle kabuk yorumlay�c�lar� i�inde kullan�l�r.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1
%patch6 -p1
%patch7 -p1
%patch8 -p1
%patch9 -p1
%patch10 -p1

%build
%{__make} CFLAGS="%{rpmcflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{/bin,/etc/skel,%{_bindir},%{_datadir}/misc} \
	$RPM_BUILD_ROOT%{_mandir}/{man1,pl/man1}

install	misc/* $RPM_BUILD_ROOT%{_datadir}/misc
install misc/mail.rc $RPM_BUILD_ROOT/etc/skel/.mailrc

install mail $RPM_BUILD_ROOT/bin
ln -sf ../../bin/mail $RPM_BUILD_ROOT%{_bindir}/Mail

install mail.1 $RPM_BUILD_ROOT%{_mandir}/man1
echo .so mail.1 > $RPM_BUILD_ROOT%{_mandir}/man1/Mail.1

install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/mail.1
echo .so mail.1 > $RPM_BUILD_ROOT%{_mandir}/pl/man1/Mail.1

%clean 
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)

%attr(755,root,root) /bin/mail
%attr(755,root,root) %{_bindir}/Mail

/etc/skel/.mailrc

%{_datadir}/misc/*
%{_mandir}/man1/*
%lang(pl) %{_mandir}/pl/man1/*
