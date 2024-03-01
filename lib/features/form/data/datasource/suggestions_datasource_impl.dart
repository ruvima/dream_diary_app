import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../models/suggestions_model.dart';

class SuggestionsDatasourceImpl implements ISuggestionsRepositoty {
  @override
  Future<SuggestionsEntity> suggestions(SelectType type) async {
    try {
      final jsonString = await _loadAsset(type);

      final json = jsonDecode(jsonString);
      final suggestions = SuggestionsModel.fromJson(json);
      return suggestions;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> _loadAsset(SelectType type) async {
    if (type == SelectType.emotion) {
      return rootBundle.loadString(Endpoint.emotions);
    } else if (type == SelectType.people) {
      return rootBundle.loadString(Endpoint.persons);
    } else if (type == SelectType.places) {
      return rootBundle.loadString(Endpoint.places);
    }

    return rootBundle.loadString(Endpoint.tags);
  }
}
