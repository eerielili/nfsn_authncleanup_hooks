#!/usr/bin/env perl
use warnings;
use strict;
use WebService::NFSN;

###vvvEDIT THISvvv###
my $USER = 'username';
my $API_KEY = '12345678901';
my $ACCOUNT_ID = 'A1B2-C3D4E5F6';
###^^^EDIT THIS^^^###

my $nfsn = WebService::NFSN->new($USER, $API_KEY);
my $DOMAIN = $ENV{'CERTBOT_DOMAIN'};
my $TXT_DATA = $ENV{'CERTBOT_VALIDATION'};

my $i = rindex($DOMAIN, '.');
my $NOTGTLD = substr ($DOMAIN,0,$i);
my $GTLD = substr ($DOMAIN, $i+1);
my $i2 = rindex($NOTGTLD, '.');
my $SUBDOMAIN = substr ($NOTGTLD,0,$i2);
my $PART_HOSTNAME = substr ($NOTGTLD, $i2+1);
my $HOSTNAME = qq{$PART_HOSTNAME.$GTLD};

my $dnszone =  $nfsn->dns($HOSTNAME);
my $ACME_CHALLENGE_STR = "_acme-challenge";

if ($NOTGTLD =~ /\./){
    # subdomain detected
    $ACME_CHALLENGE_STR = qq{$ACME_CHALLENGE_STR.$SUBDOMAIN};
}
else {
    # no subdomain
    $SUBDOMAIN = '';
}

$dnszone->removeRR(
    name => "$ACME_CHALLENGE_STR",
    type => 'TXT',
    data => "$TXT_DATA"
);

my $nfsn_err = $nfsn->last_response->decoded_content;
if ( $nfsn_err =~ /^([\w0-9])$/ ){
    die "\nNFSN API ERROR: $nfsn_err\n";
}
else{
    print "\nThe DNS records have been updated.\n";
}
sleep 5;
