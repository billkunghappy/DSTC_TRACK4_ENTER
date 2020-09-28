# # DSTC9 Track4 Readme
* Using this repo, need to use git lfs to download data and model
* Using transformers 2.8.0
* torch 1.5.0
* python3.6
## Challenge Phase 1(Devtest)
* The results of Devtest for all two domains and all subtask are placed in **DSTC_TRACK4_ENTRY/DEVTEST_RESULTS/**
## Challenge Phase 2(teststd)
* Not yet predicted...

## To predict devtest and teststd set
### Prepare Data
* First put all the data in **DSTC_TRACK4_ENTRY/data/**
    * which means, for `${DOMAIN} = {furniture, fashion}, ${SPLIT} = {devtest, teststd}`. Put these files in the directory.
        * `${DOMAIN}_${SPLIT}_dials.txt`
        * `${DOMAIN}_${SPLIT}_dials_api_calls.json`
        * `${DOMAIN}_${SPLIT}_dials_retrieval_candidates.json`
    * For one Data split(devtest or teststd). You will have to put **6 files** into **DSTC_TRACK4_ENTRY/data/**
    * For the devtest, I already prepare it at **DSTC_TRACK4_ENTRY/devtest_data/**

### Get the results
* To get the prediction fils for ${SPLIT}={devtest, teststd}, run the following commands in **DSTC_TRACK4_ENTRY/**:
    * `./do_all.sh ${SPLIT}`
    * For example, to run devtest, you will execute the command:
        * `./do_all.sh devtest`
    * This is gonna take a while since it will use 3 model to generate for each domain, which means it will generate totally 6 times for one split, and the generation process is asynchronous.
    * If you want to speed up, you may run each command in the **do_all.sh** and run those `./generate.sh` command synchronously. After generating all the files. run the later commands in the **do_all.sh**

> All the results will be placed in **DSTC_TRACK4_ENTRY/results/**
> Follwing the format
> The Generate file for subtask3 is in **JSON** format
```
<Subtask 1>
dstc9-simmc-{split}-{domain}-subtask-1.json

<Subtask 2>
dstc9-simmc-{split}-{domain}-subtask-2-generation.json
dstc9-simmc-{split}-{domain}-subtask-2-retrieval.json

<Subtask 3>
dstc9-simmc-{split}-{domain}-subtask-3.txt (line-separated output)
or
dstc9-simmc-{split}-{domain}-subtask-3.json (JSON format)
```

### Eval devtest
* Since we don't have the teststd predict ground truth, we can only evaluate on devtest
* To evaluate, after the **do_all.sh** finished, use the **do_eval.sh** to evaluate
    * `./do_eval.sh ${subtask-id} ${domain} ${split}`
    * `${subtask-id}={1, 2, 3}`
    * `${domain}={furniture, fashion}`
    * `${split}={devtest, teststd}`
    * For example, to evaluate Furniture subtask 1 on devtest, run:
        * `./do_eval.sh 1 furniture devtest`

### Clear data and results
* If you want to clear all the data, in **DSTC_TRACK4_ENTRY/** run
    * `./CLEAR.sh`
* If you want to clear all the results, in **DSTC_TRACK4_ENTRY/** run
    * `./RESULT_CLEAR.sh`
