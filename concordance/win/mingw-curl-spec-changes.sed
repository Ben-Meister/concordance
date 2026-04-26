s/^Release:.*/Release:     99%{?dist}/
# Enable schannel
s/^MINGW32_CONFIGURE_ARGS.*//
s/^MINGW64_CONFIGURE_ARGS.*//
s/^MINGW_CONFIGURE_ARGS.*/MINGW_CONFIGURE_ARGS="--with-schannel --enable-ipv6 --without-random"/
# Remove unneeded 32 bit dependencies
s/^BuildRequires:.*mingw32-libidn2//
s/^BuildRequires:.*mingw32-libssh2//
s/^BuildRequires:.*mingw32-openssl//
# Remove 64 bit since we're only building 32 bit
/^BuildRequires:.*mingw64/d
# Remove 64 bit packages, disable debug package generation
/^%package -n mingw64-curl/,/^%{?mingw_debug_package}/c\%global debug_package %{nil}
# Remove 64 bit package files
/^%files -n mingw64-curl/,/^%changelog/c\%changelog
# Misc remnants
/mv.*mingw64/d
/rm.*mingw64/d
/^# Win64/d
