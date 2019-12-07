#!/bin/bash

#####################################################################################
# UPDATE #
echo "Updating package list"
sudo apt-get -y update >/dev/null 2>&1
sudo apt-get -y upgrade >/dev/null 2>&1

#####################################################################################
# INSTALLING FUNCTIONS #
# To reduce verbosity
function apt_install {
	for p in $@; do
		echo "installing $p"
    	sudo apt-get -y install $p >/dev/null 2>&1
	done
}

function pip_install {
	for p in $@; do
		echo "installing $p"
    	sudo pip3 install $p >/dev/null 2>&1
	done
}

#####################################################################################
# MODULES #

# Basics an dependencies
apt_install python3-pip libpq-dev python3-dev build-essential python3-setuptools
apt_install python3-nose g++ git libatlas3gf-base libatlas-dev pyyaml cython unixodbc-dev
apt_install python3-numpy python3-pandas
sudo pip3 install --upgrade pip
pip_install tensorflow tensorflow_hub tensorflow_datasets
pip_install ipython3 jupyter
pip_install progressbar2

# Scipy
apt_install python3-scipy 

# Scraping
apt_install python3-requests python3-scrapy
pip_install bs4 feedparser

# NLP
pip_install nltk

# Web framework
pip_install flask

# Visualization
apt_install matplotlib
pip_install seaborn bokeh

# DB connection
pip_install psycopg2 pymongo pyodbc

# AWS
pip_install boto3

# Scikit-learn
pip_install scikit-learn

# Theano
pip_install theano

# Keras
pip_install keras

# Tensorflow
#sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-2.0.0-cp27-none-linux_x86_64.whl >/dev/null 2>&1

# Others
apt_install libhdf5-7

printf '*** SETUP FINISHED! ***'
#####################################################################################