part of '../screens/home_screen.dart';

class _DreamDetails extends StatelessWidget {
  const _DreamDetails(this.dream);

  final DreamEntity dream;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        gapH4,
        const KTextSmall('Descripcion:'),
        KTextMedium(
          dream.description,
        ),
        gapH4,
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_month),
            gapW4,
            KTextMedium('17/21/2220'),
          ],
        ),
        gapH4,
        const KTextSmall('Tipo de sueño:'),
        KWrap(
          alignment: WrapAlignment.start,
          children: List.generate(
            dream.dreamTypes.length,
            (index) => KChip(
              compact: true,
              label: dream.dreamTypes[index].name,
            ),
          ),
        ),
        gapH4,
        const KTextSmall('Emocion:'),
        KTextMedium(dream.emotion.name),
        gapH4,
        const KTextSmall('Clarity:'),
        KTextMedium(dream.clarity.name),
        gapH4,
        const KTextSmall('Pesonas en el sueño:'),
        KWrap(
          alignment: WrapAlignment.start,
          children: List.generate(
            dream.people.length,
            (index) => KChip(
              compact: true,
              label: dream.people[index],
            ),
          ),
        ),
        gapH4,
        const KTextSmall('Tags:'),
        KWrap(
          alignment: WrapAlignment.start,
          children: List.generate(
            dream.tags.length,
            (index) => KChip(
              compact: true,
              label: dream.tags[index],
            ),
          ),
        ),
        Container(
          color: AppColors.darkOnSecondary,
          height: 100,
          width: double.infinity,
        )
      ],
    );
  }
}
