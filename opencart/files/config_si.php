<?php

// HTTP
define('HTTP_SERVER', '{{ url }}');

// HTTPS
define('HTTPS_SERVER', '{{ url }}');
define('HTTPS_IMAGE', '{{ url }}');
// DIR
define('DIR_APPLICATION', '{{ path }}/public/catalog/');
define('DIR_SYSTEM', '{{ path }}/public/system/');
define('DIR_LANGUAGE', '{{ path }}/public/catalog/language/');
define('DIR_TEMPLATE', '{{ path }}/public/catalog/view/theme/');
define('DIR_CONFIG', '{{ path }}/public/system/config/');
define('DIR_IMAGE', '{{ path }}/public/image/');
define('DIR_CACHE', '{{ path }}/public/system/storage/cache/');
define('DIR_DOWNLOAD', '{{ path }}/public/system/storage/download/');
define('DIR_LOGS', '{{ path }}/public/system/storage/logs/');
define('DIR_MODIFICATION', '{{ path }}/public/system/storage/modification/');
define('DIR_UPLOAD', '{{ path }}/public/system/storage/upload/');

// DB
define('DB_DRIVER', '{{ dbdriver }}');
define('DB_HOSTNAME', '{{ dbhost }}');
define('DB_USERNAME', '{{ dbuser }}');
define('DB_PASSWORD', '{{ dbpass }}');
define('DB_DATABASE', '{{ database }}');
define('DB_PORT', '{{ dbport }}');
define('DB_PREFIX', '{{ dbprefix }}');
