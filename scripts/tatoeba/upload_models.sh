#!/bin/bash

for FILE in converted/*; do 
  model_name=`basename $FILE`
  huggingface-cli repo create $model_name -y
  git clone https://hf-mirror.com/Helsinki-NLP/$model_name
  mv $FILE/* $model_name/
  cd $model_name
  git add . && git commit -m "initial commit" 
  git push
  cd ..
done
