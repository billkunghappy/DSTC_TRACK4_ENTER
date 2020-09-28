SPLIT=$1
#postfix is the model name
POSTFIX0="160"
POSTFIX1="80"
POSTFIX2="161"
#-------- preprocess both ----------
./preprocess.sh $SPLIT
#-------- generate for all three model -----------
#furniture
./generate.sh furniture $SPLIT $POSTFIX0
./generate.sh furniture $SPLIT $POSTFIX1
./generate.sh furniture $SPLIT $POSTFIX2
#fashion
./generate.sh fashion $SPLIT $POSTFIX0
./generate.sh fashion $SPLIT $POSTFIX1
./generate.sh fashion $SPLIT $POSTFIX2
#----------- postproc -----------
#furniture
./postproc.sh furniture $SPLIT $POSTFIX0
./postproc_ens.sh furniture $SPLIT $POSTFIX1
./postproc_ens.sh furniture $SPLIT $POSTFIX2
#fashion
./postproc.sh fashion $SPLIT $POSTFIX0
./postproc_ens.sh fashion $SPLIT $POSTFIX1
./postproc_ens.sh fashion $SPLIT $POSTFIX2
# -------- ensemble ---------
./ensemble.sh furniture $SPLIT $POSTFIX0 $POSTFIX1 $POSTFIX2 
./ensemble.sh fashion $SPLIT $POSTFIX0 $POSTFIX1 $POSTFIX2 

echo "Done all... "
