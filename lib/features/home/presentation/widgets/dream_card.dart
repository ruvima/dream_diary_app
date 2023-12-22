part of '../screens/home_screen.dart';

class DreamCard extends StatelessWidget {
  const DreamCard({
    super.key,
    required this.dream,
  });

  final DreamEntity dream;

  @override
  Widget build(BuildContext context) {
    return KInkwell(
      onTap: () => Modular.to.pushNamed(
        Routes.dreamDetails,
        arguments: dream.id,
      ),
      child: KModernCard(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.p12).copyWith(right: KSizes.p4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KTextLarge(
                      dream.title,
                      fontWeight: FontWeight.w600,
                    ),
                    gapH8,
                    KTextMedium(
                      dream.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH4,
                    _Tags(tags: dream.tags)
                  ],
                ),
              ),
              gapW4,
              _Date(
                dateTime: dream.date,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Date extends StatelessWidget {
  const _Date({
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Opacity(
      opacity: 0.7,
      child: RotatedBox(
        quarterTurns: 3,
        child: KTextMedium(
          DateFormatter.modularDay(dateTime),
          color: colors.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return KWrap(
      children: List.generate(
        tags.length < 4 ? tags.length : 4,
        (index) {
          final tag = tags[index];
          final shortTag = tag.length > 8 ? '${tag.substring(0, 8)}...' : tag;

          return KChip(
            label: shortTag,
            compact: true,
          );
        },
      ),
    );
  }
}
