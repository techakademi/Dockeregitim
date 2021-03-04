#!/bin/bash
sleep 30 
kill -15 $(ps aux | pgrep "gunicorn" | awk '{print $2,$NF}')