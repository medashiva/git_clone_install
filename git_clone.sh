#!/bin/ksh
#CURRENT_DIR=/home/saikiran/shivaplayground/shell_playground
CURRENT_DIR=`pwd`
echo "please enter your repo link"
read input_variable
echo $input_variable
REPOURL=$input_variable
#REPOURL=$input_variable
gitdir=`basename $input_variable .git`

if  [[ ! -d $CURRENT_DIR/$gitdir ]]
then 
	git clone $REPOURL 
elif [[ ! -d $CURRENT_DIR/$gitdir/.git ]]
then
	mv CURRENT_DIR/$gitdir CURRENT_DIR/$gitdir"_backup" 
	git clone $REPOURL
fi
cd $CURRENT_DIR/twiliosms
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
