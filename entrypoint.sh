#!/bin/bash

LT_OUTPUT_DEVICE="${LT_OUTPUT_DEVICE:-/dev/stdout}"

run_test() {
  sleep 0.5
  for i in $(seq 1 $LT_ITTER)
  do
    echo $1 $i started
    rapidresetclient -url $LT_HOST -requests $LT_REQUESTS -wait=10 -delay=$LT_DELAY -concurrency=$LT_CONCURRENCY > $LT_OUTPUT_DEVICE
    echo $1 $i finished
    sleep 0.5
  done
}


for i in $(seq 1 $LT_RUN_TIMES)
do

    run_test $i &
done

wait
