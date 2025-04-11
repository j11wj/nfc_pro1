import 'dart:typed_data';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import '../../../../core/constants.dart';
import '../../../../core/route_observer.dart';

// final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
class NfcHandler extends StatefulWidget {
  final String? placeIdToWrite;

  const NfcHandler({super.key, this.placeIdToWrite});

  @override
  State<NfcHandler> createState() => _NfcHandlerState();
}

class _NfcHandlerState extends State<NfcHandler> with WidgetsBindingObserver {
  bool _isProcessing = false;
  static final Uint8List _uriType = Uint8List.fromList('U'.codeUnits);
  bool _isReading = false;
  String _message = 'جاري الانتظار...';

  ////////
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startNfcReading();
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // المستخدم رجع للتطبيق (مثلاً بعد التنقل بين الصفحات)
      _startNfcReading();
    }
  }

  Future<void> _startNfcReading() async {
    setState(() => _isReading = true);
    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        final ndef = Ndef.from(tag);
        if (ndef == null) {
          setState(() => _message = AppConstants.nfcReadError);
          return;
        }

        final message = await ndef.read();
        for (final record in message.records) {
          if (_isUriRecord(record)) {
            String payload = String.fromCharCodes(record.payload)
                .trim()
                .replaceAll(RegExp(r'\s+'), '')
                .replaceAll(RegExp(r'[^\x20-\x7E]'), '');

            if (!payload.startsWith('myapp://')) {
              payload = 'myapp://${payload.replaceFirst('pages/', 'places/')}';
            }

            try {
              final uri = Uri.parse(payload);
              if (uri.host == 'places' && uri.pathSegments.isNotEmpty) {
                final placeId = uri.pathSegments[0];
                if (mounted) context.go('/place/$placeId');
              }
            } on FormatException {
              setState(() => _message = AppConstants.nfcReadError);
            }
          }
        }
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      setState(() => _message = '⚠️ خطأ: ${e.toString()}');
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (_isReading)
        //   const CircularProgressIndicator(
        //     color: Colors.white,
        //     strokeWidth: 3,
        //   ),
        const SizedBox(height: 20),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isReading ? 0.8 : 1.0,
          child: Text(
            _message,
            style: TextStyle(
              fontSize: 18,
              color: _getMessageColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildActionButton(
          'القراءة على البطاقة',
          _isProcessing ? null : _readTag,
          Colors.blue.shade800,
        ),
      ],
    );
  }

  // Color _getMessageColor() {
  //   return _message.contains('✔️')
  //       ? Colors.green.shade200
  //       : _message.contains('❌')
  //           ? Colors.red.shade200
  //           : Colors.white;
  // }

  Color _getMessageColor() {
    if (_message.contains('✔️')) return Colors.green.shade800;
    if (_message.contains('❌')) return Colors.red.shade800;
    if (_message.contains('⚠️')) return Colors.orange.shade800;
    return Colors.grey.shade800;
  }

  Widget _buildActionButton(String text, VoidCallback? onPressed, Color color) {
    return SizedBox(
      width: 240,
      child: ElevatedButton.icon(
        icon: Icon(_getButtonIcon(text)),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        onPressed: onPressed,
      ),
    );
  }

  IconData _getButtonIcon(String text) {
    return text.contains('كتابة') ? Icons.edit_outlined : Icons.nfc_rounded;
  }

  Future<void> _writeTag() async {
    if (widget.placeIdToWrite == null) {
      setState(() => _message = '⚠️ يرجى اختيار مكان أولاً');
      return;
    }

    setState(() {
      _isProcessing = true;
      _message = 'جاري الكتابة...';
    });

    try {
      final uriString =
          'myapp://places/${Uri.encodeComponent(widget.placeIdToWrite!)}';

      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        final ndef = Ndef.from(tag);
        if (ndef == null || !ndef.isWritable) {
          setState(() => _message = AppConstants.nfcWriteError);
          return;
        }

        final records = [
          NdefRecord.createUri(Uri.parse(uriString)),
        ];

        await ndef.write(NdefMessage(records));
        setState(() => _message = AppConstants.nfcWriteSuccess);
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      setState(() => _message = '⚠️ خطأ: ${e.toString()}');
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _readTag() async {
    setState(() {
      _isProcessing = true;
      _message = 'جاري القراءة...';
    });

    try {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        final ndef = Ndef.from(tag);
        if (ndef == null) {
          setState(() => _message = AppConstants.nfcReadError);
          return;
        }

        final message = await ndef.read();
        for (final record in message.records) {
          if (_isUriRecord(record)) {
            String payload = String.fromCharCodes(record.payload)
                .trim()
                .replaceAll(RegExp(r'\s+'), '')
                .replaceAll(RegExp(r'[^\x20-\x7E]'), '');

            if (!payload.startsWith('myapp://')) {
              payload = 'myapp://${payload.replaceFirst('pages/', 'places/')}';
            }

            try {
              final uri = Uri.parse(payload);
              if (uri.host == 'places' && uri.pathSegments.isNotEmpty) {
                final placeId = uri.pathSegments[0];
                if (mounted) context.go('/place/$placeId');
              }
            } on FormatException {
              setState(() => _message = AppConstants.nfcReadError);
            }
          }
        }
        await NfcManager.instance.stopSession();
      });
    } catch (e) {
      setState(() => _message = '⚠️ خطأ: ${e.toString()}');
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  bool _isUriRecord(NdefRecord record) {
    if (record.type.length != _uriType.length) return false;
    for (int i = 0; i < record.type.length; i++) {
      if (record.type[i] != _uriType[i]) return false;
    }
    return true;
  }
}
