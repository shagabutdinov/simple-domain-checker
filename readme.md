Simple domain checker
=====================

Domain checker for domains that contain all combinations of two words (head and
tail).

Installation
------------

1. Clone git repo
2. Install "host" utility ("sudo pacman -S host" or similar)
3. Run a check: ./simple-host-checker.rb my yours -- domain host --zone com org
4. Will output:

```
[ taken ] mydomain.com
[ taken ] my-domain.com
[ taken ] mydomain.org
[ taken ] my-domain.org
[ taken ] myhost.com
[ taken ] my-host.com
[ taken ] myhost.org
[ taken ] my-host.org
[ taken ] yoursdomain.com
[ taken ] yours-domain.com
[ free ]  yoursdomain.org
[ free ]  yours-domain.org
[ taken ] yourshost.com
[ taken ] yours-host.com
[ taken ] yourshost.org
[ free ]  yours-host.org
```