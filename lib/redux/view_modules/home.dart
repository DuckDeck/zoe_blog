import 'package:zoe_blog/redux/view_modules/viewModel.dart';
import 'package:zoe_blog/redux/states/reduxState.dart';

import 'package:zoe_blog/model/ad.dart';
import 'package:zoe_blog/model/article.dart';
import 'package:redux/redux.dart';

class HomeViewModel extends ViewModel{
  HomeViewModel(Store<ReduxState> store):super();

  List<Ad> get ads => this.store.state.home.ads;

  List<Article> get articles => this.store.state.home.articles;
}