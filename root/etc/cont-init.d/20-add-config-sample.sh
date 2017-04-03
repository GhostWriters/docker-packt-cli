#!/usr/bin/with-contenv sh
CFG=/config/configFile.cfg
# This copies the sample config in place if not one present
if [ ! -f $CFG ]; then
     echo "No config file, providing sample"
     cp /root/Packt-Publishing-Free-Learning/src/configFileTemplate.cfg $CFG
fi
# If environment arguments have been provided, switch the values in the sample config to these
echo "ENV PACKTEMAIL provided as '$PACKTEMAIL'"
if [ -n "$PACKTEMAIL" ]; then
 sed -i s/email=.*/email=$PACKTEMAIL/ $CFG
fi
echo "ENV PACKTPASSWORD provided as '$PACKTPASSWORD'"
if [ -n "$PACKTPASSWORD" ]; then
 sed -i s/password=.*/password=$PACKTPASSWORD/ $CFG
fi
echo "Replacing path with /data"
sed -i "s/downloadFolderPath:.*/downloadFolderPath: \/data/" $CFG
