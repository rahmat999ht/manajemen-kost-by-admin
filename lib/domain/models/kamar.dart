import '../core/core.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KamarModel {
  final String? id;
  final String? noKamar;
  final String? lantai;
  final String? gedung;
  final List<String>? fasilitas;
  final int? sewaBulanan;
  final int? sewaTahunan;
  final List<DocumentReference<PenghuniModel>>? penghuni;
  KamarModel({
    this.id,
    this.noKamar,
    this.lantai,
    this.gedung,
    this.fasilitas,
    this.sewaBulanan,
    this.sewaTahunan,
    this.penghuni,
  });

  factory KamarModel.add(
    String noKamar,
    String lantai,
    String gedung,
  ) {
    return KamarModel(
      noKamar: noKamar,
      lantai: lantai,
      gedung: gedung,
      fasilitas: [],
      sewaBulanan: 0,
      sewaTahunan: 0,
      penghuni: [],
    );
  }
  factory KamarModel.update(
    List<String>? fasilitas,
    int? sewaBulanan,
    int? sewaTahunan,
    List<DocumentReference<PenghuniModel>>? penghuni,
  ) {
    return KamarModel(
      fasilitas: fasilitas,
      sewaBulanan: sewaBulanan,
      sewaTahunan: sewaTahunan,
      penghuni: penghuni,
    );
  }

  factory KamarModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) {
    final Map<String, dynamic> data = json.data()!;
    return KamarModel.fromMap(data, json.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noKamar': noKamar,
      'lantai': lantai,
      'gedung': gedung,
      'fasilitas': fasilitas,
      'sewa_bulanan': sewaBulanan,
      'sewa_tahunan': sewaTahunan,
      'penghuni': penghuni!,
    };
  }

  factory KamarModel.fromMap(Map<String, dynamic> map, String id) {
    // final dataPenghuni = map['penghuni'] as DocumentReference;
    // DocumentReference<PenghuniModel> penghuni = dataPenghuni.withConverter(
    //   fromFirestore: (snapshot, options) =>
    //       PenghuniModel.fromMapId(snapshot.data()!, snapshot.id),
    //   toFirestore: (value, options) => value.toMap(),
    // );
    return KamarModel(
      id: id,
      noKamar: map['noKamar'] != null ? map['noKamar'] as String : null,
      lantai: map['lantai'] != null ? map['lantai'] as String : null,
      gedung: map['gedung'] != null ? map['gedung'] as String : null,
      fasilitas: map['fasilitas'] != null
          ? List<String>.from(
              (map['fasilitas']),
            ).toList()
          : null,
      sewaBulanan:
          map['sewa_bulanan'] != null ? map['sewa_bulanan'] as int : null,
      sewaTahunan:
          map['sewa_tahunan'] != null ? map['sewa_tahunan'] as int : null,
      penghuni: map['penghuni'] != null
          ? List<DocumentReference<PenghuniModel>>.from(
              (map['penghuni'] as List<dynamic>).map((x) {
                final ref = x as DocumentReference;
                return ref.withConverter(
                  fromFirestore: (snapshot, options) =>
                      PenghuniModel.fromMapId(snapshot.data()!, snapshot.id),
                  toFirestore: (value, options) => value.toMap(),
                );
              }).toList(),
            )
          : null,
      // penghuni: map['penghuni'] != null
      //     ? List<DocumentReference<PenghuniModel>>.from(
      //         (map['penghuni'] as List<dynamic>).map((x) {
      //           final ref = x as DocumentReference;
      //           return FirebaseFirestore.instance.doc(ref.path);
      //         }).toList(),
      //       )
      //     : null,
    );
  }
}
