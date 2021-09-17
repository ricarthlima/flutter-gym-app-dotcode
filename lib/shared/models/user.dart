import 'package:gym_app/shared/models/schedule_block.dart';

class User {
  String? id;
  String? name;
  String? mail;

  bool? isTrainer;
  bool? isWithGym;
  String? publicCode;

  // TREINADOR

  // Lista de ids dos clientes (API)
  List<int>? listClientIds;

  // Lista dos Clientes
  List<User>? listClients;

  // ATLETA
  List<ScheduleBlock>? listSchedules;

  User(
      {this.id,
      this.name,
      this.mail,
      this.isTrainer,
      this.isWithGym,
      this.publicCode,
      this.listSchedules});
}
