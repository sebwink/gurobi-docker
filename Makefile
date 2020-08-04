DEFAULT_VERSION=9.0.2

DOCKER_USER ?= $(USER)

gurobi: gurobi@$(DEFAULT_VERSION)
	@#

gurobi@%:
	docker build --build-arg GUROBI_VERSION=$* \
			--build-arg GUROBI_MAJOR_VERSION=$(shell echo $* | cut -d'.' -f 1-2) \
			--build-arg GUROBI_VERSION_TAG=$(shell echo $* | sed 's/\.//g') \
			--build-arg GUROBI_USER=$(DOCKER_USER) \
			-t sebwink/gurobi:$* .

run: 
	docker run -it --rm --mac-address $(MAC_ADDRESS_FOR_GUROBI_DOCKER) --pid host -v $(GUROBI_LIC_PATH_DOCKER):/gurobi/lic sebwink/gurobi:$(DEFAULT_VERSION)

run@%: 
	docker run -it --rm --mac-address $(MAC_ADDRESS_FOR_GUROBI_DOCKER) --pid host -v $(GUROBI_LIC_PATH_DOCKER):/gurobi/lic sebwink/gurobi:$(DEFAULT_VERSION) $*
