#!/bin/bash

# croup für cpu limits "container" anlegen
cgcreate -g cpu:container

# konfiguration: prozesse in der gruppe dürfen nur ~20% der cpu verwenden
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/resource_management_guide/sec-cpu
cgset -r cpu.cfs_quota_us=200000 container
cgset -r cpu.cfs_period_us=1000000 container
