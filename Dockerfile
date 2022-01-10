FROM ubuntu:bionic
ADD Zotero_linux-x86_64 /opt/zotero
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y libgtk-3-0 libx11-xcb1 libdbus-glib-1-2 libxt6 mupdf xdg-utils
RUN groupadd --gid 1000 dmaus && useradd --uid 1000 --gid 1000 --create-home dmaus
RUN su dmaus -c "mkdir /home/dmaus/.config"
RUN su dmaus -c "xdg-mime default mupdf.desktop application/pdf"
RUN chown -R dmaus:dmaus /opt/zotero
USER dmaus
CMD /opt/zotero/zotero
