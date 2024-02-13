<?php

// This file was copied from MaxMind-DB-Reader-php and has the same license as the original file.

// This file has been MODIFIED from the original file. (for Apache License 2.0 4-b)

// original source: https://github.com/maxmind/GeoIP2-php/blob/main/bin/benchmark.php
/*
 * ## Copyright and License ##
 * This software is Copyright (c) 2013-2023 by MaxMind, Inc.
 * This is free software, licensed under the Apache License, Version 2.0.
 */

$dbh = new PDO('pgsql:host=localhost;port=5432', 'postgres', 'password');
$count     = 50000;
$startTime = microtime(true);
for ($i = 0; $i < $count; ++$i) {
    $ip = long2ip(rand(0, 2 ** 32 - 1));
    $q  = $dbh->query(
        "select * from geoip2_network net where network >>= '$ip';"
    )->fetchAll();
    if ($i % 1000 === 0) {
        echo $i . ' ' . $ip . "\n";
        // print_r($t);
    }
}
$endTime = microtime(true);

$duration = $endTime - $startTime;
echo 'Requests per second: ' . $count / $duration . "\n";