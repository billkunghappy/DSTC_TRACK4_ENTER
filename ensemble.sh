cwd=$(pwd)
TYPE=$1
SPLIT=$2
POSTFIX0=$3
POSTFIX1=$4
POSTFIX2=$5

#generate
#Furniture
cd simmc/mm_dst
./run_ensemble.sh ${TYPE} ${SPLIT} $POSTFIX0 $POSTFIX1 $POSTFIX2


