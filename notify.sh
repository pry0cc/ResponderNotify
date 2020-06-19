#!/bin/bash

telegram_key="<ADD ME>"
chat_id="<ADD ME>"
url=""
hashcat_key=""

last_hash=""
hashes=""
old_hashes=""
ip=$(curl -s icanhazip.com)

echo "I will check the database every 10 seconds, if i find a hash, i'll send a message with a truncated version :)"
echo "If you like this, please buy me a coffee! https://www.buymeacoffee.com/pry0cc :)"

while true
do
	hashes=$(./UpHash.py | tr ' ' '\n')
	new_hash="$(echo $hashes | sha256sum)"

	if [[ "$new_hash" != "$last_hash"  ]]
	then
		for hash in $hashes
		do 
			if [[ ! $old_hashes =~ "$hash"  ]]
			then
				echo "we got a new hash! $new_hash"
				echo "HASH: $hash"
				short=$(echo $hash | cut -d ":" -f 1-4)
				curl -X POST -H 'Content-Type: application/json' -d "{\"chat_id\": \"$chat_id\", \"text\": \"Hash caught: $short :)\"}" https://api.telegram.org/bot$telegram_key/sendMessage
                curl -X POST --data "key=$hashcat_key&hash=$hash" $url/submit &
			fi
		done
	fi

	sleep 10
	last_hash="$new_hash"
	old_hashes="$hashes"
done
