import 'package:zoe_blog/redux/view_modules/viewModel.dart';
import 'package:zoe_blog/redux/states/reduxState.dart';
import 'package:zoe_blog/model/user.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:redux/redux.dart';


class SearchViewModel extends ViewModel{
  SearchViewModel(Store<ReduxState> store):super(store);


  List<User> get ads => this.store.state.search.users;

  List<Article> get articles => this.store.state.search.articles;

  bool get isLoading => this.store.state.home.isLoading;
  
  int get loadingMoreStatus => this.store.state.home.loadingMoreStatus;
}