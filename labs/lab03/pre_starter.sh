#!/bin/bash
yarn jar /usr/hdp/2.5.3.0-37/hadoop-mapreduce/hadoop-streaming.jar \
     -D mapred.reduce.tasks=1 \
     -files pre_mapper.py,pre_reducer.py \
     -input /labs/lab03data \
     -output /user/sergey.sirosh/lab03 \
     -mapper  'python pre_mapper.py' \
     -reducer 'python pre_reducer.py'