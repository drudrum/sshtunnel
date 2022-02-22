if [ -z $KEY ]; then
  keyFile="/sshtunnel/generatedKey"
  if [ ! -f $keyFile ]; then
    ssh-keygen -f $keyFile -t ecdsa -b 521
  fi
  KEY=$keyFile
fi

if [ "$REMOTE" != "true" ]; then
	ssh \
		-o StrictHostKeyChecking=no \
		-Nn $SSH_USER@$SSH_HOST \
		-p $SSH_PORT \
		-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
		-i $KEY
else
	ssh \
		-o StrictHostKeyChecking=no \
		-Nn $SSH_USER@$SSH_HOST \
		-p $SSH_PORT \
		-R 0.0.0.0:$REMOTE_PORT:$CONTAINER_HOST:$CONTAINER_PORT \
		-i $KEY
fi

