import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';
import 'package:yourself_in_time_project/common/widgets/Dashboard/task_container_image.dart';
import 'package:yourself_in_time_project/ui/home/home_view_model.dart';

class NextSeriesOverView extends StatefulWidget {
  final Color backgroundColor;
  final String imageUrl;
  final String numberOfItems;
  final String cardTitle;
  NextSeriesOverView(
      {Key? key,
      required this.imageUrl,
      required this.backgroundColor,
      required this.cardTitle,
      required this.numberOfItems})
      : super(key: key);

  @override
  State<NextSeriesOverView> createState() => _NextSeriesOverViewState();
}

class _NextSeriesOverViewState extends State<NextSeriesOverView> {
  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xFFABCDF4),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TaskContainerImage(
                      imageUrl: widget.imageUrl,
                      backgroundColor: widget.backgroundColor,
                    ),
                    AppSpaces.horizontalSpace20,
                    Text(widget.cardTitle,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20))
                  ],
                ),
                Row(children: [
                  Text(
                    widget.numberOfItems,
                    style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  AppSpaces.horizontalSpace20,
                ])
              ],
            )),
      ),
    );
  }
}
