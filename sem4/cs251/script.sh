#!/bin/bash
control_z()
{
kill -9  $pid1
kill -9  $pid2
kill -9  $pid3
echo final goodbye
pkill -9  -f sleep
pkill -9  -f timeout
echo 'killed all'
exit #$
}

trap control_c SIGINT
./10ZmoZg3pWmw9aA.sh < a.txt &
pid1=$!
echo "started proc1: ${pid1}"

./DFwAU7iSoYorHy8.sh< b.txt &
pid2=$!
echo "started proc2: ${pid2}"

./dUkeKOpRSOxQfx2.sh < c.txt &
pid3=$!
echo "started proc3: ${pid3}"

echo -n "working..."
trap control_z SIGTSTP

wait $pid1 $pid2 $pid3
echo " done"
