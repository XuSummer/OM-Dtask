CREATE EXTERNAL TABLE IF NOT EXISTS iap (
        ts bigint COMMENT 'Client time in milliseconds',
        fit int COMMENT 'Client first install App time, in seconds',
        flt int COMMENT 'The first time the client opens the App, in seconds (uid file creation time)',
        zo int COMMENT 'Time zone offset in minutes. For example, Beijing time zone zo = 480',
        session string COMMENT 'Session ID, UUID generated when the app is initialized',
        uid string COMMENT 'User ID, the unique user ID generated by the SDK',
        did string COMMENT 'Device ID, corresponding to dtype',
        dtype int COMMENT 'Device ID type, 1:IDFA, 2:GAID, 3:FBID, 4:HUAWEIID',
        lang string COMMENT 'language code',
        langname string COMMENT 'language name',
        jb int COMMENT 'jailbreak status, 0: normal, 1: jailbreak, no transmission during normal',
        bundle string COMMENT 'The current app package name',
        make string COMMENT 'device maker',
        brand string COMMENT 'device brands',
        model string COMMENT 'device model',
        osv string COMMENT 'os version',
        appv string COMMENT 'app version',
        width int COMMENT 'screen or placement width',
        height int COMMENT 'screen or placement height',
        contype int COMMENT 'Connection Type',
        carrier string COMMENT 'Network Operator Name',
        lip string COMMENT 'local ip',
        lcountry string COMMENT '((NSLocale currentLocale)localeIdentifier), Locale.getCountry()',
        fm int COMMENT 'Free hard disk space, unit M',
        battery int COMMENT 'Remaining battery percentage',
        btch int COMMENT 'Whether charging, 0: No, 1: Yes',
        ip string COMMENT '',
        country string COMMENT '',
        region string COMMENT '',
        city string COMMENT '',
        plat int COMMENT '',
        sdkv string COMMENT '',
        apiv int COMMENT '',
        reqId string COMMENT '',
        serverTs bigint COMMENT '',
        ua string COMMENT '',
        abt int COMMENT '',
        dcenter int COMMENT '',
        snode int COMMENT '',
        publisherId int COMMENT '',
        pubAppId int COMMENT '',

         cur string COMMENT  'currency',
        iap decimal(16, 6) COMMENT 'iap price',
        iapt decimal(16, 6) COMMENT 'iap total price',
        iapUsd decimal(16, 6),
        status int,
        msg string

) PARTITIONED BY (
         y string,
         m string,
         d string,
         h string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH
    SERDEPROPERTIES ('serialization.format' = '1' )
    LOCATION 's3://[(${s3Bucket})]/[(${tableDataPath})]/iap/'
    TBLPROPERTIES ('has_encrypted_data'='false')
;



