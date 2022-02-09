
if [ "$REMOTE" != "true" ]; then
	ssh \
		-o StrictHostKeyChecking=no \
		-Nn $TUNNEL_USER@$TUNNEL_HOST \
		-p $TUNNEL_PORT \
		-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT \
		-i $KEY
else
	ssh \
		-o StrictHostKeyChecking=no \
		-Nn $TUNNEL_USER@$TUNNEL_HOST \
		-p $TUNNEL_PORT \
		-R 0.0.0.0:$REMOTE_PORT:$CONTAINER_HOST:$CONTAINER_PORT \
		-i $KEY
fi

