Summary:     /bin/mail - the "traditional" way to mail via shell scripts, etc
Summary(pl): Tradycyjna metoda wysy³ania poczty przy pomocy komendy z shella
Name:        mailx
Version:     8.1.1
Release:     6
Copyright:   BSD
Group:       Applications/Mail
Source:      ftp://ftp.debian.org/pub/debian/hamm/source/mail/%{name}-%{version}.tar.gz
Patch:       %{name}-%{version}.debian.patch
Patch1:      %{name}.patch
Buildroot:   /tmp/%{name}-%{version}-root

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
%setup -q
%patch -p1
%patch1 -p1

%build
make CPPFLAGS="-D_BSD_SOURCE $RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/{bin,etc/mail,usr/{lib,bin,man/man1}}

install  misc/{mail.help,mail.tildehelp} $RPM_BUILD_ROOT%{_libdir}
install  misc/mail.rc $RPM_BUILD_ROOT/etc/mail

install -s mail $RPM_BUILD_ROOT/bin
ln -sf /bin/mail $RPM_BUILD_ROOT/usr/bin/Mail
install mail.1 $RPM_BUILD_ROOT%{_mandir}/man1
echo ".so mail.1" > $RPM_BUILD_ROOT%{_mandir}/man1/Mail.1

%clean 
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644, root, mail, 755)
%config(noreplace) %verify(not size mtime md5) /etc/mail/mail.rc
%attr(755, root, mail) /bin/mail
%attr(755, root, mail) /usr/bin/Mail
%{_libdir}/*
%{_mandir}/man1/*

%changelog
* Mon Jun 15 1998 Wojtek ¦lusarczyk <wojtek@shadow.eu.org>
  [8.1.1-1]
- added pl translation,
- added buildroot support,
- moved /etc/mail.rc to /etc/mail/mail.rc,
- build from non root's account.

* Fri Jun 12 1998 Alan Cox <alan@redhat.com>
- Moved from 5.5 to the OpenBSD 8.1 release plus Debian patches

* Tue May 05 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Tue Oct 21 1997 Donnie Barnes <djb@redhat.com>
- spec file cleanups

* Thu Jun 12 1997 Erik Troan <ewt@redhat.com>
- built against glibc
