FROM debian:bullseye-slim
RUN apt-get update -q && apt-get install -q -y g++ wget
WORKDIR /TM-align
RUN wget https://zhanggroup.org/TM-align/TMalign.cpp
RUN g++ -static -O3 -ffast-math -lm -o TMalign TMalign.cpp
