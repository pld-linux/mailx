Summary:	/bin/mail - the "traditional" way to mail via shell scripts
Summary(pl):	Tradycyjna metoda wysy³ania poczty przy pomocy komendy z shella
Name:		mailx
Version:	8.1.1
Release:	8
Copyright:	BSD
Group:		Applications/Mail
Group(pl):	Aplikacje/Poczta
######		ftp://ftp.debian.org/pub/debian/hamm/source/mail
Source:		%{name}-%{version}.tar.gz
Patch0:		%{name}-misc.diff
Patch1:		%{name}-man.patch
BuildRoot:	/tmp/%{name}-%{version}-root

%description
The /bin/mail program can be used to send quick mail messages, and
is often used in shell scripts.

%description -l de
Das /bin/mail-Programm dient zum Versenden von Quick-Mail-
Nachrichten und wird häufig in Shell-Skripts verwendet.

%description -l fr
Le programme /bin/mail peut être utilisé pour envoyer des mails
rapides et est souvent utilisé dans les scripts shell.

%description -l pl
Przy pomocy programu /bin/mail mo¿na wysy³aæ pocztê. Czêsto jest on
wykorzystywany w skryptach shella.

%description -l tr
/bin/mail programý hýzlý olarak mektup göndermek için kullanýlabilir.
Genellikle kabuk yorumlayýcýlarý içinde kullanýlýr.

%prep
%setup  -q
%patch0 -p1
%patch1 -p1

%build
make CFLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/{bin,etc/skel/C,usr/{bin,share/{misc,man/man1}}}

install	misc/*		$RPM_BUILD_ROOT%{_datadir}/misc
cat	misc/mail.rc >	$RPM_BUILD_ROOT/etc/skel/C/.mailrc

install -s mail $RPM_BUILD_ROOT/bin
ln -sf /bin/mail $RPM_BUILD_ROOT%{_bindir}/Mail

install mail.1 $RPM_BUILD_ROOT%{_mandir}/man1
echo .so mail.1 > $RPM_BUILD_ROOT%{_mandir}/man1/Mail.1

gzip -9fn $RPM_BUILD_ROOT%{_mandir}/man1/*

%clean 
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)

%attr(755,root,root) /bin/mail
%attr(755,root,root) %{_bindir}/Mail

/etc/skel

%{_datadir}/misc/*
%{_mandir}/man1/*

%changelog
* Thu May 27 1999 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
- FHS 2.0 && GNU libc-2.1 

* Mon Jun 15 1998 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
  [8.1.1-1]
- added pl translation,
- added buildroot support,
- moved /etc/mail.rc to /etc/mail/mail.rc,
- build from non root's account.
