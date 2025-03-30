import '../../domain/models/place_model.dart';

class PlaceRepository {
  static final List<HistoricalPlace> _places = [
    // الموقع الأصلي (للحفاظ على البنية)
    HistoricalPlace(
      id: '1',
      imagePaths: ['h1.jpg', 'pyramids_2.jpg'],
      title: {
        'ar': 'أهرامات الجيزة',
        'en': 'The Pyramids of Giza',
        'fr': 'Les Pyramides de Gizeh',
        'es': 'Las Pirámides de Guiza',
        'zh': '吉萨金字塔',
      },
      description: {
        'ar': 'أحد عجائب الدنيا السبع القديمة',
        'en': 'One of the Seven Ancient Wonders',
        'fr': 'Une des sept merveilles du monde antique',
        'es': 'Una de las siete maravillas del mundo antiguo',
        'zh': '古代世界七大奇迹之一',
      },
      history: {
        'ar': 'بُنيت قبل حوالي 4500 سنة كمقابر للفراعنة',
        'en': 'Built about 4500 years ago as pharaoh tombs',
        'fr': 'Construites il y a environ 4500 ans comme tombes',
        'es': 'Construidas hace 4500 años como tumbas',
        'zh': '建于大约4500年前作为法老陵墓',
      },
    ),

    // المواقع البابلية المضافة
    HistoricalPlace(
      id: '2',
      imagePaths: ['h2.jpg', 'babylon2.jpg'],
      title: {
        'ar': 'بوابة عشتار',
        'en': 'Ishtar Gate',
        'fr': 'Porte d\'Ishtar',
        'es': 'Puerta de Ishtar',
        'zh': '伊什塔尔城门',
      },
      description: {
        'ar': 'أشهر معالم بابل الأثرية',
        'en': 'The eighth gate to the inner city of Babylon',
        'fr': 'La huitième porte de la ville intérieure de Babylone',
        'es': 'La octava puerta de la ciudad interior de Babilonia',
        'zh': '巴比伦内城的第八道门',
      },
      history: {
        'ar': 'بُنيت في عهد الملك نبوخذ نصر الثاني 575 ق.م',
        'en': 'Constructed in 575 BC by King Nebuchadnezzar II',
        'fr': 'Construite en 575 av. J.-C. par le roi Nabuchodonosor II',
        'es': 'Construida en 575 a. C. por el rey Nabucodonosor II',
        'zh': '由尼布甲尼撒二世国王于公元前575年建造',
      },
    ),

    HistoricalPlace(
      id: '3',
      imagePaths: ['hanging1.jpg', 'hanging2.jpg'],
      title: {
        'ar': 'الحدائق المعلقة',
        'en': 'Hanging Gardens',
        'fr': 'Jardins suspendus',
        'es': 'Jardines Colgantes',
        'zh': '空中花园',
      },
      description: {
        'ar': 'إحدى عجائب الدنيا السبع القديمة',
        'en': 'One of the Seven Wonders of the Ancient World',
        'fr': 'Une des sept merveilles du monde antique',
        'es': 'Una de las siete maravillas del mundo antiguo',
        'zh': '古代世界七大奇迹之一',
      },
      history: {
        'ar': 'يعتقد أنها بنيت في القرن السادس قبل الميلاد',
        'en': 'Believed to have been built in the 6th century BCE',
        'fr':
            'On pense qu\'ils ont été construits au VIe siècle avant notre ère',
        'es': 'Se cree que fueron construidos en el siglo VI a. C.',
        'zh': '据信建于公元前6世纪',
      },
    ),

    // باقي المواقع (سيتم إضافة 8 أخرى بنفس النمط)
    HistoricalPlace(
      id: '4',
      imagePaths: ['ziggurat1.jpg', 'ziggurat2.jpg'],
      title: {
        'ar': 'زقورة أور',
        'en': 'Ziggurat of Ur',
        'fr': 'Ziggourat d\'Ur',
        'es': 'Zigurat de Ur',
        'zh': '乌尔金字形神塔',
      },
      description: {
        'ar': 'معبد سومري قديم في العراق',
        'en': 'Ancient Sumerian temple in Iraq',
        'fr': 'Temple sumérien ancien en Irak',
        'es': 'Templo sumerio antiguo en Irak',
        'zh': '伊拉克的古代苏美尔神庙',
      },
      history: {
        'ar': 'بني في القرن 21 قبل الميلاد',
        'en': 'Built in the 21st century BCE',
        'fr': 'Construit au 21ème siècle avant notre ère',
        'es': 'Construido en el siglo XXI a. C.',
        'zh': '建于公元前21世纪',
      },
    ),

    HistoricalPlace(
      id: '5',
      imagePaths: ['walls1.jpg', 'walls2.jpg'],
      title: {
        'ar': 'أسوار بابل',
        'en': 'Walls of Babylon',
        'fr': 'Murs de Babylone',
        'es': 'Murallas de Babilonia',
        'zh': '巴比伦城墙',
      },
      description: {
        'ar': 'نظام دفاعي ضخم يحيط بالمدينة',
        'en': 'Massive defensive system surrounding the city',
        'fr': 'Système défensif massif entourant la ville',
        'es': 'Sistema defensivo masivo que rodeaba la ciudad',
        'zh': '环绕城市的巨大防御系统',
      },
      history: {
        'ar': 'وصفها هيرودوت بأنها من عجائب الدنيا',
        'en': 'Described by Herodotus as a world wonder',
        'fr': 'Décrits par Hérodote comme une merveille du monde',
        'es': 'Descrito por Heródoto como una maravilla del mundo',
        'zh': '被希罗多德描述为世界奇迹',
      },
    ),

    HistoricalPlace(
      id: '6',
      imagePaths: ['etemenanki1.jpg', 'etemenanki2.jpg'],
      title: {
        'ar': 'إيتيمينانكي',
        'en': 'Etemenanki',
        'fr': 'Etemenanki',
        'es': 'Etemenanki',
        'zh': '埃特曼安吉',
      },
      description: {
        'ar': 'الزقورة الرئيسية في بابل',
        'en': 'The main ziggurat of Babylon',
        'fr': 'La ziggourat principale de Babylone',
        'es': 'La principal zigurat de Babilonia',
        'zh': '巴比伦的主塔庙',
      },
      history: {
        'ar': 'يعتقد أنها مصدر إلهام لأسطورة برج بابل',
        'en': 'Believed to inspire the Tower of Babel myth',
        'fr': 'On pense qu\'elle a inspiré le mythe de la tour de Babel',
        'es': 'Se cree que inspiró el mito de la Torre de Babel',
        'zh': '被认为是巴别塔神话的灵感来源',
      },
    ),

    HistoricalPlace(
      id: '7',
      imagePaths: ['marduk1.jpg', 'marduk2.jpg'],
      title: {
        'ar': 'معبد مردوخ',
        'en': 'Temple of Marduk',
        'fr': 'Temple de Marduk',
        'es': 'Templo de Marduk',
        'zh': '马尔杜克神庙',
      },
      description: {
        'ar': 'المركز الديني الرئيسي في بابل',
        'en': 'The main religious center of Babylon',
        'fr': 'Le principal centre religieux de Babylone',
        'es': 'El principal centro religioso de Babilonia',
        'zh': '巴比伦的主要宗教中心',
      },
      history: {
        'ar': 'كان مقر الإله مردوخ رئيس الآلهة البابلية',
        'en': 'Home to Marduk, chief god of the Babylonian pantheon',
        'fr': 'Siège de Marduk, dieu principal du panthéon babylonien',
        'es': 'Hogar de Marduk, dios principal del panteón babilónico',
        'zh': '巴比伦主神马尔杜克的居所',
      },
    ),

    HistoricalPlace(
      id: '8',
      imagePaths: ['palace1.jpg', 'palace2.jpg'],
      title: {
        'ar': 'قصر نبوخذ نصر',
        'en': 'Nebuchadnezzar\'s Palace',
        'fr': 'Palais de Nabuchodonosor',
        'es': 'Palacio de Nabucodonosor',
        'zh': '尼布甲尼撒宫殿',
      },
      description: {
        'ar': 'القصر الملكي الشهير في بابل',
        'en': 'The famous royal palace in Babylon',
        'fr': 'Le célèbre palais royal de Babylone',
        'es': 'El famoso palacio real de Babilonia',
        'zh': '巴比伦著名的皇家宫殿',
      },
      history: {
        'ar': 'عثر على لوحة تشير إلى بنائه في السجلات التاريخية',
        'en': 'Construction recorded in historical tablets',
        'fr': 'Construction enregistrée dans des tablettes historiques',
        'es': 'Construcción registrada en tablillas históricas',
        'zh': '历史碑文中记载的建造记录',
      },
    ),

    HistoricalPlace(
      id: '9',
      imagePaths: ['esagila1.jpg', 'esagila2.jpg'],
      title: {
        'ar': 'معبد إيساجيلا',
        'en': 'Esagila Temple',
        'fr': 'Temple d\'Esagila',
        'es': 'Templo de Esagila',
        'zh': '埃萨吉拉神庙',
      },
      description: {
        'ar': 'المجمع الديني المركزي في بابل',
        'en': 'The central religious complex in Babylon',
        'fr': 'Le complexe religieux central de Babylone',
        'es': 'El complejo religioso central de Babilonia',
        'zh': '巴比伦的核心宗教建筑群',
      },
      history: {
        'ar': 'كان يحتوي على تمثال مردوخ الذهبي',
        'en': 'Housed the golden statue of Marduk',
        'fr': 'Abritait la statue dorée de Marduk',
        'es': 'Albergaba la estatua dorada de Marduk',
        'zh': '曾安置马尔杜克的黄金雕像',
      },
    ),

    HistoricalPlace(
      id: '10',
      imagePaths: ['street1.jpg', 'street2.jpg'],
      title: {
        'ar': 'شارع الموكب',
        'en': 'Processional Street',
        'fr': 'Voie processionnelle',
        'es': 'Calle Procesional',
        'zh': '游行大道',
      },
      description: {
        'ar': 'الطريق الرئيسي لاحتفالات بابل',
        'en': 'Main route for Babylonian ceremonies',
        'fr': 'Route principale pour les cérémonies babyloniennes',
        'es': 'Ruta principal para ceremonias babilónicas',
        'zh': '巴比伦仪式的主要道路',
      },
      history: {
        'ar': 'مبلط بحجارة ملونة ومرصعة بالرسومات',
        'en': 'Paved with colored stones and inlaid designs',
        'fr': 'Pavé de pierres colorées et motifs incrustés',
        'es': 'Pavimentado con piedras de colores y diseños incrustados',
        'zh': '铺有彩色石头和镶嵌图案',
      },
    ),

    HistoricalPlace(
      id: '11',
      imagePaths: ['tower1.jpg', 'tower2.jpg'],
      title: {
        'ar': 'برج بابل',
        'en': 'Tower of Babel',
        'fr': 'Tour de Babel',
        'es': 'Torre de Babel',
        'zh': '巴别塔',
      },
      description: {
        'ar': 'البناء الأسطوري المذكور في الكتاب المقدس',
        'en': 'The legendary structure from biblical accounts',
        'fr': 'La structure légendaire des récits bibliques',
        'es': 'La estructura legendaria de los relatos bíblicos',
        'zh': '圣经记载的传奇建筑',
      },
      history: {
        'ar': 'ارتبطت أسطورته بزقورة إيتيمينانكي',
        'en': 'Associated with the Etemenanki ziggurat',
        'fr': 'Associé à la ziggourat Etemenanki',
        'es': 'Asociado con la zigurat Etemenanki',
        'zh': '与埃特曼安吉塔庙有关联',
      },
    ),
  ];

  static List<String> get availablePlaces => _places.map((e) => e.id).toList();

  static HistoricalPlace? getPlaceById(String id) {
    try {
      return _places.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }
}
