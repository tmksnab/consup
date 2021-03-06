
# -------------------------------------------------------------------------------
# Install App

# https://releases.mattermost.com/3.8.2/mattermost-team-3.8.2-linux-amd64.tar.gz
VER=3.9.0
DEST=/opt
setup() {
  local prj=$1
  local name=${prj}-team-$VER-linux-amd64
  echo "Setup $prj v $VER"
  curl -OL https://releases.mattermost.com/$VER/$name.tar.gz \
    && tar -xaf $name.tar.gz \
    && mv $prj $DEST/$prj \
    && rm -rf $name.tar.gz
}

setup mattermost

CFG=/opt/mattermost/config/config.json
mv $CFG $CFG.orig

# Mattermost IRC service
# https://github.com/42wim/matterircd/releases/download/v0.11.3/matterircd-linux64
VER=0.11.4
D=/usr/local/sbin
[ -d $D ] || mkdir -p $D
curl -OL https://github.com/42wim/matterircd/releases/download/v${VER}/matterircd-linux64 \
  && chmod a+x matterircd-linux64 \
  && mv matterircd-linux64 $D/
