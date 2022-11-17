#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp ipchecker.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip3 install flask" >> tempdir/Dockerfile

echo "COPY ./static /home/ipchecker/static/" >>  tempdir/Dockerfile
echo "COPY ./templates /home/ipchecker/templates/" >>  tempdir/Dockerfile
echo "COPY ipchecker.py /home/ipchecker/" >>  tempdir/Dockerfile

echo "EXPOSE 7070" >>  tempdir/Dockerfile
echo "CMD python3 /home/ipchecker/ipchecker.py" >>  tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 7070:7070 --name samplerunning sampleapp
docker ps -a

