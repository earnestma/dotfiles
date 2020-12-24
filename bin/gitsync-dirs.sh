#!/bin/bash
echo "==========================" >> ~/.gs.log
date >> ~/.gs.log

cd ~/org
pwd >> ~/.gs.log
git sync >> ~/.gs.log

