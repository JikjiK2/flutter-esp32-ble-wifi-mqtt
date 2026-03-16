import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/core/util/result.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_rule_controller.dart';

class RuleFormScreen extends ConsumerStatefulWidget {
  final String deviceId;
  final RuleEntity? rule;

  const RuleFormScreen({super.key, required this.deviceId, this.rule});

  @override
  ConsumerState<RuleFormScreen> createState() => _RuleFormScreenState();
}

class _RuleFormScreenState extends ConsumerState<RuleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _sensorType;
  late double _threshold;
  late String _condition;
  late String _actionCommand;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.rule?.name ?? '');
    _sensorType = (widget.rule?.sensorType ?? 'temperature').toLowerCase();
    _threshold = widget.rule?.threshold ?? 25.0;
    _condition = (widget.rule?.condition ?? 'greater_than').toLowerCase();
    _actionCommand = (widget.rule?.actionCommand ?? 'power_off').toLowerCase();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveRule() async {
    if (_isSaving) return;

    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);

      final rule = RuleEntity(
        id: widget.rule?.id,
        deviceId: widget.deviceId,
        name: _nameController.text.trim(),
        sensorType: _sensorType,
        threshold: _threshold,
        condition: _condition,
        actionCommand: _actionCommand,
        isActive: widget.rule?.isActive ?? true,
      );

      final notifier = ref.read(
        farmRuleControllerProvider(widget.deviceId).notifier,
      );

      final result = widget.rule == null
          ? await notifier.addRule(rule)
          : await notifier.updateRule(rule);

      if (mounted) {
        if (result is Success) {
          context.pop();
        } else {
          setState(() => _isSaving = false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('저장 실패')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          widget.rule == null ? '자동화 규칙 추가' : '규칙 수정',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildSectionTitle(colorScheme, "규칙 이름"),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: '예: 고온 시 전원 끄기',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              validator: (v) => (v == null || v.isEmpty) ? '이름을 입력하세요' : null,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(colorScheme, "조건 설정"),
            _buildConditionSelector(colorScheme),
            const SizedBox(height: 32),
            _buildSectionTitle(colorScheme, "실행 액션"),
            RadioGroup<String>(
              groupValue: _actionCommand,
              onChanged: (String? value) {
                if (value != null) {
                  setState(() => _actionCommand = value);
                }
              },
              child: Column(
                children: [
                  _buildActionRadio(
                    colorScheme,
                    'POWER_ON',
                    '전원 켜기',
                    '조건이 충족되면 기기의 전원을 자동으로 켭니다.',
                  ),
                  _buildActionRadio(
                    colorScheme,
                    'POWER_OFF',
                    '전원 끄기',
                    '조건이 충족되면 기기의 전원을 자동으로 끕니다.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            FilledButton(
              onPressed: _isSaving ? null : _saveRule,
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: _isSaving
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      '규칙 저장하기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ColorScheme colorScheme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildConditionSelector(ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: _sensorType,
              decoration: const InputDecoration(
                labelText: '센서 종류',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'temperature', child: Text('온도')),
                DropdownMenuItem(value: 'humidity', child: Text('습도')),
              ],
              onChanged: (v) => setState(() => _sensorType = v!),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    initialValue: _condition,
                    decoration: const InputDecoration(
                      labelText: '비교 조건',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'greater_than',
                        child: Text('이상'),
                      ),
                      DropdownMenuItem(value: 'less_than', child: Text('이하')),
                    ],
                    onChanged: (v) => setState(() => _condition = v!),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: _threshold.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: '임계값',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onChanged: (v) => setState(
                      () => _threshold = double.tryParse(v) ?? _threshold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRadio(
    ColorScheme colorScheme,
    String value,
    String title,
    String subtitle,
  ) {
    final bool isSelected = _actionCommand == value;
    return GestureDetector(
      onTap: () => setState(() => _actionCommand = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer.withValues(alpha: 0.3)
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(value: value),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
