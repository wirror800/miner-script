# miner-script
a miner script for researching

## Related project
watchbog: https://github.com/xmrig/xmrig/

## How to refuse the attack
### 1、find the binary files, and remove them
```
find ./  -type f|grep 'pastebin.com'|xargs rm -rf
```
### 2、modify the domain pasring, make the script cannot download the remote scripts
vi /etc/hosts
```
127.0.0.1 pastebin.com pixeldrain.com aziplcr72qjhzvin.onion.to
```
