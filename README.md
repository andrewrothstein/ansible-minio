andrewrothstein.minio
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-minio.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-minio)

Installs [minio](https://www.minio.io) to /usr/local/bin by default.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.minio
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
