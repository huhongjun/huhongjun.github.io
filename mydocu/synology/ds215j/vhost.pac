function FindProxyForURL(url, host) {
    if (dnsDomainIs(host, "ldyx.org")||
        dnsDomainIs(host, "cj.org")||
        dnsDomainIs(host, "bolue.net")
        
        ) 
    {
        return "PROXY 3.14.138.219:80";
    }

    return "DIRECT";
}