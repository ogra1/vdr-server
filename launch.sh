#! /bin/sh

LIVE=""
STREAMDEV=""
EPGSEARCH=""
EPGFIXER=""
DVBAPI=""

if [ "$(snapctl get live)" = "true" ]; then
  LIVE="-Plive"
fi

if [ "$(snapctl get streamdev-server)" = "true" ]; then
  STREAMDEV="-Pstreamdev-server"
fi

if [ "$(snapctl get epgsearch)" = "true" ]; then
  EPGSEARCH="-Pepgsearch"
fi

if [ "$(snapctl get epgfixer)" = "true" ]; then
  EPGFIXER="-Pepgfixer"
fi

if [ "$(snapctl get dvbapi)" = "true" ]; then
  DVBAPI="-Pdvbapi"
fi

$SNAP/usr/bin/vdr -P'vnsiserver -t 5' $LIVE $STREAMDEV $EPGSEARCH $EPGFIXER $DVBAPI
