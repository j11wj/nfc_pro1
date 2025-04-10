import '../../domain/models/place_model.dart';

class PlaceRepository {
  static final List<HistoricalPlace> _places = [
HistoricalPlace(
  id: '1',
  imagePaths: ['lion1.jpg', 'lion2.jpg'],
  title: {
    'ar': 'أسد بابل',
    'en': 'Lion of Babylon',
    'fr': 'Lion de Babylone',
    'es': 'León de Babilonia',
    'zh': '巴比伦狮子',
  },
  description: {
    'ar': 'نحت بازلتي لأسد يسحق عدواً تحته',
    'en': 'Basalt sculpture of a lion crushing an enemy',
    'fr': 'Sculpture en basalte d\'un lion écrasant un ennemi',
    'es': 'Escultura de basalto de un león aplastando a un enemigo',
    'zh': '压碎敌人的玄武岩狮子雕塑',
  },
  history: {
    'ar': '''
• اكتشفه الرحالة الفرنسي بوشامب عام 1776
• مصنوع من حجر البازلت الأسود
• ارتفاعه 2.6 متر وطوله 4.2 متر
• يرمز إلى القوة الملكية البابلية
• معروض حالياً في متحف برجامون ببرلين
''',
    'en': '''
• Discovered by French traveler Beauchamp in 1776
• Made of black basalt stone
• 2.6m height, 4.2m length
• Symbolizes Babylonian royal power
• Currently displayed at Pergamon Museum, Berlin
''',
    'fr': '''
• Découvert par le voyageur français Beauchamp en 1776
• Fabriqué en pierre de basalte noir
• Hauteur 2.6m, longueur 4.2m
• Symbolise le pouvoir royal babylonien
• Exposé actuellement au musée de Pergame, Berlin
''',
    'es': '''
• Descubierto por el viajero francés Beauchamp en 1776
• Hecho de piedra de basalto negro
• Altura 2.6m, longitud 4.2m
• Simboliza el poder real babilónico
• Actualmente exhibido en el Museo de Pérgamo, Berlín
''',
    'zh': '''
• 1776年由法国旅行家博尚发现
• 黑色玄武岩制成
• 高2.6米，长4.2米
• 象征巴比伦王权
• 现藏于柏林佩加蒙博物馆
'''
  },
),
HistoricalPlace(
  id: '2',
  imagePaths: ['bull1.jpg', 'bull2.jpg'],
  title: {
    'ar': 'ثور بوابة عشتار',
    'en': 'Ishtar Gate Bull',
    'fr': 'Taureau de la Porte d\'Ishtar',
    'es': 'Toro de la Puerta de Ishtar',
    'zh': '伊什塔尔门公牛',
  },
  description: {
    'ar': 'رمز الإله أدد مزين بالقيشاني الأزرق',
    'en': 'Symbol of Adad god with blue glaze decoration',
    'fr': 'Symbole du dieu Adad avec décoration en glaçure bleue',
    'es': 'Símbolo del dios Adad con decoración de esmalte azul',
    'zh': '阿达德神的象征，饰有蓝色釉彩',
  },
  history: {
    'ar': '''
• جزء من زخارف بوابة عشتار
• اكتشفته البعثة الألمانية 1902-1914
• ارتفاع 4.5 متر من الطوب المزجج
• مزين بزخارف نباتية وهندسية
• معروض في متحف برجامون
''',
    'en': '''
• Part of Ishtar Gate decorations
• Discovered by German excavation team (1902-1914)
• 4.5m height made of glazed bricks
• Decorated with floral and geometric patterns
• Displayed at Pergamon Museum
''',
    'fr': '''
• Faisait partie des décorations de la Porte d'Ishtar
• Découvert par l'équipe allemande (1902-1914)
• 4.5m de haut en briques vernissées
• Orné de motifs floraux et géométriques
• Exposé au musée de Pergame
''',
    'es': '''
• Parte de la decoración de la Puerta de Ishtar
• Descubierto por equipo alemán (1902-1914)
• 4.5m de altura en ladrillos vidriados
• Decorado con motivos florales y geométricos
• Exhibido en el Museo de Pérgamo
''',
    'zh': '''
• 伊什塔尔门装饰的一部分
• 德国考古队发现（1902-1914年）
• 琉璃砖制成，高4.5米
• 饰有花卉和几何图案
• 展于佩加蒙博物馆
'''
  },
),
 HistoricalPlace(
  id: '3',
  imagePaths: ['cone1.jpg', 'cone2.jpg'],
  title: {
    'ar': 'المخروط الفخاري السومري',
    'en': 'Sumerian Clay Cone',
    'fr': 'Cône d\'argile sumérien',
    'es': 'Cono de arcilla sumerio',
    'zh': '苏美尔陶锥',
  },
  description: {
    'ar': 'أقدم نص تاريخي عن الصراعات السومرية',
    'en': 'Earliest historical text documenting Sumerian conflicts',
    'fr': 'Plus ancien texte historique sur les conflits sumériens',
    'es': 'Texto histórico más antiguo sobre conflictos sumerios',
    'zh': '记录苏美尔城邦冲突的最早历史文本',
  },
  history: {
    'ar': '''
• يعود لـ 2600-2500 ق.م
• عُثر عليه في لكش (العراق)
• يسجل الصراع بين مدينتي أوما ولكش
• مكتوب بالخط المسماري
• محفوظ في المتحف البريطاني
''',
    'en': '''
• Dated 2600-2500 BCE
• Found in Lagash (Iraq)
• Records conflict between Umma and Lagash
• Written in cuneiform script
• Housed in British Museum
''',
    'fr': '''
• Daté de 2600-2500 av. J.-C.
• Trouvé à Lagash (Irak)
• Documente le conflit entre Umma et Lagash
• Écrit en écriture cunéiforme
• Conservé au British Museum
''',
    'es': '''
• Data de 2600-2500 a. C.
• Encontrado en Lagash (Irak)
• Registra conflicto entre Umma y Lagash
• Escrito en escritura cuneiforme
• Alojado en el Museo Británico
''',
    'zh': '''
• 公元前2600-2500年
• 出土于拉格什（伊拉克）
• 记录乌玛与拉格什的冲突
• 楔形文字书写
• 藏于大英博物馆
'''
  },
),
 HistoricalPlace(
  id: '4',
  imagePaths: ['vase1.jpg', 'vase2.jpg'],
  title: {
    'ar': 'مزهرية أوروك',
    'en': 'Warka Vase',
    'fr': 'Vase d\'Uruk',
    'es': 'Jarrón de Uruk',
    'zh': '乌鲁克花瓶',
  },
  description: {
    'ar': 'أقدم عمل فني سردي في التاريخ',
    'en': 'Earliest known narrative art work',
    'fr': 'Plus ancienne œuvre d\'art narratif',
    'es': 'La primera obra de arte narrativo',
    'zh': '已知最早的叙事艺术作品',
  },
  history: {
    'ar': '''
• يعود لعصر أوروك (3300-3000 ق.م)
• مصنوع من المرمر بارتفاع 1.05 متر
• يصور مراسم تقديم القرابين
• أعيد ترميمه في العصور القديمة
• محفوظ في المتحف الوطني العراقي
''',
    'en': '''
• Uruk Period (3300–3000 BCE)
• Alabaster, 1.05m height
• Depicts offering rituals
• Restored in antiquity
• Housed in Iraq National Museum
''',
    'fr': '''
• Période d\'Uruk (3300–3000 av. J.-C.)
• Albâtre, hauteur 1.05m
• Représente des rituels d\'offrande
• Restauré dans l\'Antiquité
• Conservé au Musée national irakien
''',
    'es': '''
• Período de Uruk (3300–3000 a. C.)
• Alabastro, 1.05m de altura
• Representa rituales de ofrendas
• Restaurado en la antigüedad
• Alojado en el Museo Nacional de Irak
''',
    'zh': '''
• 乌鲁克时期（公元前3300–3000年）
• 雪花石膏制，高1.05米
• 描绘祭祀仪式
• 古代修复
• 藏于伊拉克国家博物馆
'''
  },
),
 HistoricalPlace(
  id: '5',
  imagePaths: ['head1.jpg', 'head2.jpg'],
  title: {
    'ar': 'رأس الوركاء',
    'en': 'Uruk Head',
    'fr': 'Tête d\'Uruk',
    'es': 'Cabeza de Uruk',
    'zh': '乌鲁克头像',
  },
  description: {
    'ar': 'أقدم تمثال نصفي بشري مفصل',
    'en': 'Earliest detailed human bust',
    'fr': 'Plus ancien buste humain détaillé',
    'es': 'El primer busto humano detallado',
    'zh': '最早的人类半身像',
  },
  history: {
    'ar': '''
• من العصر السومري (3300-3000 ق.م)
• مصنوع من الرخام بارتفاع 21.5 سم
• يصور ملامح امرأة ذات تعابير واقعية
• عُثر عليه في معبد إنانا
• محفوظ في متحف برلين
''',
    'en': '''
• Sumerian period (3300–3000 BCE)
• Marble, 21.5cm height
• Realistic female facial features
• Found in Inanna temple
• Housed in Berlin Museum
''',
    'fr': '''
• Période sumérienne (3300–3000 av. J.-C.)
• Marbre, hauteur 21.5cm
• Traits féminins réalistes
• Trouvé dans le temple d\'Inanna
• Conservé au musée de Berlin
''',
    'es': '''
• Período sumerio (3300–3000 a. C.)
• Mármol, 21.5cm de altura
• Rasgos faciales femeninos realistas
• Encontrado en templo de Inanna
• Alojado en Museo de Berlín
''',
    'zh': '''
• 苏美尔时期（公元前3300–3000年）
• 大理石制，高21.5厘米
• 逼真的女性面部特征
• 发现于伊南娜神庙
• 藏于柏林博物馆
'''
  },
),
 HistoricalPlace(
  id: '6',
  imagePaths: ['dragon1.jpg', 'dragon2.jpg'],
  title: {
    'ar': 'مشخوشو',
    'en': 'Mushhushshu',
    'fr': 'Mushhushshu',
    'es': 'Mushhushshu',
    'zh': '穆什胡什',
  },
  description: {
    'ar': 'كائن أسطوري مزيج من الحيوانات',
    'en': 'Composite mythological creature',
    'fr': 'Créature mythologique hybride',
    'es': 'Criatura mitológica compuesta',
    'zh': '复合神话生物',
  },
  history: {
    'ar': '''
• رمز الإله مردوخ الرئيسي
• جسم ثعبان مع أرجل أسد وعقاب
• جزء من زخارف بوابة عشتار
• ارتفاعه 3.2 متر من الطوب المزجج
• معروض في متحف برجامون
''',
    'en': '''
• Main symbol of Marduk god
• Serpent body with lion legs & eagle claws
• Part of Ishtar Gate decorations
• 3.2m height glazed bricks
• Displayed at Pergamon Museum
''',
    'fr': '''
• Symbole principal du dieu Marduk
• Corps de serpent avec pattes de lion et serres d\'aigle
• Faisait partie de la Porte d\'Ishtar
• 3.2m en briques vernissées
• Exposé au musée de Pergame
''',
    'es': '''
• Símbolo principal del dios Marduk
• Cuerpo de serpiente con patas de león y garras de águila
• Parte de la decoración de la Puerta de Ishtar
• 3.2m en ladrillos vidriados
• Exhibido en el Museo de Pérgamo
''',
    'zh': '''
• 主神马尔杜克的象征
• 蛇身、狮腿、鹰爪
• 伊什塔尔门装饰部分
• 琉璃砖制，高3.2米
• 展于佩加蒙博物馆
'''
  },
),
 HistoricalPlace(
  id: '7',
  imagePaths: ['lamassu1.jpg', 'lamassu2.jpg'],
  title: {
    'ar': 'لاماسو',
    'en': 'Lamassu',
    'fr': 'Lamassu',
    'es': 'Lamassu',
    'zh': '拉玛苏',
  },
  description: {
    'ar': 'كائن حامٍ برأس إنسان وجسم ثور',
    'en': 'Protective deity with human head',
    'fr': 'Déité protectrice à tête humaine',
    'es': 'Deidad protectora con cabeza humana',
    'zh': '人首牛身守护神',
  },
  history: {
    'ar': '''
• من الفن الآشوري (القرن 9 ق.م)
• ارتفاع 4.2 متر من الحجر الجيري
• كان يحرس قصور نينوى
• يرمز إلى القوة والحماية
• محفوظ في المتحف البريطاني
''',
    'en': '''
• Assyrian art (9th century BCE)
• 4.2m height limestone
• Guarded Nineveh palaces
• Symbolizes power & protection
• Housed in British Museum
''',
    'fr': '''
• Art assyrien (9ème siècle av. J.-C.)
• Calcaire de 4.2m de haut
• Gardait les palais de Ninive
• Symbolise puissance & protection
• Conservé au British Museum
''',
    'es': '''
• Arte asirio (siglo IX a. C.)
• Caliza de 4.2m de altura
• Custodiaba palacios de Nínive
• Simboliza poder y protección
• Alojado en el Museo Británico
''',
    'zh': '''
• 亚述艺术（公元前9世纪）
• 石灰岩制，高4.2米
• 守卫尼尼微宫殿
• 象征力量与保护
• 藏于大英博物馆
'''
  },
),
HistoricalPlace(
  id: '8',
  imagePaths: ['stele1.jpg', 'stele2.jpg'],
  title: {
    'ar': 'جزء لوحة حمورابي',
    'en': 'Hammurabi Stele Fragment',
    'fr': 'Fragment de la stèle d\'Hammurabi',
    'es': 'Fragmento de la Estela de Hammurabi',
    'zh': '汉谟拉比石碑残片',
  },
  description: {
    'ar': 'المشهد العلوي للملك مع إله الشمس',
    'en': 'Upper scene: King with Sun God',
    'fr': 'Scène supérieure : Roi avec dieu-soleil',
    'es': 'Escena superior: Rey con dios sol',
    'zh': '上部场景：国王与太阳神',
  },
  history: {
    'ar': '''
• من مسلة حمورابي (1792-1750 ق.م)
• يظهر حمورابي يتلقى الشرعية من شمش
• صنع من الديوريت الأسود
• ارتفاع القطعة 70 سم
• محفوظ في متحف اللوفر
''',
    'en': '''
• From Hammurabi Stele (1792–1750 BCE)
• Depicts Hammurabi receiving legitimacy from Shamash
• Made of black diorite
• Fragment height 70cm
• Housed in Louvre Museum
''',
    'fr': '''
• Provenant de la stèle d\'Hammurabi (1792–1750 av. J.-C.)
• Représente Hammurabi recevant la légitimité de Shamash
• En diorite noire
• Hauteur du fragment 70cm
• Conservé au musée du Louvre
''',
    'es': '''
• De la Estela de Hammurabi (1792–1750 a. C.)
• Representa a Hammurabi recibiendo legitimidad de Shamash
• Hecho de diorita negra
• Altura del fragmento 70cm
• Alojado en el Museo del Louvre
''',
    'zh': '''
• 来自汉谟拉比石碑（公元前1792–1750年）
• 描绘汉谟拉比从沙马什获得合法性
• 黑色闪长岩制成
• 残片高70厘米
• 藏于卢浮宫
'''
  },
),
HistoricalPlace(
  id: '9',
  imagePaths: ['sphinx1.jpg', 'sphinx2.jpg'],
  title: {
    'ar': 'لوحة أبو الهول',
    'en': 'Sphinx Relief',
    'fr': 'Relief du Sphinx',
    'es': 'Relieve de la Esfinge',
    'zh': '斯芬克斯浮雕',
  },
  description: {
    'ar': 'تمثال هجين من العاج الفينيقي',
    'en': 'Hybrid ivory statue from Phoenicia',
    'fr': 'Statue hybride en ivoire phénicien',
    'es': 'Estatua híbrida fenicia en marfil',
    'zh': '腓尼基象牙混合雕像',
  },
  history: {
    'ar': '''
• يعود للقرن 8-7 ق.م
• ارتفاع 20.5 سم، عرض 8 سم
• يصور مخلوقًا أسطوريًا ملتحيًا
• عُثر عليه في سوريا
• محفوظ في متحف المتروبوليتان
''',
    'en': '''
• 8th–7th century BCE
• 20.5cm height, 8cm width
• Depicts bearded mythical creature
• Found in Syria
• Housed in Metropolitan Museum
''',
    'fr': '''
• 8ème–7ème siècle av. J.-C.
• Hauteur 20.5cm, largeur 8cm
• Représente une créature mythique barbue
• Trouvé en Syrie
• Conservé au Metropolitan Museum
''',
    'es': '''
• Siglos VIII–VII a. C.
• Altura 20.5cm, ancho 8cm
• Representa criatura mítica barbuda
• Encontrado en Siria
• Alojado en el Museo Metropolitano
''',
    'zh': '''
• 公元前8–7世纪
• 高20.5厘米，宽8厘米
• 描绘有胡须的神话生物
• 发现于叙利亚
• 藏于大都会博物馆
'''
  },
),
HistoricalPlace(
  id: '10',
  imagePaths: ['king1.jpg', 'king2.jpg'],
  title: {
    'ar': 'رأس الملك الآشوري',
    'en': 'Assyrian King Head',
    'fr': 'Tête de roi assyrien',
    'es': 'Cabeza de rey asirio',
    'zh': '亚述国王头像',
  },
  description: {
    'ar': 'جزء من مسلة حجرية',
    'en': 'Fragment of stone obelisk',
    'fr': 'Fragment d\'obélisque en pierre',
    'es': 'Fragmento de obelisco de piedra',
    'zh': '石方尖碑残片',
  },
  history: {
    'ar': '''
• ارتفاع 50 سم من الحجر الجيري
• يعود للعصر الآشوري الحديث
• يصور ملامح ملكية دقيقة
• عُثر عليه في نمرود
• محفوظ في المتحف العراقي
''',
    'en': '''
• 50cm height limestone
• Neo-Assyrian period
• Detailed royal facial features
• Found in Nimrud
• Housed in Iraq Museum
''',
    'fr': '''
• Calcaire de 50cm de haut
• Période néo-assyrienne
• Traits royaux détaillés
• Trouvé à Nimrud
• Conservé au Musée irakien
''',
    'es': '''
• Caliza de 50cm de altura
• Período neoasirio
• Rasgos faciales reales detallados
• Encontrado en Nimrud
• Alojado en el Museo de Irak
''',
    'zh': '''
• 石灰岩制，高50厘米
• 新亚述时期
• 细致的王室面部特征
• 发现于尼姆鲁德
• 藏于伊拉克博物馆
'''
  },
),
HistoricalPlace(
  id: '11',
  imagePaths: ['obelisk1.jpg', 'obelisk2.jpg'],
  title: {
    'ar': 'المسلة الآشورية',
    'en': 'Assyrian Obelisk',
    'fr': 'Obélisque assyrien',
    'es': 'Obelisco asirio',
    'zh': '亚述方尖碑',
  },
  description: {
    'ar': 'نصب تذكاري من البازلت الأسود',
    'en': 'Commemorative black basalt monument',
    'fr': 'Monument commémoratif en basalte noir',
    'es': 'Monumento conmemorativo de basalto negro',
    'zh': '黑色玄武岩纪念碑',
  },
  history: {
    'ar': '''
• ارتفاع 2 متر مع نقوش مسمارية
• يسجل انتصارات ملك آشوري
• يعود للقرن 9 ق.م
• عُثر عليه في شمال العراق
• معروض في المتحف البريطاني
''',
    'en': '''
• 2m height with cuneiform inscriptions
• Records Assyrian king\'s victories
• 9th century BCE
• Found in northern Iraq
• Displayed in British Museum
''',
    'fr': '''
• 2m de haut avec inscriptions cunéiformes
• Commémore les victoires d\'un roi assyrien
• 9ème siècle av. J.-C.
• Trouvé dans le nord de l\'Irak
• Exposé au British Museum
''',
    'es': '''
• 2m de altura con inscripciones cuneiformes
• Registra victorias de rey asirio
• Siglo IX a. C.
• Encontrado en norte de Irak
• Exhibido en Museo Británico
''',
    'zh': '''
• 高2米，带楔形文字铭文
• 记录亚述国王的胜利
• 公元前9世纪
• 发现于伊拉克北部
• 展于大英博物馆
'''
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
