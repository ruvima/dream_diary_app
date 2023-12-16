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
        const KTextMedium('Descripcion:'),
        KTextLarge(
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
        const KTextMedium('Tipo de sueño:'),
        KWrap(
          alignment: WrapAlignment.start,
          children: List.generate(
            dream.dreamTypes.length,
            (index) => KChip(
              compact: true,
              label: dream.dreamTypes[index].dreamTypeName,
            ),
          ),
        ),
        gapH4,
        const KTextMedium('Emocion:'),
        KTextLarge(dream.emotion.emotionName),
        gapH4,
        const KTextMedium('Clarity:'),
        DreamClarityWidget(clarity: dream.clarity),
        gapH4,
        const KTextMedium('Pesonas en el sueño:'),
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
      ],
    );
  }
}

// TODO: MOVE AND FINISH
class DreamClarityWidget extends StatelessWidget {
  final double clarity;

  const DreamClarityWidget({
    Key? key,
    required this.clarity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: clarity < 0.5
                  ? [Colors.blue, Colors.white]
                  : [Colors.white, Colors.blue],
            )),
        child: Center(
          child: KTextMedium('${(clarity * 100)}%'),
        ));
  }
}
