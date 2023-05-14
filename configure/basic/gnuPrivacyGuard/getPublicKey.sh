#
# Purpose : Get the public key from GPG
#
# Assumption : There is only one key created at the time the script is ran
#
getPublicKey() {
	publicKey=`gpg --list-signatures --with-colons | grep 'sig' | head -n 1 | cut -d':' -f5`
	export config_gpg_public_key="$publicKey"
}

getPublicKey
