import '../../../features/home/domain/domain.dart';
import '../../core.dart';

class FormArgs {
  final DreamEntity? dream;
  final FormType formType;

  FormArgs({
    this.dream,
    required this.formType,
  });
}
