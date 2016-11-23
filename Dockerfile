FROM cheggwpt/alpine:3.4
MAINTAINER jgilley@chegg.com

RUN	apk --update --no-cache add \
	--virtual .redis_service redis && \
	rm -rf /var/cache/apk/* 

# Add the service script
COPY service.sh /service.sh

# Environment
ENV LINK_SCHEME redis
ENV LINK_PASSWORD password
ENV LINK_PATH /0

# Make the data dir
# chown it to nobody
RUN mkdir /data && \
	chown nobody:nobody /data

# expose the volume
VOLUME ["/data"]

# set the working directory
WORKDIR /data

# Expose the ports for nginx
EXPOSE 6379

# default command for entrypoint.sh
CMD ["service"]
