FROM ubuntu:latest 
RUN apt-get update && apt-get install -y figlet 
COPY print-message.sh /print-message.sh 
RUN chmod +x /print-message.sh 
CMD ["/print-message.sh"]
