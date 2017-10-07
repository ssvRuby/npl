#!/bin/bash
yarn jar /usr/hdp/2.5.3.0-37/hadoop-mapreduce/hadoop-streaming.jar \
     -D mapred.reduce.tasks=1 \
     -files mappeer.py,reducer.py \
     -input /labs/facetz_2015_02_26 \
     -output /user/sergey.sirosh/hblog \
     -mapper  'python mappeer.py' \
     -reducer 'python reducer.py' 