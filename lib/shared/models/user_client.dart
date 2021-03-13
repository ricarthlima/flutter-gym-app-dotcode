import 'package:gym_app/shared/models/training_block.dart';
import 'package:gym_app/shared/models/user_abstract.dart';

class UserClient extends AbstractUser {
  String uniqueCodeClient;
  List<TrainingBlock> listTrainingBlock;
}
