#Remove all data file
rm -rf data/*
rm -rf simmc/data/simmc_furniture/*
rm -rf simmc/data/simmc_fashion/*
rm -rf simmc/mm_dst/gpt2_dst/data/furniture/*
rm -rf simmc/mm_dst/gpt2_dst/data/fashion/*
rm -rf simmc/mm_dst/gpt2_dst/results/furniture/*
rm -rf simmc/mm_dst/gpt2_dst/results/fashion/*
# Put necessary data file
cp -r need_data/to_simmc_data/furniture* simmc/data/simmc_furniture/
cp -r need_data/to_simmc_data/fashion* simmc/data/simmc_fashion/
cp -r need_data/to_gpt2_data/furniture* simmc/mm_dst/gpt2_dst/data/furniture/
cp -r need_data/to_gpt2_data/fashion* simmc/mm_dst/gpt2_dst/data/fashion/
