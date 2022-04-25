

FROM ubuntu:20.04
CMD ["bash"]
RUN set -ex; \
apt-get update; \
apt install tzdata -y;
ENV TZ="America/New_York"

RUN apt install -y npm;



RUN mkdir -p /SpeedServer/htmls
COPY htmls/* /SpeedServer/htmls/
COPY app.js /SpeedServer/   
RUN cd /SpeedServer 

RUN npm install formidable

