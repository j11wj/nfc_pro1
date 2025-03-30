import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import '../../../../core/constants.dart';

class NfcHandler extends StatefulWidget {
  final String? placeIdToWrite;

  const NfcHandler({super.key, this.placeIdToWrite});

  @override
  State<NfcHandler> createState() => _NfcHandlerState();
}

class _NfcHandlerState extends State<NfcHandler> {
  String _message = AppConstants.nfcInitialMessage;
  bool _isProcessing = false;
  static final Uint8List _uriType = Uint8List.fromList('U'.codeUnits);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          '📝 كتابة على البطاقة',
          _isProcessing ? null : _writeTag,
          AppColors.primaryColor,
        ),
        const SizedBox(height: 20),
        _buildActionButton(
          '📖 قراءة البطاقة',
          _isProcessing ? null : _readTag,
          AppColors.secondaryColor,
        ),
        const SizedBox(height: 30),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            _message,
            key: ValueKey<String>(_message),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: _getMessageColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (_isProcessing)
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
      ],
    );
  }

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
      final uriString = 'myapp://places/${Uri.encodeComponent(widget.placeIdToWrite!)}';

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