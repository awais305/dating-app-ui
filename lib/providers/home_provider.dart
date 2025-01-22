import 'package:dating_app_ui/models/users_model.dart';
import 'package:dating_app_ui/repo/home_repo.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fetchUsers();
  }

  var repo = HomeRepo();

  bool get isFetching => _isFetching;
  bool get isSearch => _isSearch;
  List<Result> get users => _users;
  int get pageCount => _pageCount;
  String? get fetchError => _fetchError;

  List<Result> _users = [];
  List<Result> _originalList = [];
  bool _isFetching = false;
  bool _isSearch = false;

  int _pageCount = 1;
  String? _fetchError;

  fetchUsers() async {
    _fetchError = null;
    _isFetching = true;
    notifyListeners();
    try {
      var data = await repo.fetchUsers(pageCount);
      _users = [..._users, ...data.results];
      _originalList = _users;
      _pageCount++;
      _isFetching = false;
      notifyListeners();
    } catch (e) {
      _pageCount = 1;
      _fetchError = 'Something went wrong!';
      _isFetching = false;
      notifyListeners();
    }
  }

  search(String searchQuery) {
    _isSearch = false;
    if (searchQuery.isEmpty) {
      _users = List.from(_originalList);
    } else {
      _isSearch = true;
      _users = _originalList
          .where((user) => user.name!.first!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
