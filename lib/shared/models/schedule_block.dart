import 'package:gym_app/shared/models/daily_training.dart';

class ScheduleBlock {
  String? id;
  String? name;
  String? obs;
  DateTime? startDate;
  DateTime? endDate;
  bool? isFinished;
  List<DailyTraining>? listDailyTraining;

  ScheduleBlock({
    this.id,
    this.name,
    this.obs,
    this.startDate,
    this.endDate,
    this.isFinished,
    this.listDailyTraining,
  });
}
