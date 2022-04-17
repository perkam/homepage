#!/bin/bash
trap 'kill -TERM $PID' TERM INT

npm run dev & # Command 1
hugo serve -D --disableFastRender & # Command 2

PID=$!
wait $PID
trap - TERM INT
wait $PID
EXIT_STATUS=$?
