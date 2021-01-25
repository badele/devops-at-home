## ANsible tips

```
# Select inventory
task ansible:deploy:os ARGS="--check --diff -i storage,"

# Debug var
ansible nas1 -m debug -a 'var=ansible_default_ipv4'

# List inventory
ansible-inventory --list
```
