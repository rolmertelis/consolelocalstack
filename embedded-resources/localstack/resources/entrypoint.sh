#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'

echo -e ""
echo -e "${RED}**** Iniciando criacao de recursos"

PATH_BASE=/etc/localstack/init/ready.d

# **************************************************** #
# *********************** SECRETS ******************** #
# **************************************************** #
PATH_RESOURCE="$PATH_BASE/secrets"
PATH_BASH="$PATH_RESOURCE/cria-recursos.sh"
PATH_SCRIPTS="$PATH_RESOURCE/scripts"
MESSAGE="${BLUE}*** Creating secrets from files in $PATH_SCRIPTS"
if [ -e "$PATH_RESOURCE" ]; then
  bash "$PATH_BASH" -a "$PATH_SCRIPTS" -b "$MESSAGE"
fi

# **************************************************** #
# *********************** SQS QUEUES ***************** #
# **************************************************** #
PATH_RESOURCE="$PATH_BASE/sqs-queues"
PATH_BASH="$PATH_RESOURCE/cria-recursos.sh"
PATH_SCRIPTS="$PATH_RESOURCE/scripts"
MESSAGE="${BLUE}*** Creating sqs queues from files in $PATH_SCRIPTS"
if [ -e "$PATH_RESOURCE" ]; then
  bash "$PATH_BASH" -a "$PATH_SCRIPTS" -b "$MESSAGE"
fi

# **************************************************** #
# *********************** SNS TOPICS ***************** #
# **************************************************** #
PATH_RESOURCE="$PATH_BASE/sns-topics"
PATH_BASH="$PATH_RESOURCE/cria-recursos.sh"
PATH_SCRIPTS="$PATH_RESOURCE/scripts"
MESSAGE="${BLUE}*** Creating sns topics from files in $PATH_SCRIPTS"
if [ -e "$PATH_RESOURCE" ]; then
  bash "$PATH_BASH" -a "$PATH_SCRIPTS" -b "$MESSAGE"
fi


#if [ -e "$BASE_PATH/scripts-sns-topics" ]; then
#  bash $BASE_PATH/sns/cria-recursos.sh -a "$BASE_PATH" -b "${BLUE}*** Creating sns topics"
#fi
#
#if [ -e "$BASE_PATH/scripts-sqs-queues" ]; then
#  bash $BASE_PATH/sqs/create-sqs-queues.sh -a "$BASE_PATH" -b "${BLUE}*** Creating sqs queues"
#fi

echo -e "${RED}**** Criacao de recursos finalizada *"
echo -e ""
