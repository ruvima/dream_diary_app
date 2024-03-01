part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class GetSuggestions extends Event {
  const GetSuggestions(this.selectType);
  final SelectType selectType;
}
