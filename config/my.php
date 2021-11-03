<?php
return [
    'defaultEventTime'  => env('DEFAULT_EVENT_TIME', '20:00'),
//    'maxImageHeight'    => env('MAX_IMAGE_HEIGHT', 300),
//    'maxImageWidth'     => env('MAX_IMAGE_WIDTH', 533),
//    'maxImageFileSize'  => env('MAX_IMAGE_FILESIZE', 16), // MB
    'paginationLimit' 	=> 10,
    'eventsPaginationLimit'	=> 30,
    'periodicPositions'  => [
        '1'           => 'jede Woche',
        '2'           => 'jeden zweiten',
        '3'           => 'jeden dritten',
        '4'           => 'jeden vierten',
        'first'     => 'monatlich jeden ersten',
        'second'    => 'monatlich jeden zweiten',
        'third'     => 'monatlich jeden dritten',
        'last'      => 'monatlich jeden letzten',
    ],
    'periodicWeekdays'   => [
        'monday'        => 'Montag',
        'tuesday'       => 'Dienstag',
        'wednesday'     => 'Mittwoch',
        'thursday'      => 'Donnerstag',
        'friday'        => 'Freitag',
        'saturday'      => 'Samstag',
        'sunday'        => 'Sonntag',
    ],
    'musicStyles' => [
        'enabled' => env('USE_MUSIC_STYLES', false),
    ],
    'location' => [
        'lat'   => env('LOCATION_LAT', 0),
        'lng'   => env('LOCATION_LNG', 0),
        'zoom'   => env('LOCATION_ZOOM', 10),
    ],
];
