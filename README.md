andrewrothstein.minio
=========
![Build Status](https://github.com/andrewrothstein/ansible-minio/actions/workflows/build.yml/badge.svg)

Installs [minio](https://www.minio.io) to /usr/local/bin by default.

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

> Note: If minio_installer is toggled between Homebrew (brew) and binary (bin) mode, please make sure the executable is re-linked if you want to leverage the Homebrew version: `brew unlink {{ minio_app }} && brew link {{ minio_app }}`

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
