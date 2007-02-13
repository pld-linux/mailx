Summary:	/bin/mail - the "traditional" way to mail via shell scripts
Summary(pl.UTF-8):	Tradycyjna metoda wysyłania poczty przy pomocy komendy z shella
Name:		mailx
Version:	8.1.1
Release:	26
License:	BSD
Group:		Applications/Mail
Source0:	ftp://ftp.ptb.de/pub/mail/unix/%{name}-%{version}.tar.gz
# Source0-md5:	2a5b39e90b9d6d4e56b6cc930b0c4db4
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
Patch11:	%{name}-kill_warnings.patch
Patch12:	%{name}-gcc4.patch
Obsoletes:	nail-mail
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
The /bin/mail program can be used to send quick mail messages, and is
often used in shell scripts.

%description -l de.UTF-8
Das /bin/mail-Programm dient zum Versenden von Quick-Mail- Nachrichten
und wird häufig in Shell-Skripts verwendet.

%description -l fr.UTF-8
Le programme /bin/mail peut être utilisé pour envoyer des mails
rapides et est souvent utilisé dans les scripts shell.

%description -l pl.UTF-8
Przy pomocy programu /bin/mail można wysyłać pocztę. Często jest on
wykorzystywany w skryptach shella.

%description -l tr.UTF-8
/bin/mail programı hızlı olarak mektup göndermek için kullanılabilir.
Genellikle kabuk yorumlayıcıları içinde kullanılır.

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
%patch11 -p1
%patch12 -p1

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}"

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
