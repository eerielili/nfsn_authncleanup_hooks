# Nearlyfreespeech.net auth and cleanup certbot hooks for `dns01` challenge

These perl scripts goes in hand with the `--manual-auth-hook` and 
`--manual-cleanup-hook` flags of the `certbot` command line utility.
Don't forget to edit the user, api key and account id variable.

`$USER`: The username for your [nearlyfreespeech.net](https://nearlyfreespeech.net/) account.

`$API_KEY`: The API key needed to make requests on their backend. You can request it through [here](https://members.nearlyfreespeech.net/lilim/support/request).

`$ACCOUNT_ID`: The account id tied to the registered domain name
(a string like A1B2-C3D4E5F6). You'll find it
[there](https://members.nearlyfreespeech.net/lilim/domains), column
'Account'.

# EXAMPLES

```
certbot --manual --manual-auth-hook /path/to/nfsn_auth.pl --manual-cleanup-hook /path/to/nfsn_cleanup.pl --agree-tos --email yourmail@example.org --preferred-challenges dns certonly -d example.org
```
