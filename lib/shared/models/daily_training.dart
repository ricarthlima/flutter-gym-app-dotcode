import 'package:gym_app/shared/models/exercices.dart';

class DailyTraining {
  String? id;
  String? name;
  String? obs;
  List<Exercices>? listExercices;

  DailyTraining({this.id, this.name, this.obs, this.listExercices});
}
