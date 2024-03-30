part of '../screens/analysis_screen.dart';

class _Details extends StatelessWidget {
  const _Details({
    required this.totalDreams,
    required this.totalWords,
  });
  final int totalDreams;
  final int totalWords;
  @override
  Widget build(BuildContext context) {
    return KCard(
      child: Padding(
        padding: const EdgeInsets.all(KSizes.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KTextLarge(
              'Detalles: ',
              fontWeight: FontWeight.w600,
            ),
            KTextMedium('Numero de sueños: $totalDreams'),
            KTextMedium('Palabras en las descripciones: $totalWords'),
          ],
        ),
      ),
    );
  }
}
