# Nearlyfreespeech.net auth and cleanup certbot hooks for `dns01` challenge

These perl scripts goes in hand with the `--manual-auth-hook` and 
`--manual-cleanup-hook` flags of the `certbot` command line utility.
Don't forget to edit the user, api key and account id variable.

# EXAMPLES

```
certbot --manual --manual-auth-hook /path/to/nfsn_auth.pl --manual-cleanup-hook /path/to/nfsn_cleanup.pl --agree-tos --email yourmail@example.org --preferred-challenges dns certonly -d example.org
```
