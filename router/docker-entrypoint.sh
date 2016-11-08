#!/bin/bash

if [ ! -f /data/proxysql/proxysql.db ]; then
    mkdir -p /data/proxysql
    exec proxysql -f --initial "$@"
else
    exec proxysql -f --reload "$@"
fi
