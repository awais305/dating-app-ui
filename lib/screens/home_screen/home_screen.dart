import 'package:dating_app_ui/models/users_model.dart';
import 'package:dating_app_ui/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/home_appbar_widget.dart';
import 'widgets/user_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        context.read<HomeProvider>().fetchUsers();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, _) {
            if (homeProvider.fetchError != null) {
              return Center(child: Text(homeProvider.fetchError!));
            } else {
              List<Result> users = homeProvider.users;
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    HomeAppbarWidget(),
                    !homeProvider.isFetching && users.isEmpty
                        ? Center(child: Text('No Data Found'))
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: users.length,
                            itemBuilder: (context, index) =>
                                UserCardWidget(user: users[index]),
                          ),
                    if (!homeProvider.isSearch) ...[
                      SizedBox(height: 20),
                      Center(child: CircularProgressIndicator.adaptive()),
                      SizedBox(height: 50),
                    ]
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
