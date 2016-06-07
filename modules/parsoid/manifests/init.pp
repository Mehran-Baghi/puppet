class parsoid {
    include apt

    apt::source { 'parsoid':
        location => 'http://releases.wikimedia.org/debian',
        release  => 'jessie-mediawiki',
        repos    => 'main',
        key      => {
            'id'     => 'BE0C9EFB1A948BF3C8157E8B811780265C927F7C',
            'server' => 'hkp://keyserver.ubuntu.com:80',
        },
    }

    package { 'parsoid':
        ensure  => present,
        require => Apt::Source['parsoid'],
    }

    service { 'parsoid':
        ensure    => running,
        require   => Package['parsoid'],
        subscribe => File['/etc/mediawiki/parsoid/settings.js'],
    }

    # The name of the wiki (or the URL in form <wikiname>.miraheze.org. DO NOT INCLUDE WIKI.
    $wikis = [
                '8station',
                'aacenterpriselearning',
                'adnovum',
                'aescapes',
                'air',
                'alanpedia',
                'allbanks2',
                'aktpos',
                'applebranch',
                'arabudland',
                'aryaman',
                'atheneum',
                'augustinianum',
                'bgo',
                'biblicalwiki',
                'braindump',
                'carving',
                'cbmedia',
                'cec',
                'chandrusweths',
                'christipedia',
                'ciso',
                'civitas',
                'clementsworldbuilding',
                'clicordi',
                'cssandjsschoolboard',
                'datachron',
                'development',
                'dicfic',
                'dmw',
                'drunkenpeasantswiki',
                'elainarmua',
                'eva',
                'extload',
                'ernaehrungsrathh',
                'essway',
                'etpo',
                'ezdmf',
                'fishpercolator',
                'foodsharinghamburg',
                'games',
                'geirpedia',
                'gen',
                'grandtheftwiki',
                'hftqms',
                'hobbies',
                'hshsinfoportal',
                'hsooden',
                'idtest',
                'ilearnthings',
                'imsts',
                'islamwissenschaft',
                'izanagi',
                'lbsges',
                'lclwiki',
                'littlebigplanet',
                'lizard',
                'luckandlogic',
                'lunfeng',
                'maiasongcontest',
                'mecanon',
                'meregos',
                'meta',
                'mydegree',
                'ndtest',
                'neuronpedia',
                'newtrend',
                'newknowledge',
                'nidda23',
                'nwp',
                'ofthevampire',
                'openconstitution',
                'panorama',
                'partup',
                'pflanzen',
                'priyo',
                'pq',
                'qwerty',
                'rawdata',
                'recherchesdocumentaires',
                'ric',
                'safiria',
                'shopping',
                'simonjon',
                'soshomophobie',
                'sjuhabitat',
                'stellachronica',
                'studynotekr',
                'sirikot',
                'snowthegame',
                'taylor',
                'tme',
                'teleswiki',
                'tochki',
                'torejorg',
                'touhouengine',
                'unikum',
                'urho3d',
                'vrgo',
                'walthamstowlabour',
                'webflow',
                'wikicervantes',
                'wisdomwiki',
                'yggdrasilwiki',
    ]

    file { '/etc/mediawiki/parsoid/settings.js':
        ensure  => present,
        content => template('parsoid/settings.js'),
    }
}
