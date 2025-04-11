import 'package:souldyor/souldyor.dart';

class Orders extends ManagedObject<_Orders> implements _Orders {
  @override
  void willInsert() {
    createdAt = DateTime.now().toUtc();
    updateAt = createdAt;
  }

  @override
  willUpdate() {
    updateAt = DateTime.now().toUtc();
  }

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'accountNumber':accountNumber, // Аккаунт
      'orderTicket':orderTicket, //номер тикета текущего выбранного ордера
      'createdAt':createdAt.toString(), // время создания записи
      'updateAt':updateAt.toString(), // время последнего обновления записи

      'orderClosePrice':orderClosePrice, //Цена закрытия выбранного ордера
      'orderCloseTime':orderCloseTime.toString(), //Время закрытия выбранного ордера
      'orderComment':orderComment, // Комментарий выбранного ордера "SoulDyor_GolD_buy_"+номер+тип
      'orderCommission':orderCommission, // значение рассчитанной комиссии выбранного ордера
      'orderLots':orderLots, // количество лотов выбранного ордера
      'orderMagicNumber':orderMagicNumber, // идентификационное ("магическое") число выбранного ордера = 3644
      'orderOpenPrice':orderOpenPrice, // цену открытия выбранного ордера
      'orderOpenTime':orderOpenTime.toString(), //время открытия выбранного ордера
      'orderProfit':orderProfit, //значение чистой прибыли выбранного ордера
      'orderSwap':orderSwap, //значение свопа текущего выбранного ордера
      'orderSymbol':orderSymbol, //наименование финансового инструмента текущего выбранного ордера
      'orderTakeProfit':orderTakeProfit, //значение цены закрытия ордера при достижении уровня прибыльности (take profit) текущего выбранного ордера.
      'orderStopLoss':orderStopLoss,//значение цены закрытия ордера при достижении убыточности (stop loss) текущего выбранного ордера.
      //0 - OP_BUY - ордер на покупку,
      //1 - OP_SELL - ордер на продажу,
      //2 - OP_BUYLIMIT - отложенный ордер на покупку по достижении заданного уровня, текущая цена выше уровня,
      //3 - OP_BUYSTOP - отложенный ордер на покупку по достижении заданного уровня, текущая цена ниже уровня,
      //4 - OP_SELLLIMIT - отложенный ордер на продажу по достижении заданного уровня, текущая цена ниже уровня,
      //5 - OP_SELLSTOP - отложенный ордер на продажу по достижении заданного уровня, текущая цена выше уровня.
      'orderType':orderType, //тип операции текущего выбранного ордера
    };
  }
}

@Table(name: "Orders")
class _Orders {
  @primaryKey
  int? id;
  @Column(indexed: true)
  int? accountNumber; // Аккаунт
  @Column(indexed: true)  
  int? orderTicket; //номер тикета текущего выбранного ордера
  DateTime? createdAt; // время создания записи
  DateTime? updateAt; // время последнего обновления записи

  double? orderClosePrice; //Цена закрытия выбранного ордера
  DateTime? orderCloseTime; //Время закрытия выбранного ордера
  String? orderComment; // Комментарий выбранного ордера "SoulDyor_GolD_buy_"+номер+тип
  double? orderCommission; // значение рассчитанной комиссии выбранного ордера
  double? orderLots; // количество лотов выбранного ордера
  int? orderMagicNumber; // идентификационное ("магическое") число выбранного ордера = 3644
  double? orderOpenPrice; // цену открытия выбранного ордера
  DateTime? orderOpenTime; //время открытия выбранного ордера
  double? orderProfit; //значение чистой прибыли выбранного ордера
  double? orderSwap; //значение свопа текущего выбранного ордера
  String? orderSymbol; //наименование финансового инструмента текущего выбранного ордера
  double? orderTakeProfit; //значение цены закрытия ордера при достижении уровня прибыльности (take profit) текущего выбранного ордера.
  double? orderStopLoss;//значение цены закрытия ордера при достижении убыточности (stop loss) текущего выбранного ордера.
  //0 - OP_BUY - ордер на покупку,
  //1 - OP_SELL - ордер на продажу,
  //2 - OP_BUYLIMIT - отложенный ордер на покупку по достижении заданного уровня, текущая цена выше уровня,
  //3 - OP_BUYSTOP - отложенный ордер на покупку по достижении заданного уровня, текущая цена ниже уровня,
  //4 - OP_SELLLIMIT - отложенный ордер на продажу по достижении заданного уровня, текущая цена ниже уровня,
  //5 - OP_SELLSTOP - отложенный ордер на продажу по достижении заданного уровня, текущая цена выше уровня.
  int? orderType; //тип операции текущего выбранного ордера
}
