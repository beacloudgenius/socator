### SocaTor = SOCAT + TOR
Based on https://github.com/Arno0x/Docker-Socator

It uses socat to listen on a given TCP port (5000 in this example) and to redirect incoming traffic to a tor hidden service specified through environment variables. Itacts as a relay between the standard web and a hidden service on the tor network. You can optionally restrict the IP addresses that are allowed to connect to this service by specifying an `ALLOWED_RANGE` environment variable and using CIDR notation.

### Usage

Break free from cloud services providers limitations, secure and protect your bitcoin full node, connect that with a BTC Pay server, all behind TOR.
Selectively expose the BTC Pay Server payment gateway and API to clearnet using socat+tor running on the Internet.

--------------

##### build

    docker build -t cloudgenius/socator .

##### push

    docker push cloudgenius/socator

##### Start the image in background (*daemon mode*) with IP address restriction:

    docker run -d \
        -p 5000:5000 \
        -e "ALLOWED_RANGE=192.168.1.0/24" \
        -e "TOR_SITE=zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion" \
        -e "TOR_SITE_PORT=80" \
        --name socator \
        cloudgenius/socator

##### Start the image in foreground:

    docker run --rm -ti \
        -p 5000:5000 \
        -e "TOR_SITE=zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion" \
        -e "TOR_SITE_PORT=80" \
        --name socator \
        cloudgenius/socato

Now http://localhost:5000 should show you the tor hidden service you specified in the above command.
