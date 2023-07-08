import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Chat/selection_tab.dart';
import 'package:yourself_in_time_project/common/widgets/Navigation/back_button.dart';
import 'package:yourself_in_time_project/common/widgets/chat/badget_title.dart';
import 'package:yourself_in_time_project/common/widgets/darkBackground/dark_radial_background.dart';
import 'package:yourself_in_time_project/core/di/get_it.dart';
import 'package:yourself_in_time_project/ui/messages/messages_view_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return ViewModelBuilder<MessagesViewModel>.reactive(
        viewModelBuilder: () => getIt<MessagesViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: [
                  DarkRadialBackground(
                    color: Color(0xFF0066DA), //community arka plan
                    position: "topLeft",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBackButton(),
                        AppSpaces.verticalSpace20,
                        BadgedTitle(
                          title: "Posts",
                          color: 'A5EB9B',
                          number: '12',
                        ),
                        AppSpaces.verticalSpace20,
                        Expanded(
                            child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return buildPostWidget(
                              profileImage:
                                  AssetImage('assets/images/man-head.png'),
                              message: 'Ali 10 seriye ulaştı',
                              emoji: Icons.emoji_emotions,
                            );
                          },
                        )),
                        AppSpaces.verticalSpace20,
                        SelectionTab(title: "AT THE TOPS"),
                        AppSpaces.verticalSpace20,
                        Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView(
                                children: []), // Data verileri yerleşecek
                          ),
                        )
                      ],
                    )),
                  )
                ],
              ),
            ));
  }

  Widget buildPostWidget({
    required ImageProvider<Object> profileImage,
    required String message,
    required IconData emoji,
  }) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: profileImage,
          ),
          SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 4),
          Icon(emoji, color: Colors.black),
        ],
      ),
    );
  }
}
