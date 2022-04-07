#!/bin/sh
if [ -z $KEY ]; then
  keyFile="/sshtunnel/generatedKey"
  if [ ! -f $keyFile ]; then
    ssh-keygen -f $keyFile -t ecdsa -b 521
  fi
  KEY=$keyFile
fi

tunnelArgs=$ARGS
if [ ! -z $REMOTE_PORT ]; then
  if [ "$REMOTE" != "true" ]; then
    tunnelArgs="$tunnelArgs -L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT"
  else
    tunnelArgs="$tunnelArgs -R 0.0.0.0:$REMOTE_PORT:$CONTAINER_HOST:$CONTAINER_PORT"
  fi
fi

# echo "ssh -o StrictHostKeyChecking=no -Nn $SSH_USER@$SSH_HOST -p $SSH_PORT -i $KEY $tunnelArgs"
ssh -o StrictHostKeyChecking=no -Nn -T -o ServerAliveInterval=30 -o ExitOnForwardFailure=yes $SSH_USER@$SSH_HOST -p $SSH_PORT -i $KEY $tunnelArgs
