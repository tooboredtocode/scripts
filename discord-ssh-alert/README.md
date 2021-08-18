# Discord SSH Alert

Get a Discord Notification every time successfully logs into your server via ssh.

## Setup

Copy the `ssh_alert.sh` file in the folder `/etc/pam.scripts/`, populate it with your Discord ID (learn how to get that [here](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-)) and Webhook Token (learn how to get that [here](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)) and finally add the following line to the `/etc/pam.d/sshd`:

```
session    required     pam_exec.so /etc/pam.scripts/ssh_alert.sh
```

---

Copyright (c) 2021 tooboredtocode

MIT License