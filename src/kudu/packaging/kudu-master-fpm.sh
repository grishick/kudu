fpm -s dir -t deb -n kudu-master -v 1.11.1 --deb-user kudu --after-install ../../src/kudu/packaging/postinst.sh --config-files ../../src/kudu/packaging/kudu-master-flagfile ../../src/kudu/packaging/kudu-master-flagfile=/var/run/kudu-master/gflagfile bin/kudu-master=/usr/local/sbin/
