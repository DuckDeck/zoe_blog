import 'package:redux/redux.dart';
import 'package:zoe_blog/redux/states/reduxState.dart';
abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel({this.store});
}

class StoreContainer{
  static final Store<ReduxState> global = re
}

Store reduxStore()=>Store<ReduxState>(reduxReducer,initialState: 