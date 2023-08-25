workon cv
## Install python-v4l2 library from source
sudo apt install -y libv4l-dev
cd ~ || exit 1
sudo apt-get install -y libv4l-dev v4l-utils
git clone https://github.com/jnohlgard/python-v4l2capture
cd ~/python-v4l2capture || exit 1
python setup.py build
python setup.py install

pip install simplejson