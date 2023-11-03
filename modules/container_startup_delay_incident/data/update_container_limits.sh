

#!/bin/bash



# Set variables for container name and resource allocation

CONTAINER_NAME=${CONTAINER_NAME}

CPU_LIMIT=${NEW_CPU_LIMIT}

MEMORY_LIMIT=${NEW_MEMORY_LIMIT}



# Update the container's CPU and memory limits

docker update --cpu-shares $CPU_LIMIT --memory $MEMORY_LIMIT $CONTAINER_NAME