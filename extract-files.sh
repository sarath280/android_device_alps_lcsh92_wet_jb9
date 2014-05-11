#!/bin/sh

VENDOR=zopo
DEVICE=zp998

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi

DUMP=/repos/MTK6592/dump201403
cp $DUMP/$FILE $BASE/$FILE
#adb pull /system/$FILE $BASE/$FILE

done

# some extra stuff
cp $DUMP/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6592.so
cp $DUMP/lib/libaudio.primary.default.so $BASE/lib/hw/audio.primary.mt6592.so

#adb pull /system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
#adb pull /system/lib/hw/libaudio.r_submix.default.so $BASE/lib/hw/audio.r_submix.mt6589.so

./setup-makefiles.sh
