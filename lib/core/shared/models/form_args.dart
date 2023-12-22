import '../../core.dart';
import '../domain/domain.dart';

class FormArgs {
  final DreamEntity? dream;
  final FormType formType;

  FormArgs({
    this.dream,
    required this.formType,
  });
}
