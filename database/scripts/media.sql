-- events
INSERT IGNORE INTO images (event_id, external_filename, internal_filename, title, filesize, width, height)
SELECT model_id, name, file_name, REPLACE(JSON_EXTRACT(custom_properties, '$.name'), '"', ''), size, JSON_EXTRACT(custom_properties, '$.width'), JSON_EXTRACT(custom_properties, '$.height') FROM media WHERE model_type = 'App\\Models\\Event';

-- preriodics
INSERT IGNORE INTO images (event_periodic_id, external_filename, internal_filename, title, filesize, width, height)
SELECT model_id, name, file_name, REPLACE(JSON_EXTRACT(custom_properties, '$.name'), '"', ''), size, JSON_EXTRACT(custom_properties, '$.width'), JSON_EXTRACT(custom_properties, '$.height') FROM media WHERE model_type = 'App\\Models\\EventPeriodic';

-- templates
INSERT IGNORE INTO images (event_template_id, external_filename, internal_filename, title, filesize, width, height)
SELECT model_id, name, file_name, REPLACE(JSON_EXTRACT(custom_properties, '$.name'), '"', ''), size, JSON_EXTRACT(custom_properties, '$.width'), JSON_EXTRACT(custom_properties, '$.height') FROM media WHERE model_type = 'App\\Models\\EventTemplate';
