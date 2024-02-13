create table geoip2_network (
  network cidr not null,
  geoname_id int,
  registered_country_geoname_id int,
  represented_country_geoname_id int,
  is_anonymous_proxy bool,
  is_satellite_provider bool,
  postal_code text,
  latitude numeric,
  longitude numeric,
  accuracy_radius int,
  is_anycast bool
);
\copy geoip2_network from '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv4.csv' with (format csv, header);
\copy geoip2_network from '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv6.csv' with (format csv, header);
create index on geoip2_network using gist (network inet_ops);
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
  is_in_european_union bool not null,
  primary key (geoname_id, locale_code)
);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-de.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-en.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-es.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-fr.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-ja.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-pt-BR.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-ru.csv' with (format csv, header);
\copy geoip2_location from '/docker-entrypoint-initdb.d/GeoIP2-City-Locations-zh-CN.csv' with (format csv, header);
