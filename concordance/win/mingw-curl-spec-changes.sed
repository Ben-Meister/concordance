1i %global mingw_build_win64 0
1i %global mingw_build_ucrt64 0
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
# Remove 64 bit packages and 32-bit static, disable debug package
/^%package -n mingw32-curl-static/,/^%{?mingw_debug_package}/c\%global debug_package %{nil}
# Remove 64 bit package files and 32-bit static
/^%files -n mingw32-curl-static/,/^%changelog/c\%changelog
# Misc remnants
/MINGW_BUILDDIR_SUFFIX=_static/d
/mv.*mingw64/d
/rm.*mingw64/d
/mv.*static/d
/rm.*static/d
