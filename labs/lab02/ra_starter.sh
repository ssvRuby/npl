#!/bin/bash
yarn jar /usr/hdp/2.5.3.0-37/hadoop-mapreduce/hadoop-streaming.jar \
     -D mapred.reduce.tasks=1 \
     -input /user/sergey.sirosh/hblog/part-00000 \
     -output /user/sergey.sirosh/top350 \
     -mapper 'cat' \
     -reducer 'sort -nrk 2 | head -n350'
