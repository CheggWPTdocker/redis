FROM cheggwpt/alpine:3.5

RUN	apk --update --no-cache add \
	--virtual .redis_service redis && \
	rm -rf /var/cache/apk/* 

# Environment
ENV LINK_SCHEME redis
ENV LINK_PASSWORD password
ENV LINK_PATH /0

# make the data volume
RUN mkdir /data && chown nobody:nobody /data

# setup the volume
WORKDIR /data

# Add the files
COPY container_confs /

# make sure script is executable
RUN chmod a+x /service.sh

# Expose the ports for nginx
EXPOSE 6379

# define the entrypoint
CMD ["service"]
