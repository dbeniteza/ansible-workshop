#!/bin/bash

echo "Generating SSH key..."

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

echo "Copy key to nodes..."

for node in node1 node2
do
    sshpass -p redhat ssh-copy-id \
    -o StrictHostKeyChecking=no \
    student@$node
done

echo "Bootstrap finished."