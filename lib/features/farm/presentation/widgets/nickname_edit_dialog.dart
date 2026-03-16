import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_dashboard_controller.dart';

class NicknameEditDialog extends ConsumerStatefulWidget {
  final String deviceId;
  final String currentName;

  const NicknameEditDialog({
    super.key,
    required this.deviceId,
    required this.currentName,
  });

  @override
  ConsumerState<NicknameEditDialog> createState() => _NicknameEditDialogState();
}

class _NicknameEditDialogState extends ConsumerState<NicknameEditDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: const Text('기기 이름 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: '새로운 이름',
          hintText: '예: 거실 조명',
          border: OutlineInputBorder(),
        ),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () async {
            final newName = _controller.text.trim();
            if (newName.isEmpty || newName == widget.currentName) {
              Navigator.pop(context);
              return;
            }

            final result = await ref
                .read(farmDashboardProvider.notifier)
                .renameDevice(widget.deviceId, newName);

            if (context.mounted) {
              switch (result) {
                case Success():
                  Navigator.pop(context);
                case Failure(exception: final e):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('수정 실패: ${e.readableMessage}')),
                  );
              }
            }
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}
