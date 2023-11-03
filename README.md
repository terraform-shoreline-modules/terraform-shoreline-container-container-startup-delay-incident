
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Container Startup Delay Incident
---

A container startup delay incident occurs when a containerized application takes longer than expected to start up or fails to start up altogether. This can cause a delay in the availability of the application, impacting the user experience and potentially leading to downtime. The cause of the delay can vary, including issues with the underlying infrastructure, configuration problems, or resource constraints.

### Parameters
```shell
export CONTAINER_NAME="PLACEHOLDER"

export PORT="PLACEHOLDER"

export IP_ADDRESS="PLACEHOLDER"

export CONTAINER_IMAGE="PLACEHOLDER"

export EXTERNAL_RESOURCE="PLACEHOLDER"

export RESOURCE_PATH="PLACEHOLDER"

export NEW_CPU_LIMIT="PLACEHOLDER"

export NEW_MEMORY_LIMIT="PLACEHOLDER"
```

## Debug

### Check the status of the container
```shell
sudo docker ps -a --filter name=${CONTAINER_NAME}
```

### View the logs of the container to see if there are any error messages
```shell
sudo docker logs ${CONTAINER_NAME}
```

### Check the resource usage of the container
```shell
sudo docker stats ${CONTAINER_NAME}
```

### Check the system resource usage to see if the host machine is under heavy load
```shell
top
```

### Check if there is another container or process using the same port
```shell
sudo lsof -i :${PORT}
```

### Check if there are any network connectivity issues
```shell
ping ${IP_ADDRESS}
```

### Check if the container is able to access external resources
```shell
sudo docker run --rm ${CONTAINER_IMAGE} curl ${EXTERNAL_RESOURCE}
```

### Check if the container has the necessary permissions to access its resources
```shell
sudo docker run --rm ${CONTAINER_IMAGE} ls -l ${RESOURCE_PATH}
```

## Repair

### Increase the resources available to the container, such as CPU or memory, to help it start up more quickly.
```shell


#!/bin/bash



# Set variables for container name and resource allocation

CONTAINER_NAME=${CONTAINER_NAME}

CPU_LIMIT=${NEW_CPU_LIMIT}

MEMORY_LIMIT=${NEW_MEMORY_LIMIT}



# Update the container's CPU and memory limits

docker update --cpu-shares $CPU_LIMIT --memory $MEMORY_LIMIT $CONTAINER_NAME


```