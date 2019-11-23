pkill sslocal
test "$1" = "ss6" \
    && (echo "****ss6****" ; sslocal -c ~/Documents/etc/ss/ss6.json & ) \
|| (test "$1" = "gd" \
    && echo "****gd****" && sslocal -c ~/Documents/etc/ss/gd.json &)

(test "$1" = "ss3" && echo "****ss3****" && sslocal -c ~/Documents/etc/ss/ss3.json &) 

(test "$1" = "" \
    && echo "****tky****" && sslocal -c ~/Documents/etc/ss/tky.json &)
    
