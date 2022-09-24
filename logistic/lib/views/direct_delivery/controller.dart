import 'package:flutter/material.dart';
import 'package:third_iteration/views/direct_delivery/view.dart';


class DirectDeliveryScreen extends StatefulWidget {
  const DirectDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DirectDeliveryScreen> createState() => DirectDeliveryController();
}

class DirectDeliveryController extends State<DirectDeliveryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  submit() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return DirectDeliveryView(this);
  }
}
