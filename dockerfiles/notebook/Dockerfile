FROM jupyter/datascience-notebook:python-3.9.6
#FROM jupyter/datascience-notebook:d53a302fbcd0
USER root
ENV DEBCONF_NOWARNINGS yes

# postgresql 13.x対応を行っている (参考: https://www.postgresql.org/download/linux/ubuntu/ )
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt update \
    && apt-get update \
    && apt-get install -y --no-install-recommends lsb-release gnupg \
    && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev \
    && apt-get remove -y lsb-release gnupg \
    && apt-get autoremove -y \
    && apt-get install -y fonts-ipafont fonts-ipaexfont \
    && cp /usr/share/fonts/opentype/ipaexfont-gothic/ipaexg.ttf /opt/conda/lib/python3.9/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf \
    && sed -i "s/font.family.*:.*sans-serif/font.family : IPAexGothic/g" /opt/conda/lib/python3.9/site-packages/matplotlib/mpl-data/matplotlibrc \
    && rm -rf ./.cache \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get -y install apt-transport-https ca-certificates gnupg \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get install google-cloud-sdk -y \
    && rm -rf /var/lib/apt/lists/* 

ARG username=jovyan
ARG password=jovyan12345
RUN echo "${username}:${password}" | chpasswd
RUN gpasswd -a ${username} sudo
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

USER jovyan
WORKDIR /home/jovyan
COPY Pipfile .
COPY Pipfile.lock .

# Jupyter LabでRを扱えるようにする処理も行っている (参考: https://www.tmp1024.com/install-jupyter-lab-with-r-on-mac/#toc6 )
RUN pip install --no-cache-dir pipenv==2021.5.29 \
    && pipenv install --system \
    && rm Pipfile* \
    && Rscript -e "install.packages(c('IRkernel', 'DBI', 'RPostgreSQL', 'rsample'), dependencies = TRUE, error = TRUE, repos='https://cran.r-project.org')" \
    && Rscript -e "IRkernel::installspec()"
#RUN Rscript -e "install.packages(c('DBI', 'RPostgreSQL', 'recipes'), dependencies = TRUE, error = TRUE, repos='https://cran.r-project.org')"
