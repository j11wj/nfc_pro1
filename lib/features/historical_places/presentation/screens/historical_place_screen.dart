import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../../core/constants.dart';
import '../../data/repositories/place_repository.dart';
import '../../domain/models/place_model.dart';

class HistoricalPlaceScreen extends StatefulWidget {
  final String placeId;
  const HistoricalPlaceScreen({super.key, required this.placeId});

  @override
  State<HistoricalPlaceScreen> createState() => _HistoricalPlaceScreenState();
}

class _HistoricalPlaceScreenState extends State<HistoricalPlaceScreen> {
  late HistoricalPlace _place;
  int _currentImageIndex = 0;
  String _currentLanguage = 'ar';
  late FlutterTts _tts;
  bool _isSpeaking = false;

  final Map<String, String> _languageCodes = {
    'ar': 'ar',
    'en': 'en-US',
    'fr': 'fr-FR',
    'es': 'es-ES',
    'zh': 'zh-CN',
  };

  @override
  void initState() {
    super.initState();
    _place = PlaceRepository.getPlaceById(widget.placeId)!;
    _initTts();
  }

  void _initTts() async {
    _tts = FlutterTts();
    await _tts.setLanguage(_languageCodes[_currentLanguage]!);

    _tts.setStartHandler(() => setState(() => _isSpeaking = true));
    _tts.setCompletionHandler(() => setState(() => _isSpeaking = false));
    _tts.setErrorHandler((msg) {
      setState(() => _isSpeaking = false);
      print("TTS Error: $msg");
    });
  }

  Future<void> _updateLanguage(String lang) async {
    try {
      setState(() => _currentLanguage = lang);
      await _tts.stop();
      if (await _tts.isLanguageAvailable(_languageCodes[lang]!)) {
        await _tts.setLanguage(_languageCodes[lang]!);
      } else {
        print("اللغة غير مدعومة: ${_languageCodes[lang]}");
      }
    } catch (e) {
      print("خطأ في تغيير اللغة: $e");
    }
  }

  Future<void> _toggleSpeech() async {
    try {
      final text = '''
      ${_place.title[_currentLanguage]}
      ${_place.description[_currentLanguage]}
      ${_place.history[_currentLanguage]}
      ''';

      if (_isSpeaking) {
        await _tts.stop();
      } else {
        await _tts.speak(text);
      }
    } catch (e) {
      print("خطأ في التشغيل الصوتي: $e");
      setState(() => _isSpeaking = false);
    }
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  void showLanguageNotSupportedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Icon(Icons.language, color: Colors.deepPurple),
              SizedBox(width: 8),
              Text(
                'اللغة غير مدعومة',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            'جهازك لا يدعم اللغة العربية حالياً. يرجى تغيير إعدادات اللغة أو استخدام لغة مدعومة.',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'حسناً',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_place.title[_currentLanguage]!),
        actions: [
          IconButton(
            icon: Icon(
              _isSpeaking ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: () {
              if (_currentLanguage == 'ar') {
                showLanguageNotSupportedDialog(context);
                return;
              } else {
                _toggleSpeech();
                setState(() {
                  _isSpeaking = !_isSpeaking;
                });
              }
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // _buildImageSlider(),
          _buildLanguageSelector(),
          _buildContentSection(),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: PageView.builder(
          itemCount: _place.imagePaths.length,
          onPageChanged: (index) => setState(() => _currentImageIndex = index),
          itemBuilder: (ctx, index) => InteractiveViewer(
            child: Image.asset(
              'assets/${_place.imagePaths[index]}',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: AppConstants.supportedLanguages.entries.map((lang) {
            return ChoiceChip(
              label: Text(lang.value),
              selected: _currentLanguage == lang.key,
              selectedColor: AppColors.accentColor,
              onSelected: (selected) => _updateLanguage(lang.key),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          _buildInfoCard(
            title:
                AppConstants.contentTitles[_currentLanguage]!['description']!,
            content: _place.description[_currentLanguage]!,
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            title: AppConstants.contentTitles[_currentLanguage]!['history']!,
            content: _place.history[_currentLanguage]!,
          ),
        ]),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Divider(height: 24),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
