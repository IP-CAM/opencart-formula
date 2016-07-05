<?php

// HTTP
define('HTTP_SERVER', '{{ url }}');

// HTTPS
define('HTTPS_SERVER', '{{ url }}');
define('HTTPS_IMAGE', '{{ url }}');
// DIR
define('DIR_APPLICATION', '{{ path }}/catalog/');
define('DIR_SYSTEM', '{{ path }}/system/');
define('DIR_LANGUAGE', '{{ path }}/catalog/language/');
define('DIR_TEMPLATE', '{{ path }}/catalog/view/theme/');
define('DIR_CONFIG', '{{ path }}/system/config/');
define('DIR_IMAGE', '{{ path }}/image/');
define('DIR_CACHE', '{{ path }}/system/storage/cache/');
define('DIR_DOWNLOAD', '{{ path }}/system/storage/download/');
define('DIR_LOGS', '{{ path }}/system/storage/logs/');
define('DIR_MODIFICATION', '{{ path }}/system/storage/modification/');
define('DIR_UPLOAD', '{{ path }}/system/storage/upload/');

// DB
define('DB_DRIVER', '{{ dbdriver }}');
define('DB_HOSTNAME', '{{ dbhost }}');
define('DB_USERNAME', '{{ dbuser }}');
define('DB_PASSWORD', '{{ dbpass }}');
define('DB_DATABASE', '{{ database }}');
define('DB_PORT', '{{ dbport }}');
define('DB_PREFIX', '{{ dbprefix }}');
