import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'دليل الآثار الذكي';
  static const String nfcInitialMessage = 'اختر إجراءً لبدء التفاعل مع البطاقة';
  static const String nfcWriteSuccess = '✔️ تم حفظ البيانات بنجاح!';
  static const String nfcWriteError = '❌ فشل في الكتابة - تحقق من البطاقة';
  static const String nfcReadError = '⚠️ تنسيق غير معروف';
  static const String pageNotFound = 'الصفحة غير موجودة';
  static const String pageNotFoundMessage = '404 - الصفحة المطلوبة غير موجودة';
  
  static const Map<String, String> supportedLanguages = {
    'ar': 'العربية',
    'en': 'English',
    'fr': 'Français',
    'es': 'Español',
    'zh': '中文',
  };
  static const Map<String, Map<String, String>> contentTitles = {
    'ar': {
      'description': 'الوصف',
      'history': 'التاريخ',
    },
    'en': {
      'description': 'Description',
      'history': 'History',
    },
    'fr': {
      'description': 'Description',
      'history': 'Histoire',
    },
    'es': {
      'description': 'Descripción',
      'history': 'Historia',
    },
    'zh': {
      'description': '描述',
      'history': '历史',
    },
  };
}

class AppColors {
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color secondaryColor = Color(0xFF00796B);
  static const Color accentColor = Color(0xFFFFC107);
}