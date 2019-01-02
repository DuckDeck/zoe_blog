import 'package:zoe_blog/redux/states/reduxState.dart';
import 'package:zoe_blog/redux/reducers/home.dart' as home;
ReduxState reduxReducer(ReduxState state,action)=>ReduxState(home: home.reducer(state.home, action));