CREATE DATABASE IF NOT EXISTS geoip2;
USE geoip2;
create table geoip2_network (
  network_start varbinary(16) not null,
  network_end varbinary(16) not null,
  geoname_id int,
  registered_country_geoname_id int,
  represented_country_geoname_id int,
  is_anonymous_proxy bool,
  is_satellite_provider bool,
  postal_code text,
  latitude float,
  longitude float,
  accuracy_radius int,
  is_anycast bool,
  index(network_start),
  index(network_end)
);
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv6-Hex.csv'
into table geoip2_network
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows
(@network_start, @network_end, @geoname_id, @registered_country_geoname_id, @represented_country_geoname_id,
 @is_anonymous_proxy, @is_satellite_provider, @postal_code, @latitude, @longitude, @accuracy_radius, @is_anycast)
set network_start = unhex(@network_start),
    network_end = unhex(@network_end),
    geoname_id = nullif(@geoname_id, ''),
    registered_country_geoname_id = nullif(@registered_country_geoname_id, ''),
    represented_country_geoname_id = nullif(@represented_country_geoname_id, ''),
    is_anonymous_proxy = nullif(@is_anonymous_proxy, ''),
    is_satellite_provider = nullif(@is_satellite_provider, ''),
    postal_code = nullif(@postal_code, ''),
    latitude = nullif(@latitude, ''),
    longitude = nullif(@longitude, ''),
    accuracy_radius = nullif(@accuracy_radius, ''),
    is_anycast = nullif(@is_anycast, '');

load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv4-Hex.csv'
into table geoip2_network
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows
(@network_start, @network_end, @geoname_id, @registered_country_geoname_id, @represented_country_geoname_id,
 @is_anonymous_proxy, @is_satellite_provider, @postal_code, @latitude, @longitude, @accuracy_radius, @is_anycast)
set network_start = unhex(@network_start),
    network_end = unhex(@network_end),
    geoname_id = nullif(@geoname_id, ''),
    registered_country_geoname_id = nullif(@registered_country_geoname_id, ''),
    represented_country_geoname_id = nullif(@represented_country_geoname_id, ''),
    is_anonymous_proxy = nullif(@is_anonymous_proxy, ''),
    is_satellite_provider = nullif(@is_satellite_provider, ''),
    postal_code = nullif(@postal_code, ''),
    latitude = nullif(@latitude, ''),
    longitude = nullif(@longitude, ''),
    accuracy_radius = nullif(@accuracy_radius, ''),
    is_anycast = nullif(@is_anycast, '');

create table geoip2_location (
  geoname_id int not null,
  locale_code text not null,
  continent_code text,
  continent_name text,
  country_iso_code text,
  country_name text,
  subdivision_1_iso_code text,
  subdivision_1_name text,
  subdivision_2_iso_code text,
  subdivision_2_name text,
  city_name text,
  metro_code int,
  time_zone text,
  is_in_european_union bool,
  primary key (geoname_id, locale_code(5))
);
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-de.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-en.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-es.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-fr.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-ja.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-pt-BR.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-ru.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
load data infile '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-zh-CN.csv'
into table geoip2_location
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows (
  geoname_id, locale_code, continent_code, continent_name,
  @country_iso_code, @country_name, @subdivision_1_iso_code, @subdivision_1_name,
  @subdivision_2_iso_code, @subdivision_2_name, @city_name, @metro_code, @time_zone,
  is_in_european_union
)
set country_iso_code = nullif(@country_iso_code, ''),
    country_name = nullif(@country_name, ''),
    subdivision_1_iso_code = nullif(@subdivision_1_iso_code, ''),
    subdivision_1_name = nullif(@subdivision_1_name, ''),
    subdivision_2_iso_code = nullif(@subdivision_2_iso_code, ''),
    subdivision_2_name = nullif(@subdivision_2_name, ''),
    city_name = nullif(@city_name, ''),
    metro_code = nullif(@metro_code, ''),
    time_zone = nullif(@time_zone, '');
