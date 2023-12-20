import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/domain/domain.dart';
import '../../blocs/dream/bloc.dart' as dream_bloc;

class DreamDetailsScreen extends StatelessWidget {
  const DreamDetailsScreen({
    super.key,
    required this.dream,
  });

  final DreamEntity dream;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        title: Text(UiValues.dreamDetailsTitle),
        actions: [
          _MenuButton(dreamId: dream.isarId),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TextSize.s16),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(KSizes.p12),
            ),
            color: colors.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: KTextMedium(
                  DateFormatter.fullDate(dream.date),
                  fontWeight: FontWeight.w600,
                ),
              ),
              KTextMedium(
                UiValues.dreamTitleLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              KHeadline6(dream.title),
              gapH12,
              KTextMedium(UiValues.dreamDescriptionLabel,
                  fontWeight: FontWeight.w600),
              gapH4,
              KTextLarge(dream.description),
              gapH12,
              KTextMedium(UiValues.dreamClarityLabel,
                  fontWeight: FontWeight.w600),
              gapH4,
              _DreamClarity(dream.clarity),
              gapH12,
              KTextMedium(UiValues.dreamTypeLabel, fontWeight: FontWeight.w600),
              gapH4,
              _WrappedItems(dream.dreamTypes),
              gapH12,
              KTextMedium(
                UiValues.peopleInDreamLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              _WrappedItems(dream.people),
              gapH12,
              KTextMedium(
                UiValues.placesLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              _WrappedItems(dream.places),
              gapH12,
              KTextMedium(
                UiValues.tagsLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              _WrappedItems(dream.tags),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.dreamId});

  final int dreamId;

  @override
  Widget build(BuildContext context) {
    final items = [MenuOption.edit, MenuOption.delete];

    String menuItemLabel(MenuOption menuOption) {
      return menuOption == MenuOption.edit
          ? UiValues.edit
          : menuOption == MenuOption.delete
              ? UiValues.delete
              : '';
    }

    return PopupMenuButton<MenuOption>(
      onSelected: (menuOption) {
        if (menuOption == MenuOption.edit) {
        } else if (menuOption == MenuOption.delete) {
          _showDeleteDialog(context, dreamId: dreamId);
        }
      },
      itemBuilder: (_) => List.generate(
        items.length,
        (index) => PopupMenuItem<MenuOption>(
          value: MenuOption.values[index],
          child: KTextMedium(
            menuItemLabel(
              items[index],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog(
    BuildContext context, {
    required int dreamId,
  }) {
    return KShowDialog.alertDialog(
      context,
      title: UiValues.deleteDreamTitle,
      content: UiValues.deleteDreamContent,
      onCancel: () => Navigator.pop(context),
      textOnCancel: UiValues.cancel,
      onAcept: () {
        Modular.get<dream_bloc.DreamBloc>().add(
          dream_bloc.DeleteDreamEvent(dreamId),
        );
        Modular.to.pushReplacementNamed(Routes.home);
      },
      textOnAcept: UiValues.delete,
    );
  }
}

class _DreamClarity extends StatelessWidget {
  final double clarity;

  const _DreamClarity(this.clarity);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // final clarityPercent = '${(clarity * 100).toStringAsFixed(0)}%';

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: clarity),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
      builder: (context, value, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth * value;
            final clarityPercent = '${(value * 100).toStringAsFixed(0)}%';

            return Stack(
              children: [
                Container(
                  height: 25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(TextSize.s12),
                      border: Border.all(width: 0.1),
                      color: colors.primary.withOpacity(0.5)),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 25,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(TextSize.s12),
                      color: colors.primary,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  width: clarity != 0 ? width : constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: KSizes.p12),
                    child: KTextLarge(
                      clarityPercent,
                      textAlign:
                          clarity != 0 ? TextAlign.end : TextAlign.center,
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class _WrappedItems extends StatelessWidget {
  const _WrappedItems(this.items);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: KWrap(
        children: List.generate(
          items.length,
          (index) => KChip(
            label: items[index],
          ),
        ).toList(),
      ),
    );
  }
}
