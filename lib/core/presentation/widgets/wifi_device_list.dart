import 'package:flutter/material.dart';

class WifiDeviceList<T> extends StatelessWidget {
  final List<T> networks;
  final bool isScanning;
  final Function(T) onNetworkTap;
  final bool filterDevices;
  final String? selectedSsid;

  final String Function(T) getSsid;
  final int Function(T) getRssi;
  final bool Function(T) getIsSecure;

  const WifiDeviceList({
    super.key,
    required this.networks,
    required this.isScanning,
    required this.onNetworkTap,
    required this.getSsid,
    required this.getRssi,
    required this.getIsSecure,
    this.filterDevices = true,
    this.selectedSsid,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredList = filterDevices
        ? networks.where((n) => getSsid(n).contains("esp32_")).toList()
        : networks;

    if (isScanning && filteredList.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('연결 가능한 주변 기기를 찾는 중...', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    if (filteredList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded, size: 48, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            const Text('검색된 결과가 없습니다.', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final net = filteredList[index];
        final ssid = getSsid(net);
        final rssi = getRssi(net);
        final isSecure = getIsSecure(net);

        final bool isSelected = selectedSsid != null && ssid == selectedSsid;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.08)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? colorScheme.primary : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            leading: CircleAvatar(
              backgroundColor: isSelected
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
              radius: 20,
              child: Icon(
                Icons.wifi_rounded,
                size: 20,
                color: isSelected ? Colors.white : _getSignalColor(rssi),
              ),
            ),
            title: Text(
              ssid,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              '신호 세기: $rssi dBm',
              style: const TextStyle(fontSize: 11),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSecure)
                  Icon(
                    Icons.lock_outline,
                    size: 14,
                    color: isSelected ? colorScheme.primary : Colors.grey,
                  ),
                if (isSelected) const SizedBox(width: 8),
                if (isSelected)
                  Icon(
                    Icons.check_circle_rounded,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                if (!isSelected)
                  const Icon(Icons.chevron_right_rounded, size: 20),
              ],
            ),
            onTap: () => onNetworkTap(net),
          ),
        );
      },
    );
  }

  Color _getSignalColor(int rssi) {
    if (rssi >= -60) return Colors.green;
    if (rssi >= -80) return Colors.orange;
    return Colors.red;
  }
}
