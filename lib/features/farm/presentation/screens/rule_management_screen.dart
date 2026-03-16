import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/domain/entities/rule_entity.dart';
import 'package:flutter_esp32_ble_wifi/features/farm/presentation/providers/farm_rule_controller.dart';

class RuleManagementScreen extends ConsumerWidget {
  final String deviceId;

  const RuleManagementScreen({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rulesAsync = ref.watch(farmRuleControllerProvider(deviceId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          '자동화 규칙 관리',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () => context.push('/rules/$deviceId/add'),
          ),
        ],
      ),
      body: rulesAsync.when(
        data: (rules) => rules.isEmpty
            ? _buildEmptyState(context)
            : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  final rule = rules[index];
                  return _RuleCard(
                    rule: rule,
                    deviceId: deviceId,
                    onTap: () =>
                        context.push('/rules/$deviceId/edit', extra: rule),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                '규칙을 불러오지 못했습니다.',
                style: TextStyle(color: colorScheme.onSurface),
              ),
              TextButton(
                onPressed: () =>
                    ref.invalidate(farmRuleControllerProvider(deviceId)),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.rule_rounded, size: 80, color: colorScheme.outlineVariant),
          const SizedBox(height: 24),
          Text(
            '등록된 자동화 규칙이 없습니다.',
            style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: () => context.push('/rules/$deviceId/add'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            icon: const Icon(Icons.add_rounded),
            label: const Text(
              '새로운 자동화 규칙 추가하기',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _RuleCard extends ConsumerWidget {
  final RuleEntity rule;
  final String deviceId;
  final VoidCallback onTap;

  const _RuleCard({
    required this.rule,
    required this.deviceId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isActive = rule.isActive;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isActive ? 1.0 : 0.6,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isActive
                ? colorScheme.primary.withValues(alpha: 0.2)
                : colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        color: isActive
            ? colorScheme.primaryContainer.withValues(alpha: 0.1)
            : colorScheme.surfaceContainerLow,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        rule.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: isActive,
                      activeTrackColor: colorScheme.primary.withValues(
                        alpha: 0.5,
                      ),
                      onChanged: (val) {
                        ref
                            .read(farmRuleControllerProvider(deviceId).notifier)
                            .updateRule(rule.copyWith(isActive: val));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildRuleDescription(colorScheme),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.edit_note_rounded, size: 20),
                      label: const Text('수정'),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.error,
                      ),
                      onPressed: () => _confirmDelete(context, ref),
                      icon: const Icon(Icons.delete_sweep_rounded, size: 20),
                      label: const Text('삭제'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRuleDescription(ColorScheme colorScheme) {
    final sensorType = rule.sensorType.toLowerCase();
    final bool isTemp =
        sensorType.contains('temp') || sensorType == 'temperature';
    final sensor = isTemp ? '온도' : '습도';
    final unit = isTemp ? '°C' : '%';

    String conditionText = '';
    final cond = rule.condition.toLowerCase();
    if (cond.contains('greater_than') || cond == 'gte' || cond == '>=') {
      conditionText = '이상';
    } else if (cond.contains('less_than') || cond == 'lte' || cond == '<=') {
      conditionText = '이하';
    } else {
      conditionText = rule.condition;
    }

    final actionCmd = rule.actionCommand.toUpperCase();
    final action = (actionCmd == 'POWER_ON' || actionCmd == 'ON')
        ? '전원 켜기'
        : (actionCmd == 'POWER_OFF' || actionCmd == 'OFF')
        ? '전원 끄기'
        : '알림 받기';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 16,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 14,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: '$sensor가 ',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  TextSpan(
                    text: '${rule.threshold.toInt()}$unit $conditionText',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: '일 때 ',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  TextSpan(
                    text: action,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final colorScheme = Theme.of(context).colorScheme;
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('규칙 삭제'),
        content: const Text('이 자동화 규칙을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '삭제',
              style: TextStyle(
                color: colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      ref
          .read(farmRuleControllerProvider(deviceId).notifier)
          .removeRule(rule.id!);
    }
  }
}
