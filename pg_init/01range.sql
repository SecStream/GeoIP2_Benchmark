create table geoip2_range_network (
  network_start bytea not null,
  network_end bytea not null,
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
\copy geoip2_range_network from '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv4-Hex_escaped.csv' with (format csv, header);
\copy geoip2_range_network from '/docker-entrypoint-initdb.d/GeoIP2-City-Blocks-IPv6-Hex_escaped.csv' with (format csv, header);
create index on geoip2_range_network(network_start);
create index on geoip2_range_network(network_end);