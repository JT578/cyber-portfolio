# Networking: IP, Ports, DNS

## IP + adapters
Windows CMD:
```
ipconfig
```
Linux:
```
ip a
```

## Connectivity
```
ping 1.1.1.1
tracert 1.1.1.1   # Windows
traceroute 1.1.1.1 # Linux
```

## DNS lookups
Windows:
```
nslookup example.com
```
Linux:
```
dig example.com any +short
```

## Ports refresher
- TCP: connection-oriented (reliable), examples: 22 SSH, 80 HTTP, 443 HTTPS
- UDP: connectionless (fast), examples: 53 DNS, 123 NTP
