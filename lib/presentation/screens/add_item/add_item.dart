import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastucture/model/item.dart';
import 'package:to_do_list/infrastucture/providers/item_provider.dart';

import '../../widgets/widgets.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    String nameProduct = "";
    int quantity = 0;
    String categorySelected = "";
    final optionList = [
      "Select Category",
      "Vegetable",
      "Meat",
      "Fish",
      "Fruit",
      "Lacteo",
      "Otros"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustoTextFormField(
                label: 'Name of Product',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) return "This Field can't be empty";
                  nameProduct = value;
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustoTextFormField(
                keyboardType: TextInputType.number,
                label: 'Quantity',
                validator: (value) {
                  if (value!.isEmpty) return "Fill how many you need to buy";
                  quantity = int.parse(value);
                  return null;
                },
              ),
              const SizedBox(height: 24),
              DropdownButtonFormField(
                value: optionList[0],
                items: optionList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value!.isEmpty || value == optionList[0]) return "Select the Category";
                  categorySelected = value;
                  return null;
                },
                onChanged: (String? value) {},
              ),
              _AddItem(
                  formkey: formkey,
                  nameProduct: nameProduct,
                  quantity: quantity,
                  categorySelected: categorySelected),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddItem extends StatelessWidget {
  const _AddItem({
    required this.formkey,
    required this.nameProduct,
    required this.quantity,
    required this.categorySelected,
  });

  final GlobalKey<FormState> formkey;
  final String nameProduct;
  final int quantity;
  final String categorySelected;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        final valid = formkey.currentState!.validate();
        if (valid) {
          final item = Item(
              nameProduct: nameProduct,
              quantity: quantity,
              category: categorySelected);
          context.read<ItemProvider>().addItem(item);
          context.pop();
        }
      },
      label: const Text("Add Item"),
      icon: const Icon(Icons.add_shopping_cart),
    );
  }
}
