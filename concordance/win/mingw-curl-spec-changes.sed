s/^Release:.*/Release:     99%{?dist}/
s/^MINGW32_CONFIGURE_ARGS.*//
s/^MINGW64_CONFIGURE_ARGS.*//
s/^MINGW_CONFIGURE_ARGS.*/MINGW_CONFIGURE_ARGS="--with-schannel --enable-ipv6 --without-random"/

