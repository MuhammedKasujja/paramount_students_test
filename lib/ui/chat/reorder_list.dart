import 'package:collection/collection.dart';

class Order{
  static List reorderList (List chats){
    const numOfMonths = 12;

    final monthsList = List.generate(numOfMonths, (index) => []);
    
    for(var i = 0; i < monthsList.length; i++){
      monthsList[i].addAll(chats.where((chat) => chat['created_at'].month == i+1));
    }

    final updatedMonthsList = monthsList.where((element) => element.isNotEmpty).toList().reversed.toList();

    return updatedMonthsList;

  
  }
}
