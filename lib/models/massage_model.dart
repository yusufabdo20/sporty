
import 'package:sporty/constanse.dart';

class MassageModel {
  final String message;
  final String id;


  MassageModel(this.message,this.id);

  factory MassageModel.fromJson( jsonDate) {
    return MassageModel(jsonDate[kMassage],jsonDate[uniqId]);
  }
}