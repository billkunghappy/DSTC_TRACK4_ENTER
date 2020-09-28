subtask_id=$1
TYPE=$2
SPLIT=$3


echo "eval task" $subtask_id
#<Subtask 1>
if [ "$subtask_id" = "1" ]
then
python tools/action_evaluation.py \
    --action_json_path=simmc/data/simmc_${TYPE}/${TYPE}_${SPLIT}_dials_api_calls.json \
    --model_output_path=results/dstc9-simmc-${SPLIT}-${TYPE}-subtask-1.json \
    #--single_round_evaluation
fi

#<Subtask 2 Generation>
if [ "$subtask_id" = "2" ]
then
python tools/response_evaluation.py \
    --data_json_path=simmc/data/simmc_${TYPE}/${TYPE}_${SPLIT}_dials.json \
    --model_response_path=results/dstc9-simmc-${SPLIT}-${TYPE}-subtask-2-generation.json \
    --single_round_evaluation

#<Subtask 2 Retrieval>
python tools/retrieval_evaluation.py \
    --retrieval_json_path=simmc/data/simmc_${TYPE}/${TYPE}_${SPLIT}_dials_retrieval_candidates.json \
    --model_score_path=results/dstc9-simmc-${SPLIT}-${TYPE}-subtask-2-retrieval.json \
    --single_round_evaluation
fi



#<Subtask 3>
if [ "$subtask_id" = "3" ]
then
#python -m gpt2_dst.scripts.evaluate \
#  --input_path_target={PATH_TO_GROUNDTRUTH_TARGET} \
#  --input_path_predicted={PATH_TO_MODEL_PREDICTIONS} \
#  --output_path_report={PATH_TO_REPORT}

#(Or, dialog level evaluation)
python -m utils.evaluate_dst \
    --input_path_target=simmc/data/simmc_${TYPE}/${TYPE}_${SPLIT}_dials.json \
    --input_path_predicted=results/dstc9-simmc-${SPLIT}-${TYPE}-subtask-3.json \
    --output_path_report=reports/subtask-3-report.txt
fi
