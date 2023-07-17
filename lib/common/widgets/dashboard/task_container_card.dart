import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourself_in_time_project/common/constants/constants.dart';
import 'package:yourself_in_time_project/common/values/spacing.dart';

class TaskProgressCard extends StatelessWidget {
  final String cardTitle;
  final String startDate;
  final String endDate;
  final String progressFigure;
  final int percentageGap;
  final String desc;
  TaskProgressCard(
      {Key? key,
      required this.startDate,
      required this.cardTitle,
      required this.progressFigure,
      required this.percentageGap,
      required this.endDate,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ...progressCardGradientList,
            ],
          ),
        ),
        child: Stack(children: [
          Positioned(
              top: 30,
              bottom: 20,
              right: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardTitle,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 22)),
                  AppSpaces.verticalSpace10,
                  Text('$startDate Am- $endDate Am',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 210,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.white),
                          child: Row(children: [
                            Expanded(
                                flex: percentageGap,
                                child: Container(
                                    decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ))),
                            Expanded(flex: 1, child: SizedBox())
                          ])),
                      SizedBox(
                        width: 8,
                      ),
                      Text("$progressFigure%",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("$desc",
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold))
                ],
              ))
        ]));
  }
}
