SPLIT=$1
# copy file into simmc/data
cp -r data/furniture* simmc/data/simmc_furniture/
cp -r data/fashion* simmc/data/simmc_fashion/
# preprocess to linebyline 
cwd=$(pwd)
echo $cwd
#make apicalls
#cd simmc/mm_action_prediction
#./scripts/preprocess_simmc.sh furniture train
#./scripts/preprocess_simmc.sh fashion train
cd $cwd
#make mm_dst preproc
cd simmc/mm_dst
./run_preprocess_gpt2.sh $SPLIT
cd $cwd
