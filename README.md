# UbuntuDockerAyman

## What to do :

Run the container :

```bash
  $ docker run -d -P -e SSH_KEY='YOUR PUB KEY' ayoubensalem/ayman
```

Get the container ip :

```bash
  $ docker inspect CONTIAINER_ID | jq -r ".[0].NetworkSettings.Networks.bridge.IPAddress"
```

Try to ssh into it :


```bash
  $ ssh ayman@CONTAINER_IP
```

RUN THIS COMMAND :


```bash
  $ ssh-keygen
```

When done, copy the PUB KEY generated and in the host type this command:


```bash
  $ echo "PUB_KEY" >> authorized_keys
```
Make sur that the authorized_keys has 644.

And now, you could be able to ssh from the container to the host.
