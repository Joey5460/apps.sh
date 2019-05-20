pkill sslocal
test "$1" = "us1" \
    && (echo "****us1****" ; sslocal -c ~/apps.sh/ss-net-us1.json & ) \
|| (test "$1" = "" \
    && echo "****tky****" && sslocal -c ~/apps.sh/ss-net.json &)
    
