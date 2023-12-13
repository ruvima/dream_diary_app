part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class LoadDreamsEvent extends Event {}

class AddDreamEvent extends Event {}

class UpdateDreamEvent extends Event {}

class DeleteDreamEvent extends Event {}
