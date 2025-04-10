import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import '../../../../core/constants.dart'; // تأكد من وجود الثوابت المناسبة
import 'app/app.dart';

void main() => runApp( MyApp());




// class WriteUrlScreen extends StatefulWidget {
//   const WriteUrlScreen({super.key});

//   @override
//   State<WriteUrlScreen> createState() => _WriteUrlScreenState();
// }

// class _WriteUrlScreenState extends State<WriteUrlScreen> {
//   final TextEditingController _urlController = TextEditingController();
//   bool _isProcessing = false;
//   String _message = '';
//   static final Uint8List _uriType = Uint8List.fromList('U'.codeUnits);

//   @override
//   void dispose() {
//     _urlController.dispose();
//     NfcManager.instance.stopSession();
//     super.dispose();
//   }

//   Future<void> _writeTag() async {
//   final url = _urlController.text.trim();
//   if (url.isEmpty) {
//     setState(() => _message = '⚠️ يرجى إدخال الرابط أولاً');
//     return;
//   }

//   // تحقق من صحة الرابط قبل البدء
//   try {
//     Uri.parse(url);
//   } on FormatException {
//     setState(() => _message = '⚠️ رابط غير صحيح! مثال صحيح: https://example.com');
//     return;
//   }

//   setState(() {
//     _isProcessing = true;
//     _message = 'قرّب الهاتف من البطاقة...';
//   });

//   try {
//     await NfcManager.instance.startSession(
//       onDiscovered: (NfcTag tag) async {
//         try {
//           final ndef = Ndef.from(tag);
          
//           // حالة عدم دعم البطاقة
//           if (ndef == null) {
//             setState(() => _message = '❌ البطاقة لا تدعم الكتابة (غير NDEF)');
//             return;
//           }

//           // حالة البطاقة مغلقة ضد الكتابة
//           if (!ndef.isWritable) {
//             setState(() => _message = '❌ البطاقة مقفلة أو غير قابلة للكتابة');
//             return;
//           }

//           // التحقق من سعة التخزين
//           if (ndef.maxSize < url.length + 10) {
//             setState(() => _message = '❌ سعة البطاقة غير كافية');
//             return;
//           }

//           final record = NdefRecord.createUri(Uri.parse(url));
//           final message = NdefMessage([record]);

//           await ndef.write(message);
//           setState(() => _message = '✔️ تمت الكتابة بنجاح');
          
//         } catch (e) {
//           setState(() => _message = '❌ فشلت الكتابة، تأكد من البطاقة');
//         } finally {
//           await NfcManager.instance.stopSession();
//         }
//       },
//       // إعدادات إضافية لتحسين التجربة
//       pollingOptions : {
//         NfcPollingOption.iso14443,
//         NfcPollingOption.iso15693,
//       },
//     );
//   } on PlatformException catch (e) {
//     setState(() => _message = '⚠️ خطأ في الاتصال: ${e.message}');
//   } catch (e) {
//     setState(() => _message = '⚠️ خطأ غير متوقع: ${e.toString()}');
//   } finally {
//     setState(() => _isProcessing = false);
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('كتابة رابط على البطاقة'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _urlController,
//               decoration: InputDecoration(
//                 labelText: 'الرابط المراد كتابته',
//                 hintText: 'مثال: https://example.com',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 prefixIcon: const Icon(Icons.link),
//               ), 
//               keyboardType: TextInputType.url,
//               textInputAction: TextInputAction.done,
//             ), 
//             const SizedBox(height: 30),
//             ElevatedButton.icon(
//               icon: Icon(
//                 _isProcessing ? Icons.hourglass_top : Icons.nfc,
//                 size: 24,
//               ),
//               label: Text(_isProcessing ? 'جاري الكتابة...' : 'ابدأ الكتابة'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue[800],
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: _isProcessing ? null : _writeTag,
//             ),
//             const SizedBox(height: 25),
//             AnimatedOpacity(
//               duration: const Duration(milliseconds: 300),
//               opacity: _isProcessing ? 1.0 : 0.8,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (_isProcessing)
//                     const CircularProgressIndicator(
//                       color: Colors.white,
//                       strokeWidth: 2,
//                     ),
//                   if (_isProcessing) const SizedBox(width: 15),
//                   Text(
//                     _message,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: _getMessageColor(),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
             
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getMessageColor() {
//     if (_message.contains('✔️')) return Colors.green.shade800;
//     if (_message.contains('⚠️')) return Colors.orange.shade800;
//     return Colors.grey.shade800;
//   }
// }