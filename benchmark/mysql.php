<?php

// This file was copied from MaxMind-DB-Reader-php and has the same license as the original file.

// This file has been MODIFIED from the original file. (for Apache License 2.0 4-b)

// original source: https://github.com/maxmind/GeoIP2-php/blob/main/bin/benchmark.php
/*
 * ## Copyright and License ##
 * This software is Copyright (c) 2013-2023 by MaxMind, Inc.
 * This is free software, licensed under the Apache License, Version 2.0.
 */

$dbh = new PDO('mysql:host=127.0.0.1;port=3306;dbname=geoip2', 'root', 'password');
$count     = 50000;
$startTime = microtime(true);
for ($i = 0; $i < $count; ++$i) {
    $ip = long2ip(rand(0, 2 ** 32 - 1));
    $q  = $dbh->query(
        "select *
from (
  select *
  from geoip2_network
  where inet6_aton('$ip') >= network_start
  order by network_start desc
  limit 1
) net
where inet6_aton('$ip') <= network_end;"
    )->fetchAll();
    if ($i % 1000 === 0) {
        echo $i . ' ' . $ip . "\n";
        // print_r($t);
    }
}
$endTime = microtime(true);

$duration = $endTime - $startTime;
echo 'Requests per second: ' . $count / $duration . "\n";