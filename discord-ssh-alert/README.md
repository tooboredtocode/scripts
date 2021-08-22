# Discord SSH Alert

Get a Discord Notification every time successfully logs into your server via ssh.

## Setup

1. Copy the `ssh_alert.sh` file in the folder `/etc/pam.scripts/`
2. Populate it with your Discord ID (learn how to get that [here](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-)) and Webhook Token (learn how to get that [here](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks))
3. Change its owner to the root user (see [here](#Changing-the-user-of-the-file))
4. Make it executable (see [here](#Making-it-executable))
5. Finally add the following line to the `/etc/pam.d/sshd` file:

```
session    required     pam_exec.so /etc/pam.scripts/ssh_alert.sh
```

### Changing the user of the file

```sh
chown root:root ssh_alert.sh
```


### Making it executable

```sh
chmod 700 ssh_alert.sh
```


---

Copyright (c) 2021 tooboredtocode

MIT License