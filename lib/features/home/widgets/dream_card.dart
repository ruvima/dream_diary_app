import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/widgets/text_widgets.dart';
import '../domain/domain.dart';

class DreamCard extends StatelessWidget {
  const DreamCard({
    super.key,
    required this.dream,
  });

  final DreamEntity dream;

  @override
  Widget build(BuildContext context) {
    return KCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KTextLarge(dream.title),
                gapH8,
                KTextMedium(
                  dream.description,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          const KDivider(
            vertical: true,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: KTextMedium(dream.emotion.name),
          )
        ],
      ),
    );
  }
}

//DOMAIN
abstract class AudioRepository {
  Future<List<String>> fetchAudios();
}

abstract class AudioDatasource {
  Future<List<String>> fetchAudios();
}

//DATA
class AudioRepositoryImpl extends AudioRepository {
  AudioRepositoryImpl({
    required AudioDatasource? audioDatasource,
  }) : _audioDatasource = audioDatasource ?? AudioDatasourceImpl();
  final AudioDatasource _audioDatasource;

  @override
  Future<List<String>> fetchAudios() async {
    return _audioDatasource.fetchAudios();
  }
}

class AudioDatasourceImpl extends AudioDatasource {
  @override
  Future<List<String>> fetchAudios() async {
    return [''];
  }
}
