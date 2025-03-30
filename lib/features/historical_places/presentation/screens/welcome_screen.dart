import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import '../../data/repositories/place_repository.dart';
import '../widgets/nfc_handler.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _gradientAnimation;
  String? _selectedPlaceId;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _gradientAnimation = ColorTween(
      begin: Colors.blue.shade200,
      end: Colors.green.shade200,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _gradientAnimation.value!,
                  _gradientAnimation.value!.withOpacity(0.7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeroSection(),
                  const SizedBox(height: 40),
                  _buildPlaceSelector(),
                  const SizedBox(height: 40),
                   NfcHandler(placeIdToWrite: _selectedPlaceId),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      children: [
        const Text('🏛️ دليل الآثار التفاعلي',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            )),
        const SizedBox(height: 20),
        Image.asset('assets/nfc_scan.gif', height: 200),
        const SizedBox(height: 20),
        Text(
          'قم بمسح بطاقة NFC لاكتشاف كنوز تاريخية',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceSelector() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('اختر موقعًا أثريًا:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                )),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedPlaceId,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
              ),
              hint: const Text('حدد من القائمة'),
              items: PlaceRepository.availablePlaces.map((id) {
                return DropdownMenuItem(
                  value: id,
                  child: Text(
                    'الموقع الأثري #$id',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedPlaceId = value),
            ),
          ],
        ),
      ),
    );
  }
}