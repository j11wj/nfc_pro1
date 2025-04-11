import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import '../widgets/nfc_handler.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _colorAnimation = ColorTween(
      begin: const Color(0xFFCDA434),
      end: const Color(0xFF8A6D3B),
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
      body: Stack(
        children: [
          // خلفية أثرية
          _buildAncientBackground(),

          // المحتوى الرئيسي
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // أيقونة أثرية متحركة
                  _buildAncientRelicIcon(),
                  const SizedBox(height: 40),

                  // بطاقة الإرشادات
                  _buildAncientTabletCard(),
                  const SizedBox(height: 40),

                  // مؤشر NFC
                  const NfcHandler(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAncientBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/h1.jpg'),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF3E2723).withOpacity(0.6),
              const Color(0xFF5D4037).withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAncientRelicIcon() {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _colorAnimation.value!,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: _colorAnimation.value!.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => RadialGradient(
              center: Alignment.center,
              colors: [
                _colorAnimation.value!,
                _colorAnimation.value!.withOpacity(0.3),
              ],
              stops: const [0.7, 1.0],
            ).createShader(bounds),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 150,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAncientTabletCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFFD7CCC8).withOpacity(0.9),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade900.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/h1.jpg'),
          fit: BoxFit.cover,
          opacity: 0.25,
        ),
      ),
      child: Column(
        children: [
          // نص منقوش
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '𓋴𓂋𓈎𓏏𓊖', // Hieroglyphics symbols
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.brown.shade800,
                  fontFamily: 'NotoSansEgyptianHieroglyphs',
                ),
              ),
              Text(
                'المس للاكتشاف',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'قم بتقريب الجهاز من البطاقة الأثرية\nلاكتشاف أسرار الحضارات القديمة',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              color: Colors.brown.shade800,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 15),
          // زخارف جانبية
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDecorativeSymbol('𓃀'),
              _buildDecorativeSymbol('𓅓'),
              _buildDecorativeSymbol('𓆣'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDecorativeSymbol(String symbol) {
    return Text(
      symbol,
      style: TextStyle(
        fontSize: 24,
        color: Colors.brown.shade700,
        fontFamily: 'NotoSansEgyptianHieroglyphs',
      ),
    );
  }
}
