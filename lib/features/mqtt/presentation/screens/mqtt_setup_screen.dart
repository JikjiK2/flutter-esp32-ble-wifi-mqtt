import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/wizard_step_layout.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/step_error_message.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/setup_step_indicator.dart';
import 'package:flutter_esp32_ble_wifi/core/presentation/widgets/wifi_device_list.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/domain/entities/mqtt_setup_network.dart';
import 'package:flutter_esp32_ble_wifi/features/mqtt/presentation/providers/mqtt_setup_controller.dart';

Widget _buildSelectionSummary(
  ColorScheme colorScheme,
  String label,
  String value, {
  IconData icon = Icons.check_circle_rounded,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: colorScheme.primaryContainer.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
    ),
    child: Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.primary),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

class MqttSetupScreen extends ConsumerStatefulWidget {
  const MqttSetupScreen({super.key});

  @override
  ConsumerState<MqttSetupScreen> createState() => _MqttSetupScreenState();
}

class _MqttSetupScreenState extends ConsumerState<MqttSetupScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> _showExitConfirmDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('설정 중단'),
        content: const Text('기기 등록 과정을 중단하시겠습니까?\n지금 중단하면 입력한 설정이 저장되지 않습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('계속 진행'),
          ),
          TextButton(
            onPressed: () {
              ref.read(mqttSetupControllerProvider.notifier).resetSession();
              Navigator.pop(context, true);
            },
            child: Text(
              '중단',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final setupStateAsync = ref.watch(mqttSetupControllerProvider);
    final controller = ref.read(mqttSetupControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(mqttSetupControllerProvider, (prev, next) {
      next.whenData((state) {
        final int pageIndex = state.currentStep.index;
        if (_pageController.hasClients &&
            _pageController.page?.round() != pageIndex) {
          _pageController.animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _showExitConfirmDialog();
        if (shouldPop && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '클라우드 기기 등록',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () async {
              if (await _showExitConfirmDialog() && context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          actions: [
            setupStateAsync.maybeWhen(
              data: (state) =>
                  (state.currentStep == MqttSetupStep.selectDevice ||
                      state.currentStep == MqttSetupStep.selectWifi)
                  ? (state.isScanning
                        ? const _LoadingSpinner()
                        : IconButton(
                            icon: const Icon(Icons.refresh_rounded),
                            tooltip: "다시 스캔",
                            onPressed: state.isProcessing
                                ? null
                                : () => controller.scanWifi(),
                          ))
                  : const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
        body: setupStateAsync.when(
          data: (state) => Stack(
            children: [
              Column(
                children: [
                  if (state.currentStep != MqttSetupStep.guidelines &&
                      state.currentStep != MqttSetupStep.success)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                      child: SetupStepIndicator(
                        currentStep: state.currentStep.index,
                        totalSteps: 4,
                      ),
                    ),

                  if (state.currentStep.index >= MqttSetupStep.identity.index &&
                      state.currentStep != MqttSetupStep.success)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          if (state.selectedDeviceId.isNotEmpty)
                            _buildSelectionSummary(
                              colorScheme,
                              "등록 기기",
                              state.deviceName.isEmpty
                                  ? state.selectedDeviceId
                                  : "${state.deviceName} (${state.selectedDeviceId})",
                              icon: Icons.devices_other_rounded,
                            ),
                          if (state.currentStep.index >=
                                  MqttSetupStep.finalize.index &&
                              state.selectedSsid.isNotEmpty)
                            _buildSelectionSummary(
                              colorScheme,
                              "연결 WiFi",
                              state.selectedSsid,
                              icon: Icons.wifi_rounded,
                            ),
                        ],
                      ),
                    ),

                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _Step1Guidelines(controller: controller),
                        _Step2SelectDevice(
                          state: state,
                          controller: controller,
                        ),
                        _Step3Identity(state: state, controller: controller),
                        _Step4Wifi(state: state, controller: controller),
                        _Step6Finalize(state: state, controller: controller),
                        _Step7Success(state: state, controller: controller),
                      ],
                    ),
                  ),
                ],
              ),
              if (state.isProcessing)
                _buildProcessingOverlay(
                  colorScheme,
                  state.loadingMessage,
                  controller,
                ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text("오류가 발생했습니다: $e")),
        ),
      ),
    );
  }

  Widget _buildProcessingOverlay(
    ColorScheme colorScheme,
    String message,
    MqttSetupController controller,
  ) {
    final isDeviceConnecting = message.contains("기기에 접속");

    return Container(
      color: colorScheme.scrim.withValues(alpha: 0.6),
      child: Center(
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 24),
                const Text(
                  "처리 중",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),

                if (!isDeviceConnecting) ...[
                  const SizedBox(height: 32),
                  TextButton.icon(
                    onPressed: () => controller.cancelProcessing(),
                    icon: const Icon(Icons.stop_circle_outlined, size: 18),
                    label: const Text("중단하기"),
                    style: TextButton.styleFrom(
                      foregroundColor: colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Step1Guidelines extends StatelessWidget {
  final MqttSetupController controller;

  const _Step1Guidelines({required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WizardStepLayout(
      title: "기기 등록 안내",
      helpText: "안정적인 클라우드 연결을 위해 확인해 주세요.",
      accentColor: colorScheme.primary,
      onNext: () => controller.startSetup(),
      nextLabel: "시작하기",
      child: Column(
        children: [
          _buildItem(
            colorScheme,
            Icons.wifi_tethering_rounded,
            "기기 AP 직접 접속",
            "설정 과정 중 스마트폰이 기기가 만든 전용 WiFi(_Setup)에 자동으로 접속합니다.",
          ),
          _buildItem(
            colorScheme,
            Icons.router_rounded,
            "2.4GHz WiFi 지원",
            "기기는 2.4GHz 대역의 WiFi만 지원합니다. 공유기 설정을 확인해 주세요.",
          ),
          _buildItem(
            colorScheme,
            Icons.my_location_rounded,
            "권한 허용",
            "주변 기기 탐색을 위해 위치 서비스(GPS)와 블루투스 권한이 필요할 수 있습니다.",
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    ColorScheme colorScheme,
    IconData icon,
    String title,
    String body,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colorScheme.primary, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Step2SelectDevice extends StatelessWidget {
  final MqttSetupState state;
  final MqttSetupController controller;

  const _Step2SelectDevice({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WizardStepLayout(
      title: "1. 기기 선택",
      helpText: "목록에서 등록할 스마트팜 기기를 선택하세요.",
      accentColor: colorScheme.primary,
      onNext: state.selectedSsid.isNotEmpty
          ? () => controller.connectToDevice(state.selectedSsid)
          : null,
      nextLabel: "기기에 연결",
      bottom: Column(
        children: [
          if (state.selectedSsid.isNotEmpty)
            _buildSelectionSummary(
              colorScheme,
              "선택된 기기",
              state.selectedSsid,
              icon: Icons.check_circle_outline_rounded,
            ),
          if (state.stepError != null)
            StepErrorMessage(message: state.stepError!),
          const SizedBox(height: 16),
          _buildTip(colorScheme),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: WifiDeviceList<MqttSetupNetwork>(
          networks: state.scanResults,
          isScanning: state.isScanning,
          filterDevices: true,
          getSsid: (n) => n.ssid,
          getRssi: (n) => n.rssi,
          getIsSecure: (n) => n.isSecure,
          selectedSsid: state.selectedSsid,
          onNetworkTap: (net) => controller.selectSsid(net.ssid),
        ),
      ),
    );
  }

  Widget _buildTip(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            size: 20,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "기기가 보이지 않는다면 기기의 설정 버튼을 5초 이상 길게 눌러 초기화해 주세요.",
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step3Identity extends StatefulWidget {
  final MqttSetupState state;
  final MqttSetupController controller;

  const _Step3Identity({required this.state, required this.controller});

  @override
  State<_Step3Identity> createState() => _Step3IdentityState();
}

class _Step3IdentityState extends State<_Step3Identity> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.state.deviceName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WizardStepLayout(
      title: "2. 기기 별명 설정",
      helpText: "어디에 있는 기기인지 알기 쉽게 이름을 정해 주세요.",
      accentColor: colorScheme.primary,
      onNext: widget.state.deviceName.trim().isNotEmpty
          ? () => widget.controller.nextStep()
          : null,
      nextLabel: "기기 이름 확정",
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "기기 이름",
              hintText: "한글/영문 모두 가능합니다",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.edit_note_rounded),
            ),
            onChanged: (v) => widget.controller.updateDeviceName(v),
          ),
          const SizedBox(height: 24),
          Text(
            "기기 고유 ID: ${widget.state.selectedDeviceId}",
            style: TextStyle(
              fontSize: 13,
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Step4Wifi extends ConsumerWidget {
  final MqttSetupState state;
  final MqttSetupController controller;

  const _Step4Wifi({required this.state, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WizardStepLayout(
      title: "3. WiFi 선택",
      helpText: "기기가 클라우드에 접속할 공유기를 선택하세요.",
      accentColor: Theme.of(context).colorScheme.primary,
      bottom: Column(
        children: [
          if (state.stepError != null)
            StepErrorMessage(message: state.stepError!),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: WifiDeviceList<MqttSetupNetwork>(
          networks: state.scanResults,
          isScanning: state.isScanning,
          filterDevices: false,
          getSsid: (n) => n.ssid,
          getRssi: (n) => n.rssi,
          getIsSecure: (n) => n.isSecure,
          selectedSsid: state.selectedSsid,
          onNetworkTap: (net) {
            controller.onWifiSelected(
              net,
              onRequirePassword: (ssid) {
                _showPasswordInputSheet(context, ref, ssid);
              },
            );
          },
        ),
      ),
    );
  }

  void _showPasswordInputSheet(
    BuildContext context,
    WidgetRef ref,
    String ssid,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) => _MqttPasswordInputSheet(ssid: ssid, ref: ref),
    );
  }
}

class _MqttPasswordInputSheet extends StatefulWidget {
  final String ssid;
  final WidgetRef ref;

  const _MqttPasswordInputSheet({required this.ssid, required this.ref});

  @override
  State<_MqttPasswordInputSheet> createState() =>
      _MqttPasswordInputSheetState();
}

class _MqttPasswordInputSheetState extends State<_MqttPasswordInputSheet> {
  final _controller = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        28,
        24,
        28,
        MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_lock_rounded,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.ssid,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            obscureText: _obscure,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "WiFi 비밀번호",
              hintText: "비밀번호를 입력하세요",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.lock_rounded),
              suffixIcon: IconButton(
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _obscure = !_obscure),
              ),
            ),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              final password = _controller.text.trim();
              widget.ref
                  .read(mqttSetupControllerProvider.notifier)
                  .updateWifiPassword(password);
              Navigator.pop(context);
              widget.ref.read(mqttSetupControllerProvider.notifier).nextStep();
            },
            icon: const Icon(Icons.check_circle_rounded),
            label: const Text(
              "연결 및 설정 확인",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step6Finalize extends StatelessWidget {
  final MqttSetupState state;
  final MqttSetupController controller;

  const _Step6Finalize({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WizardStepLayout(
      title: "4. 최종 확인",
      helpText: "정보가 정확한지 확인하고 등록을 시작하세요.",
      accentColor: colorScheme.primary,
      onNext: () => controller.completeRegistration(),
      nextLabel: "클라우드 등록 및 시작",
      child: Column(
        children: [
          _buildFinalRow(
            colorScheme,
            Icons.fingerprint_rounded,
            "기기 고유 ID",
            state.selectedDeviceId,
          ),
          _buildFinalRow(
            colorScheme,
            Icons.label_rounded,
            "기기 별명",
            state.deviceName,
          ),
          _buildFinalRow(
            colorScheme,
            Icons.wifi_rounded,
            "연결 WiFi",
            state.selectedSsid,
          ),
          _buildFinalRow(
            colorScheme,
            Icons.cloud_done_rounded,
            "클라우드 서버",
            "ESP32 Cloud (MQTT)",
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            "등록 시작을 누르면 기기가 재시작되며 즉시 제어가 가능해집니다.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildFinalRow(
    ColorScheme colorScheme,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 16),
          Text(label, style: TextStyle(color: colorScheme.onSurfaceVariant)),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _Step7Success extends StatelessWidget {
  final MqttSetupState state;
  final MqttSetupController controller;

  const _Step7Success({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WizardStepLayout(
      title: "등록 완료!",
      helpText: "기기가 클라우드에 성공적으로 등록되었습니다.",
      accentColor: colorScheme.primary,
      onNext: () => context.go('/farm_dashboard'),
      nextLabel: "대시보드로 이동",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.check_circle_rounded,
            size: 100,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 32),
          const Text(
            "모든 설정이 완료되었습니다",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "이제 전 세계 어디서든\n실시간으로 기기를 관리해 보세요.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _LoadingSpinner extends StatelessWidget {
  const _LoadingSpinner();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
