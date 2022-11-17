FROM python
RUN pip3 install flask
COPY ./static /home/ipchecker/static/
COPY ./templates /home/ipchecker/templates/
COPY ipchecker.py /home/ipchecker/
EXPOSE 7070
CMD python3 /home/ipchecker/ipchecker.py
