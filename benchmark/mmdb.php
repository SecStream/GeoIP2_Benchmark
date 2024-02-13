<?php

// This file was copied from MaxMind-DB-Reader-php and has the same license as the original file.

// This file has been MODIFIED from the original file. (for Apache License 2.0 4-b)

// original source: https://github.com/maxmind/GeoIP2-php/blob/main/bin/benchmark.php
/*
 * ## Copyright and License ##
 * This software is Copyright (c) 2013-2023 by MaxMind, Inc.
 * This is free software, licensed under the Apache License, Version 2.0.
 */

require 'geoip2.phar';

use GeoIp2\Database\Reader;
use GeoIp2\Exception\AddressNotFoundException;

$reader = new Reader('GeoIP2-City.mmdb');
$count = 40000;
$startTime = microtime(true);
for ($i = 0; $i < $count; ++$i) {
    $ip = long2ip(rand(0, 2 ** 32 - 1));

    try {
        $t = $reader->city($ip);
    } catch (AddressNotFoundException $e) {
    }
    if ($i % 1000 === 0) {
        echo $i . ' ' . $ip . "\n";
    }
}
$endTime = microtime(true);

$duration = $endTime - $startTime;
echo 'Requests per second: ' . $count / $duration . "\n";