#!/bin/bash
# Balazs Vinarz
# v01 initial release

global="[global]\ndirect=1\ndirectory=$1\nioengine=libaio\nnumjobs=1\nruntime=30\nsize=1G\nstonewall\ntime_based\n"
list='rsqd32t01 r4kd32t01 rsqd01t01 r4kd01t01 wsqd32t01 w4kd32t01 wsqd01t01 w4kd01t01'
rsqd32t01="[Read-Seq-Q32T1]\nbs=128k\niodepth=32\nrw=read\n"
r4kd32t01="[Read-4k-Q32T1]\nbs=4k\niodepth=32\nrw=randread\n"
rsqd01t01="[Read-Seq-Q01T1]\nbs=1M\niodepth=1\nrw=read\n"
r4kd01t01="[Read-4k-Q01T1]\nbs=4k\niodepth=1\nrw=randread\n"
wsqd32t01="[Write-Seq-Q32T1]\nbs=128k\niodepth=32\nrw=write\n"
w4kd32t01="[Write-4k-Q32T1]\nbs=4k\niodepth=32\nrw=randwrite\n"
wsqd01t01="[Write-Seq-Q01T1]\nbs=1M\niodepth=1\nrw=write\n"
w4kd01t01="[Write-4k-Q01T1]\nbs=4k\niodepth=1\nrw=randwrite\n"
declare -a array
declare -i run

if [ -z "$1" ]
then
echo "Missing parameter: mount point"
echo "Usage: ./crystalfiomark.sh \$mountpoint'"
else
run=0
for word in $list; do
	run=$run+1
	echo -e ${!word} | head -1
	result=$(echo -e $global ${!word} 2>/dev/null | sudo fio - | awk '/bw\=/{print $2}' | sed 's/\=/\ /' | awk '{print $2}')
	array[$run]=$result
	echo ${array[$run]}
	printf "Sleep: 0.."
		for i in {1..5}; do
		sleep 1s
		printf $i".."
		done
	echo
done
echo
	echo "|           |    Read   |   Write   |"
	echo "|-----------|-----------|-----------|"
	echo "| Seq Q32T1 |"  ${array[1]}  "|"  ${array[5]}  "|"
	echo "|  4K Q32T1 |"  ${array[2]}  "|"  ${array[6]}  "|"
	echo "| Seq Q01T1 |"  ${array[3]}  "|"  ${array[7]}  "|"
	echo "|  4K Q01T1 |"  ${array[4]}  "|"  ${array[8]}  "|"
fi
