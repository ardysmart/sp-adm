part of '../pages.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<TrainingCubit, TrainingState>(
          builder: (_, state) => (state is TrainingLoaded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.trainings
                      .map(
                        (e) => Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0,
                                blurRadius: 3,
                              ),
                            ]),
                            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 15, 20),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name,
                                        style: blackTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      Text(
                                        e.place,
                                        style: greyTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(e.date),
                                ),
                              ],
                            )
                            // Column(
                            //   children: [
                            //     Text(e.name),
                            //     Text(e.date),
                            //     Text(e.place),
                            //     SizedBox(height: 20),
                            //   ],
                            // ),
                            ),
                      )
                      .toList(),
                )
              : SizedBox(
                  height: 30,
                ),
        )
      ],
    );
  }
}
