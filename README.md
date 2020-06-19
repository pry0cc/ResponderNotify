# ResponderNotify
This is nothing serious, I was just on a remote internal, and I have had Responder running with Slinky all day, infact, all night, and I really thought it would be cool if I could automate the upload of hashes to a hashcat queue of sorts that would just iterate through a queue and crack them, then return the plaintext to me.

Sad thing is, I haven't done that. YET!

But I did something just short of that, and equally as cool (I'm lying to myself at this point). You run it in the responder directory, everytime it gets a new hash, it sends it to you in telegram!

# Installation
```
wget <UpHash.py>
wget <ResponderNotify>
```

### Create a Telegram Bot
First, message the BotFather, literally, on Telegram, Message that account with the phrase:
```
/start
```

It will return with a menu of options, type the phrase:

```
/newbot
```

It will then ask for a name, made up a unique name and press enter. Follow the further instructions until you get a HTTP API Access Token. 

### Get your Chat ID
Once created, direct message the bot using the supplied t.me link in the response.

Copy this token into the following curl command:

```
export telegram_key="<ENTER IT HERE>"
curl -s https://api.telegram.org/bot$telegram_key/getUpdates
```

It will return some JSON. Message your Bot with a test message on Telegram, you should see this message in the HTTP response of the above curl command. In this response will a chat_id be supplied, note this down.

### Edit the `notify.sh` script
Now take both your telegram key, and your chat id, and enter them into the top two variables in the `notify.sh` bash script. Then run it!

If you have a lot of hashes, it will message them to you, and then it will not. If you want to add a persistent history fork me and PR!


### Want to do something nice?
Buy me a coffee!

https://www.buymeacoffee.com/pry0cc
