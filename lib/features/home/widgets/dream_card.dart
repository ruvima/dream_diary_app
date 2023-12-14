part of '../screens/home_screen.dart';

class DreamCard extends StatelessWidget {
  const DreamCard({
    super.key,
    required this.dream,
  });

  final DreamEntity dream;

  @override
  Widget build(BuildContext context) {
    return KCard(
      child: KInkwell(
        onTap: () => KModalBottomSheet.show(
          context,
          child: KBottomSheetContainer(
            child: _DreamDetails(dream),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(KSizes.p12),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: KSizes.p4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KHeadline6(dream.title),
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
              ),
              if (dream.emotion != Emotion.unknown) ...[
                const KDivider(
                  vertical: true,
                ),
                gapW4,
                _Emotion(emotion: dream.emotion),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Emotion extends StatelessWidget {
  const _Emotion({
    required this.emotion,
  });

  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: RotatedBox(
        quarterTurns: 3,
        child: KTextMedium(emotion.emotionName),
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

class KInkwell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double borderRadius;
  const KInkwell({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      splashColor: Theme.of(context).colorScheme.error,
      highlightColor: Theme.of(context).colorScheme.error,
      onTap: onTap,
      child: child,
    );
  }
}
