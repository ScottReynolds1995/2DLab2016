#!/bin/bash

DEST=$HOME/GITHUB/codezoners-2/HTML
TOPIC=03_templating_with_Jinja2
OPTS="--archive"

mkdir -p $DEST/$TOPIC
rsync $OPTS README.md $DEST/$TOPIC/
rsync $OPTS presentation $DEST/$TOPIC/

for i in basics login superhero
do
    mkdir -p $DEST/$TOPIC/assignments/$i
    rsync $OPTS assignments/$i/HANDOUT/ $DEST/$TOPIC/assignments/$i/
done
