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
    ) List<Orders> orders) async {
/*
[
  {"accountNumber": 30728591, "orderTicket": 1, "createdAt": "2012-04-23T18:25:43.511Z", "updateAt": "2012-04-23T18:25:43.511Z", "orderClosePrice": 3000.0,  "orderCloseTime": "2012-04-23T18:25:43.511Z", "orderComment": "SoulDyor_GolD_buy_1", "orderCommission": 1.0, "orderLots": 0.01, "orderMagicNumber": 3644, "orderOpenPrice":3000.0, "orderOpenTime": "2012-04-23T18:25:43.511Z", "orderProfit":1.00, "orderSwap":1.00, "orderSymbol":"XAUUSD", "orderTakeProfit":3000.00, "orderStopLoss":3000.00, "orderType":0},
  {"accountNumber": 30728591, "orderTicket": 1, "createdAt": "2012-04-23T18:25:43.511Z", "updateAt": "2012-04-23T18:25:43.511Z", "orderClosePrice": 3000.0,  "orderCloseTime": "2012-04-23T18:25:43.511Z", "orderComment": "SoulDyor_GolD_buy_1", "orderCommission": 1.0, "orderLots": 0.01, "orderMagicNumber": 3644, "orderOpenPrice":3000.0, "orderOpenTime": "2012-04-23T18:25:43.511Z", "orderProfit":1.00, "orderSwap":1.00, "orderSymbol":"XAUUSD", "orderTakeProfit":3000.00, "orderStopLoss":3000.00, "orderType":0}
]
*/
    for(int i = 0; i<orders.length; i++){
      print(orders[i]);
    }
    return Response.ok('postOrders $account $orders');
  }

  @Operation.get('id')
  Future<Response> getOrders(@Bind.path("id") int account,) async {
    return Response.ok('getOrders $account');
  }
}