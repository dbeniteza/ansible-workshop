lab-up:
	cd deployment/lab-environment && podman-compose up -d

lab-down:
	cd deployment/lab-environment && podman-compose down

lab-shell:
	podman exec -it ansible-controller bash

lab-test:
	podman exec -it ansible-controller ansible all -m ping