
import 'package:souldyor/souldyor.dart';

class Accounts extends ManagedObject<_Accounts> implements _Accounts, ManagedAuthResourceOwner<_Accounts> {}

@Table(name: "Accounts")
class _Accounts  extends ResourceOwnerTableDefinition {}