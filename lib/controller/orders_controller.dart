import 'package:souldyor/souldyor.dart';

class OrdersController extends ResourceController {
  OrdersController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;
    
  //Данные прилетающие от клиента
  //String? refresh_token;  Токен для обновления токена авторизации
  @Operation.post('id')
  Future<Response> postOrders(
    @Bind.path("id") int account, 
    @Bind.body(
        ignore: ["id"],
        reject: ["createdAt","updateAt"],
        require: [
          "accountNumber", 
          "orderTicket", 
          "orderClosePrice",
          "orderCloseTime",
          "orderComment",
          "orderCommission",
          "orderMagicNumber",
          "orderOpenPrice",
          "orderOpenTime",
          "orderProfit",
          "orderSwap",
          "orderSymbol",
          "orderTakeProfit",
          "orderStopLoss",
          "orderType"
        ]
    ) List<Orders> orders
    ) async {
/*
[
  {"accountNumber": 30728591, "orderTicket": 1, "createdAt": "2012-04-23T18:25:43.511Z", "updateAt": "2012-04-23T18:25:43.511Z", "orderClosePrice": 3000.0,  "orderCloseTime": "2012-04-23T18:25:43.511Z", "orderComment": "SoulDyor_GolD_buy_1", "orderCommission": 1.0, "orderLots": 0.01, "orderMagicNumber": 3644, "orderOpenPrice":3000.0, "orderOpenTime": "2012-04-23T18:25:43.511Z", "orderProfit":1.00, "orderSwap":1.00, "orderSymbol":"XAUUSD", "orderTakeProfit":3000.00, "orderStopLoss":3000.00, "orderType":0},
  {"accountNumber": 30728591, "orderTicket": 1, "createdAt": "2012-04-23T18:25:43.511Z", "updateAt": "2012-04-23T18:25:43.511Z", "orderClosePrice": 3000.0,  "orderCloseTime": "2012-04-23T18:25:43.511Z", "orderComment": "SoulDyor_GolD_buy_1", "orderCommission": 1.0, "orderLots": 0.01, "orderMagicNumber": 3644, "orderOpenPrice":3000.0, "orderOpenTime": "2012-04-23T18:25:43.511Z", "orderProfit":1.00, "orderSwap":1.00, "orderSymbol":"XAUUSD", "orderTakeProfit":3000.00, "orderStopLoss":3000.00, "orderType":0}
]
*/

    List<Orders> ordersInsert = [];
    List<int> ordersUpdate = [];
    dynamic instance;

    // Пройдемся по входящим данным
    for(int i = 0; i<orders.length; i++){
//!!РЕФАКТОРИНГ - проверять чтобы данные по аккаунту были верные

      orders[i].updateAt = DateTime.now();
      final changeOrderQuery = Query<Orders>(context)
          ..where((e) => e.orderTicket).equalTo(orders[i].orderTicket);      
      instance = await changeOrderQuery.fetchOne();  
      if(instance!=null){
        //Добавим 
        ordersUpdate.add(orders[i].accountNumber!);
      }else{
          orders[i].createdAt = DateTime.now();
          orders[i].updateAt = DateTime.now();
          ordersInsert.add(orders[i]);
        }
    }  

    await context.transaction((transaction) async {
      await transaction.insertObjects<Orders>(ordersInsert);
      if(ordersUpdate.length>0){
        final changeTransactionQuery = Query<Orders>(transaction)
            ..where((e) => e.orderTicket).oneOf(ordersUpdate)
            ..values.updateAt = DateTime.now();      
        await changeTransactionQuery.update();
      }
    });

    return Response.ok('Данные по ордерам успешно приняты сервисом SoulDyor.');
  }

  @Operation.get('id')
  Future<Response> getOrders(
    @Bind.path("id") int account,
    ) async {
    final changeOrderQuery = Query<Orders>(context)
          ..where((e) => e.accountNumber).equalTo(account);      
    final instance = await changeOrderQuery.fetch();  
    final response = instance.map((order) => order.toMap()).toList();
  
    return Response.ok(response);
  }
}