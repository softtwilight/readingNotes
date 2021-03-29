### Job control
```shell
sleep 20

man signal

jobs

kill
`ctrl + c` # sigint
`ctrl + \\` # sigquit
`ctrl + z` #suspend the process

nohup # allow a process to live when the terminal gets killed.
bg %job_id # resume the job have been suspended, and run them in backgroud.
```

###  Tmux (Terminal multiplexer)
manage the window and session.

```shell
tldr tmux
# create new session
tmux new -s {name}
``` 

### config

`alais` 
dotfiles (search on github)

`ln` 
`ln [-Ffhinsv] source_file [link_name]` #link the sf to lf

### remote
```shell
ssh username@remote_host

ssh-keygen -o -a 100 -t ed25519
logout

# local machine to forward to the remote port.
ssh -L 9999:localhost:8888 foobar@remote_server

scp
rsync
sshfs
```