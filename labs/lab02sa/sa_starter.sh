#!/bin/bash
yarn jar /usr/hdp/2.5.3.0-37/hadoop-mapreduce/hadoop-streaming.jar \
     -D mapred.reduce.tasks=1 \
     -files mapper.py,reducer.py \
     -input /labs/facetz_2015_02_12 \
     -output /user/sergey.sirosh/hblog \
     -mapper  'python mapper.py' \
     -reducer 'python reducer.py'

