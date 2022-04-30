FROM ubuntu:20.04
CMD ["bash"]
RUN set -ex; \
apt-get update; \
apt install tzdata -y;
ENV TZ="America/New_York"

RUN apt install -y npm; 
#RUN apt install -y wget;




RUN mkdir -p /SpeedServer/htmls
COPY htmls/* /SpeedServer/htmls/
RUN dd if=/dev/urandom of=/SpeedServer/htmls/10M.dat bs=1000 count=10000
RUN dd if=/dev/urandom of=/SpeedServer/htmls/100M.dat bs=1000 count=100000
RUN dd if=/dev/urandom of=/SpeedServer/htmls/200M.dat bs=1000 count=200000
RUN dd if=/dev/urandom of=/SpeedServer/htmls/500M.dat bs=1000 count=500000
COPY app.js /SpeedServer/
RUN cd /SpeedServer

RUN npm install formidable
# RUN wget https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg