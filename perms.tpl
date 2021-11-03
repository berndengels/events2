#!/bin/sh
group=psaserv

chgrp -R $group storage/logs storage/framework storage/app storage/media-library bootstrap/cache database/snapshots
chmod -R ugo+rwx storage/logs storage/framework storage/app storage/media-library bootstrap/cache database/snapshots
chgrp -R $group .
chmod -R g+rwX .
find . -type d -exec chmod g+s '{}' +
