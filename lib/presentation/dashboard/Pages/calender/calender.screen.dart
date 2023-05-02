import 'dart:developer';

import '../../../../domain/core/core.dart';

class CalenderScreen extends GetView<CalenderController> {
  const CalenderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        title: const Text('Calender'),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: ConstansApp.firebaseFirestore
            .collection(ConstansApp.naiveBayesCollection)
            // .where(
            //   "statusKamar",
            //   isEqualTo: true,
            // )
            .snapshots(),
        builder: (ctx, s) {
          if (s.hasData) {
            try {
              var eventDate = List.generate(
                s.data!.docs.length,
                (index) {
                  final data = s.data!.docs[index];
                  return NaiveBayesModel.fromDocumentSnapshot(data)
                      .tglJatuhTempo!
                      .toDate();
                },
              );
              log(eventDate.toString(), name: "calender");
              controller.kEvents.removeWhere((key, value) => true);
              for (var i = 0; i < s.data!.docs.length; i++) {
                final tgl = s.data!.docs[i]["tglJatuhTempo"] as Timestamp;
                final newData =
                    controller.tglSkrg.difference(tgl.toDate()).inDays == -3
                        ? TerdekatModel.fromDocumentSnapshot(s.data!.docs[i])
                        : JatuhTempoModel.fromDocumentSnapshot(s.data!.docs[i]);

                if (eventDate.toList()[i] == newData.tglJatuhTempo!.toDate()) {
                  controller.kEvents[eventDate.toList()[i]] = [
                    newData,
                    ...?controller.kEvents[eventDate.toList()[i]]
                  ];
                }
              }
              return Column(
                children: const [
                  Calendar(),
                  SizedBox(height: 12.0),
                  ValueDate(),
                  SizedBox(height: 12.0),
                  ValueCalender(),
                ],
              );
            } catch (e) {
              return Center(
                child: Text("pesan error $e"),
              );
            }
          }
          return const LoadingState();
        },
      ),
    );
  }
}
