#!/bin/sh
function installant() {
# get the latest version number
antarchive=$(wget -O - -q http://www.apache.org/dist/ant/binaries/ | grep 'tar.bz2<' | sed 's/^.*<a .*>\(.*\)<\/a>.*$/\1/')
if [ -z "$antarchive" ]; then
    antarchive="apache-ant-1.8.2-bin.tar.bz2"
fi

pushd /usr/local
wget -O - "http://www.apache.org/dist/ant/binaries/$antarchive" |
tar xj
if [ $? -ne 0 ]; then
    echo "Failed getting ant binary from 'http://www.apache.org/dist/ant/binaries/$antarchive'" >&2
    return 1
fi
if [ -e /usr/local/apache-ant ]; then
    mv /usr/local/apache-ant /usr/local/old.apache-ant
fi
mv /usr/local/`basename $antarchive -bin.tar.bz2` /usr/local/apache-ant
popd

mkdir -p /etc/profile.d/
echo 'export ANT_HOME=/usr/local/apache-ant
export PATH=$PATH:/usr/local/apache-ant/bin' > /etc/profile.d/ant.sh
chmod +x /etc/profile.d/ant.sh

/usr/local/apache-ant/bin/ant -version
}

installant