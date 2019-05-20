pkill sslocal
test "$1" = "us1" \
    && (echo "****us1****" ; sslocal -c ~/Documents/etc/ss/ss-net-us1.json & ) \
|| (test "$1" = "" \
    && echo "****tky****" && sslocal -c ~/Documents/etc/ss/ss-net.json &)
    
