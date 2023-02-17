import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_kost_by_admin/domain/interfaces/app_bar/app_bar_batal.dart';

import 'controllers/list_pemasukan.controller.dart';

class ListPemasukanScreen extends GetView<ListPemasukanController> {
  const ListPemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Pemasukan',
        false,
      ),
      body: const Center(
        child: Text(
          'ListPemasukanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
