#!/bin/bash

pkill -f train.sh

kill $(pgrep -f llm_logistics.py)