#!/bin/sh
java -Xms128M -Xmx4096M -DmultipaperMasterAddress=master-multipaper-service.deafult.svc.cluster.local:35353 -jar server.jar