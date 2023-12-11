import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/widgets/text_widgets.dart';

class DreamCard extends StatelessWidget {
  const DreamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const KCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headline6Text('Sueño de un circo'),
                gapH8,
                BodyText1Text(
                  'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.',
                  maxLines: 4,
                ),
              ],
            ),
          ),
          KDivider(
            vertical: true,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Subtitle1Text('Fragmentado'),
          )
        ],
      ),
    );
  }
}
