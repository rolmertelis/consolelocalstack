#!/bin/bash
# A PARTIR DAQUI é parte comum a todos os scripts de criação de recursos
helpFunction()
{
   echo ""
   echo "Uso correto: passar os parâmetros: -a parameterA -b parameterB"
   echo -e "\t-a Parâmetro a = caminho do dir no container, onde rodam os scripts após pronto"
   echo -e "\t-b Uma mensagem amigável, indicando que a criação dos secrets iniciou"
   exit 1 # Exit script after printing help
}

while getopts "a:b:" opt
do
   case "$opt" in
      a ) parameterA="$OPTARG" ;;
      b ) parameterB="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ] || [ -z "$parameterB" ]
then
   echo "Um ou mais parametros estao sem valor";
   helpFunction
fi

GREEN='\033[0;32m'
BASE_PATH="$parameterA"
echo -e "$parameterB"
# ATÉ AQUI é a  parte comum a todos os scripts de criação de recursos
# ********************************************************************


create_sns_topics()
{
  for FILE in "$parameterA"/*
  do
    echo -e "${GREEN}*** Creating sns topic from file: $FILE"
    bash "${FILE}"
  done
}

if [ "$(ls -A $parameterA)" ]; then
  create_sns_topics
else
  echo "has no files"
fi
