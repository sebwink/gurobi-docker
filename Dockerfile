FROM debian:buster-slim

ARG GUROBI_USER
ARG GUROBI_MAJOR_VERSION
ARG GUROBI_VERSION
ARG GUROBI_VERSION_TAG

RUN apt-get update \
    && apt-get upgrade -y \
	&& apt-get install -y wget 

RUN groupadd ${GUROBI_USER} && useradd -r -g ${GUROBI_USER} ${GUROBI_USER} \
	&& mkdir /gurobi \
    && chown -R ${GUROBI_USER}:${GUROBI_USER} /gurobi 

WORKDIR /gurobi
USER ${GUROBI_USER}

RUN wget http://packages.gurobi.com/${GUROBI_MAJOR_VERSION}/gurobi${GUROBI_VERSION}_linux64.tar.gz \
    && tar xvfz gurobi${GUROBI_VERSION}_linux64.tar.gz \
	&& cd gurobi${GUROBI_VERSION_TAG}/linux64/lib \
	&& rm libgurobi_c++.a \
    && ln -s libgurobi_g++5.2.a libgurobi_c++.a

WORKDIR /gurobi/gurobi${GUROBI_VERSION_TAG}/linux64/examples/build 

ENV LD_LIBRARY_PATH=/gurobi/gurobi${GUROBI_VERSION_TAG}/linux64/lib
ENV PATH=/gurobi/gurobi${GUROBI_VERSION_TAG}/linux64/bin:${PATH}
ENV GUROBI_HOME=/gurobi/gurobi${GUROBI_VERSION_TAG}/linux64
ENV GRB_LICENSE_FILE=/gurobi/lic/gurobi.lic

CMD ["gurobi.sh"]
