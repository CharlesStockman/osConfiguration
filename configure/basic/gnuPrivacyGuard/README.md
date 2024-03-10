## Generating the Public and Private Key For Your System

The public and private key allows software to be encrypted and decrypted.

The public key is used to encrypt the data so the key is given to another user or executable.<br> 
The private key is used by the owner to decrypt the data.

| Command            | Explamation             |
|--------------------|-------------------------|
| cd osConfiguration/configure/basic/gnuPrivacyGuard | Change Directory                                                            |	
| sh ./configure.sh	                                 | Creates the public and private key for the developer                        |
| . ./getPublicKey.sh	                               | Assigns the public key to the environmental varible : config_gpg_public_key |
| sh ./create_trust.sh	                             | Set "Ultimate Trust' for the GPG id.<br>There are five levels of trust from with one being the lowest |
