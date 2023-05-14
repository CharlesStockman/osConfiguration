#!/bin/bash

# Set trust to 5 for the so the pass command can use the gpg_id iwthout error 
expect ./create_trust.exp `echo $config_gpg_public_key`

