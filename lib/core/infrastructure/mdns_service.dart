import 'package:multicast_dns/multicast_dns.dart';
import 'package:flutter_esp32_ble_wifi/core/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mdns_service.g.dart';

abstract class MdnsService {
  Future<String> resolveService(String name);
}

@Riverpod(keepAlive: true)
MdnsService mdnsService(Ref ref) {
  return MdnsServiceImpl();
}

class MdnsServiceImpl implements MdnsService {
  @override
  Future<String> resolveService(String name) async {
    final String target = name.endsWith('.local') ? name : '$name.local';
    final MDnsClient client = MDnsClient();
    await client.start();

    try {
      AppLogger.d("mDNS: Looking up $target...", tag: 'INFRA-MDNS');
      
      await for (final IPAddressResourceRecord address in client.lookup<IPAddressResourceRecord>(
        ResourceRecordQuery.addressIPv4(target),
      ).timeout(const Duration(seconds: 5))) {
        AppLogger.i("mDNS: Found $target at ${address.address.address}", tag: 'INFRA-MDNS');
        return address.address.address;
      }
      throw Exception("Service not found: $target");
    } finally {
      client.stop();
    }
  }
}
