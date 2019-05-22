#!/bin/bash
# Author：RYB

performanceTestPath='/home/lenovo/Documents/performanceTest'

# create server
echo "
[Unit]
Description=Job that runs your user script

[Service]
ExecStart= /bin/bash -c 'nohup python $performanceTestPath/main.py &'
Type=forking
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/performanceTest.service

# chmod
chmod 644 /lib/systemd/system/performanceTest.service

# start server
systemctl daemon-reload
systemctl enable performanceTest.service
systemctl start performanceTest.service

