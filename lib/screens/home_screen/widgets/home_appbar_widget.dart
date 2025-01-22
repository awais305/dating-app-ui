import 'package:dating_app_ui/providers/home_provider.dart';
import 'package:dating_app_ui/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/textfield_component.dart';
import '../../../utils/fonts.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 25,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back, color: Colors.white),
              Text('Dating List',
                  style: CustomFontStyle.boldText
                      .copyWith(color: Colors.white, fontSize: 21)),
              SizedBox(width: 24)
            ],
          ),
          TextFieldComponent(
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 30),
            onChanged: context.read<HomeProvider>().search,
          ),
        ],
      ),
    );
  }
}
