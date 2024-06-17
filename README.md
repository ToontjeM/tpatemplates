# TPA Templates

## Flow
1. `./vu <config>`
2. `TPAexec configure bla, bla, bla`
3 Change cluster/config.yml
    1. Add `public_ip`
    2. Change `ansible_user` to `vagrant`
4. `TPA provision cluster`
5. `./dokeys.sh <cluster>`
6. `TPA deploy cluster -K` - `vagrant`