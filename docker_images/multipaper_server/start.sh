#!/bin/sh
java -Xms128M -Xmx4096M -DmultipaperMasterAddress=master-multipaper-service.default.svc.cluster.local:35353 -jar server.jar