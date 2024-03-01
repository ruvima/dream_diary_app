part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchEvent extends Event {
  SearchEvent({
    this.searchTerm,
    this.showTextField,
  });

  final String? searchTerm;
  final bool? showTextField;
  @override
  List<Object?> get props => [
        searchTerm,
        showTextField,
      ];
}
