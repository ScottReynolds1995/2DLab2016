#!/bin/bash

DEST=$HOME/GITHUB/codezoners-2/HTML
TOPIC=02_forms_controls_inputs
OPTS="--archive"

mkdir -p $DEST/$TOPIC
rsync $OPTS README.md $DEST/$TOPIC/
rsync $OPTS presentation $DEST/$TOPIC/

for i in basic-params posted-params flags flags-2 iframes
do
    mkdir -p $DEST/$TOPIC/assignments/$i
    rsync $OPTS assignments/$i/HANDOUT/ $DEST/$TOPIC/assignments/$i/
done
