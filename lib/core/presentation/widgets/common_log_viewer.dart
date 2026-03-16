import 'package:flutter/material.dart';
import 'package:flutter_esp32_ble_wifi/core/util/log_entity.dart';

class CommonLogViewer extends StatefulWidget {
  final CommunicationLog logState;
  final String title;
  final VoidCallback? onToggleExpanded;

  const CommonLogViewer({
    super.key,
    required this.logState,
    required this.title,
    this.onToggleExpanded,
  });

  @override
  State<CommonLogViewer> createState() => _CommonLogViewerState();
}

class _CommonLogViewerState extends State<CommonLogViewer> {
  final ScrollController _rxScrollController = ScrollController();
  final ScrollController _txScrollController = ScrollController();

  @override
  void dispose() {
    _rxScrollController.dispose();
    _txScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: widget.logState.isExpanded,
        onExpansionChanged: (expanded) => widget.onToggleExpanded?.call(),
        children: [
          Container(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildLogPanel(
                  title: '실시간 수신 데이터 (RX)',
                  icon: Icons.analytics_rounded,
                  logs: widget.logState.rxLogs,
                  textColor: Colors.blueAccent.shade100,
                  bgColor: Colors.black.withValues(alpha: 0.8),
                  controller: _rxScrollController,
                ),
                const SizedBox(height: 16),
                _buildLogPanel(
                  title: '시스템 송신 로그 (TX)',
                  icon: Icons.send_rounded,
                  logs: widget.logState.txLogs,
                  textColor: Colors.greenAccent.shade400,
                  bgColor: Colors.black.withValues(alpha: 0.8),
                  controller: _txScrollController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogPanel({
    required String title,
    required IconData icon,
    required List<String> logs,
    required Color textColor,
    required Color bgColor,
    required ScrollController controller,
    double height = 150.0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: logs.isEmpty
              ? const Center(
                  child: Text('데이터 수신 대기 중...', style: TextStyle(color: Colors.white24, fontSize: 10)),
                )
              : ListView.builder(
                  controller: controller,
                  padding: EdgeInsets.zero,
                  itemCount: logs.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      logs[index],
                      style: TextStyle(color: textColor, fontSize: 10, fontFamily: 'monospace', height: 1.4),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
