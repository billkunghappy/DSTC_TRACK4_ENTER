cwd=$(pwd)
TYPE=$1
SPLIT=$2
POSTFIX=$3

#generate
#Furniture
cd simmc/mm_dst
#split postproc
./run_split_postproc.sh ${TYPE} ${POSTFIX} ${SPLIT}
#add_action postprroc, should not use
#./run_add_action_postproc.sh ${TYPE} D0 ${SPLIT}
#reformat belief and response
#./run_format.sh ${TYPE} ${POSTFIX} ${SPLIT}
#retrieve score
./get_retrieve_scores_BLEU.sh ${TYPE} ${POSTFIX} ${SPLIT}
#api postproc
#./run_api_postproc.sh ${TYPE} ${POSTFIX} ${SPLIT}


