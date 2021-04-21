# Multiple HTTP demo with Ruby

A simple Ruby script that runs independent instances of the web server 
in Linux environment.

## Setup
To run this on your system make sure you have Ruby language support with `ruby -v` 
command. If not, add Ruby to your system with your favorite package manager. 
In this example I'm using **Ubuntu**.  
```sh
$ sudo apt install ruby
# OR
$ sudo snap install ruby --classic
```
We will also need `Git` and `Curl`, so if you don't have them, install them as well.
```sh
$ sudo apt install git curl
```

---

## Cloning a repository
```
$ git clone https://github.com/loopold/multiple-httpd.git
$ cd multiple-httpd
```

---

## Launch
Here is exaple for start 5 instances. The parameter in square brackets defines 
the number of instances that we want to run 
```sh
$ rake start_http_servers[5]
```
You can see the list of available tasks with `rake --tasks`

### Attention to ZSH 
I have noticed in ZSH problem with launching script.
In ZSH we have to add `noglob` prefix or create an alias to `rake` command: `noglob rake`
in `.zshrc`

---

## Verify
Servers listen on ports starting from port 5001. You can verify it with `curl` command
in terminal.
```sh
$ curl http://localhost:500\[1-5\]
```

---

## Close
At this stage we can end processes with `SIGTERM` signal for all Ruby instances:
```sh
$ killall ruby
```
