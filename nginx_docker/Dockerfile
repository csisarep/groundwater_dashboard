FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
RUN echo "File removed"
COPY default.conf /etc/nginx/conf.d
RUN echo "File added"
RUN mkdir /opt/staticfiles

