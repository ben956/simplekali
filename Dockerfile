FROM kalilinux/kali-linux-docker
WORKDIR ~
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y kali-linux
RUN apt-get -y install nmap
RUN apt-get -y install metasploit-framework
ADD database.yml /usr/share/metasploit-framework/config/
RUN git clone https://github.com/offensive-security/exploit-database.git
RUN exploit-database/searchsploit -u; exit 0
RUN apt-get -y install sqlmap
