# A Bitcoin crawler + DNS seed

### Local Setup

```shell
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Install Tor (optional, operating system dependent)

Run it with

```
python crawler.py
```

### Deploy to $5/month Ubuntu Digital Ocean Droplet

Update system, install dependencies, run Tor

```
sudo apt update
sudo apt install python3-pip tor
pip install -r requirements.txt
```

Run Tor & Check that it is running
```
$ sudo systemctl start tor
$ curl --socks5 localhost:9050 --socks5-hostname localhost:9050 -s https://check.torproject.org/ | cat | grep -m 1 Congratulations | xargs
Congratulations. This browser is configured to use Tor.
```

[Raise open file limits](https://medium.com/@muhammadtriwibowo/set-permanently-ulimit-n-open-files-in-ubuntu-4d61064429a). Without this you would run out of file descriptors for all the sockets the crawler creates. If you ever see "too many open files" Python errors, this is your problem.


Run crawler

```
# Run in foreground:
python3 crawler.py

# Run in background:
nohup python3 crawler.py &
```

You should get a `crawler.log` file which captures `logging` module outputs. When you run in background as described above, you should also get a `nohup.out` file that captures the print statements in the crawler.


### Prior Art

- Peter Wuille's [bitcoin-seeder](https://github.com/sipa/bitcoin-seeder)
- [Bitnodes](https://github.com/ayeowch/bitnodes)

