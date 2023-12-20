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
        onTap: () => Modular.to.pushNamed(
          Routes.dreamDetails,
          arguments: dream,
        ),
        child: Padding(
          padding: const EdgeInsets.all(KSizes.p12),
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
              ...[
                const KDivider(
                  vertical: true,
                ),
                gapH12,
                _Date(
                  dateTime: dream.date,
                ),
              ],
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
    return Opacity(
      opacity: 0.5,
      child: RotatedBox(
        quarterTurns: 3,
        child: KTextMedium(DateFormatter.shortDate(dateTime)),
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
