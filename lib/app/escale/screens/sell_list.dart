import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/customer_models.dart';
import '../models/truck_models.dart';
import '../widgets/sell_form_template/sell_form_template.dart';


class SellTemplateListPage extends StatefulWidget {
  final List<Trucks> trucks;
  final List<Customers> customers;

  const SellTemplateListPage({
    Key? key,
    required this.trucks,
    required this.customers,
  }) : super(key: key);

  @override
  _SellTemplateListPageState createState() => _SellTemplateListPageState();
}

class _SellTemplateListPageState extends State<SellTemplateListPage> {
  final List<Map<String, dynamic>> templates = [];
  final Uuid uuid = Uuid();

  @override
  void initState() {
    super.initState();
    addTemplate(); // Add the initial template
  }

  void addTemplate() {
    final id = uuid.v4();
    setState(() {
      templates.add({
        'id': id, // Generate a unique ID for each template
        'widget': SellFormTemplate(
          key: ValueKey(id),
          trucks: widget.trucks,
          customers: widget.customers,
          onTransactionCreated: () => refreshTransactions(),
          closeTemplate: () => clearAndRemoveTemplate(id),
        ),
      });
    });
  }

  void clearAndRemoveTemplate(String id) {
    setState(() {
      final template = templates.firstWhere((template) => template['id'] == id);
      final SellFormTemplate widget = template['widget'];

      // Clear data in the SellFormTemplate
      widget.controller?.getChildCubit().clearFormFields();

      // Remove template from the list
      templates.removeWhere((template) => template['id'] == id);
    });
  }
  void refreshTransactions() {
    // Refresh transactions or perform any necessary action upon transaction creation
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Template List"),
      ),
      body: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: template['widget'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTemplate,
        child: const Icon(Icons.add),
        tooltip: 'Add Sell Template',
      ),
    );
  }
}
