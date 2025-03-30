import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    _place = PlaceRepository.getPlaceById(widget.placeId)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_place.title[_currentLanguage]!),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _buildImageSlider(),
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
              onSelected: (selected) =>
                  setState(() => _currentLanguage = lang.key),
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
