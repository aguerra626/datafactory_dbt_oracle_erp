/*
ALTER session SET nls_timestamp_format = 'YYYY-MM-DD HH24:MI:SS';
-- this changes THE display output OF TIMESTAMP DATA types.

ALTER session SET nls_timestamp_tz_format;
--NOT used currently but AS IN example this changes THE display output OF TIMESTAMP WITH TIME ZONE.
*/
SELECT
    from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE 'America/New_York' AS est_datetimezone,
    CAST(from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE 'America/New_York' AS TIMESTAMP) AS est_datetime,
    CAST(from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE 'America/New_York' AS DATE) AS est_date,
    from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE 'UTC' AS utc_datetimezone,
    from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE 'America/Chicago' AS cst_datetimezone,
    from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE '-05:00' AS utc_offset_est,
    from_tz(CAST(systimestamp AS TIMESTAMP), 'America/New_York') AT TIME ZONE '-06:00' AS utc_offset_cst,
    systimestamp,-- systimestamp IS DATA TYPE OF TIMESTAMP WITH TIME ZONE and not specifically TIMESTAMP.sysdate,
    to_char(systimestamp,'DD-MON-YY HH24:MI:SS') AS to_char_systimestamp,
    CAST(systimestamp AS TIMESTAMP) AS cast_to_timestamp
FROM
    dual;
