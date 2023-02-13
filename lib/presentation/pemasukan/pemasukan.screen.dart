import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/pemasukan.controller.dart';

class PemasukanScreen extends GetView<PemasukanController> {
  const PemasukanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PemasukanScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PemasukanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
