#
# Conditional build:
%bcond_without	kerberos5	# build without Kerberos support

Summary:	An enhanced implementation of the mailx command
Summary(pl.UTF-8):	Rozszerzona implementacja komendy mailx
Name:		mailx
Version:	12.4
Release:	4
License:	BSD
Group:		Applications/Mail
Source0:	http://downloads.sourceforge.net/heirloom/%{name}-%{version}.tar.bz2
# Source0-md5:	0c93759e34200eb56a0e7c464680a54a
Patch0:		%{name}-bsdcompat.patch
Patch1:		%{name}-use-krb5-gss.patch
Patch2:		%{name}-openssl-nss.patch
Patch3:		%{name}-openssl.patch
Patch4:		%{name}-ipv6.patch
Patch5:		%{name}-pager.patch
URL:		http://heirloom.sourceforge.net/mailx.html
%{?with_kerberos5:BuildRequires:	heimdal-devel}
BuildRequires:	openssl-devel >= 0.9.7d
Obsoletes:	nail
Obsoletes:	nail-mail
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
Heirloom mailx is derived from Berkeley Mail and is intended provide
the functionality of the POSIX mailx command with additional support
for MIME messages, IMAP, POP3, and SMTP. It provides enhanced features
for interactive use, such as caching and disconnected operation for
IMAP, message threading, scoring, and filtering. It is also usable as
a mail batch language, both for sending and receiving mail.

%description -l pl.UTF-8
Heirloom mailx został stworzony na podstawie Berkeley Mail z zamysłem
dostarczenia funkcjonalnosci komendy POSIX mailx z dodatkowym
wsparciem dla MIME, IMAP, POP3 i SMTP. Nail dostacza rozszerzone
możliwości przy pracy interaktywnej, takie jak odłączone operacje dla
IMAP, wątkowanie wiadomości, punktacja i filtrowanie.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1
%patch4 -p1
%patch5 -p1

%{!?with_kerberos5:sed -i -e 's#gssapi.h#crap.h#g' makeconfig}

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}" \
	MAILRC=/etc/mail.rc \
	MAILSPOOL=/var/mail \
	SENDMAIL=/usr/lib/sendmail

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{_bindir},%{_mandir}/man1,/etc/skel,/bin}

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT \
	MAILRC=/etc/mail.rc \
	UCBINSTALL=/usr/bin/install \
	PREFIX=%{_prefix} \
	BINDIR=/bin

install nail.rc $RPM_BUILD_ROOT/etc/skel/.mailrc

ln -sf mailx $RPM_BUILD_ROOT/bin/mail
ln -sf ../../bin/mail $RPM_BUILD_ROOT%{_bindir}/Mail
ln -sf ../../bin/mail $RPM_BUILD_ROOT%{_bindir}/nail

echo .so mailx.1 > $RPM_BUILD_ROOT%{_mandir}/man1/Mail.1
echo .so mailx.1 > $RPM_BUILD_ROOT%{_mandir}/man1/mail.1
echo .so mailx.1 > $RPM_BUILD_ROOT%{_mandir}/man1/nail.1

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc AUTHORS ChangeLog README TODO
%config(noreplace) %verify(not md5 mtime size) /etc/mail.rc

/etc/skel/.mailrc

%attr(755,root,root) /bin/mail*
%attr(755,root,root) %{_bindir}/[Mn]ail
%{_mandir}/man1/*
