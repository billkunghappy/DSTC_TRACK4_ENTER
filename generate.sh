TYPE=$1
SPLIT=$2
POSTFIX=$3
cwd=$(pwd)
#generate
#Furniture
cd simmc/mm_dst
./run_generate_gpt2.sh $TYPE $POSTFIX $SPLIT
