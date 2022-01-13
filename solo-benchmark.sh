#! /bin/bash

driver_memory="2048m"
executor_memory="2048m"
executor_cores=2
mem_overhead=972
num_classes=2
num_trees=10
count=1
jar_name="CoDRIFt-1.1-SNAPSHOT.jar"
percent_labelled=66
output="result1.txt"
kvalue=4


for num_executors in {5..58..1}; do
	START_TIME=$(date +%N)
	START_TIMEFOR=$(date +%T.%N)
	./../../../../spark-3.1.1-bin-hadoop2.7/bin/spark-submit --class goals.edu.wvu.rascl.driver.CoDRIFt --master local[4] --driver-memory $driver_memory --num-executors $num_executors --executor-memory $executor_memory --executor-cores $executor_cores --conf spark.executor.memoryOverhead=$mem_overhead --queue default ../../../../Users/Seth/IdeaProjects/CoDRIFt/target/$jar_name $num_classes $num_trees gini 4 32 ../../../../research/RASCl/input/palfa_2class_labeled.csv $output $percent_labelled $kvalue
	END_TIME=$(date +%N)
	END_TIMEFOR=$(date +%T.%N)
	echo $START_TIMEFOR >> test.txt
	echo $END_TIMEFOR  >> test.txt
	echo ./spark-submit --class goals.edu.wvu.rascl.driver.CoDRIFt --master local[4] --driver-memory $driver_memory --num-executors $num_executors --executor-memory $executor_memory --executor-cores $executor_cores --conf spark.executor.memoryOverhead=$mem_overhead --queue default ../../Users/Seth/IdeaProjects/CoDRIFt/target/$jar_name $num_classes $num_trees gini 4 32 ../../research/RASCl/input/palfa_2class_labeled.csv $output $percent_labelled $kvalue >> test.txt
	echo $(($END_TIME - $START_TIME)) >> test.txt
done
