import 'package:redux/redux.dart';
import 'package:zoe_blog/redux/states/reduxState.dart';
import 'package:zoe_blog/redux/reducers/reduxReducer.dart';
import 'package:zoe_blog/redux/states/home.dart';
abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel({this.store});
}

class StoreContainer{
  static final Store<ReduxState> global = reduxStore();
}

Store reduxStore()=>Store<ReduxState>(reduxReducer,initialState: ReduxState(home: HomeState.initialState());