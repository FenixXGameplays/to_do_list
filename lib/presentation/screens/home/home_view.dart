import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/infrastucture/providers/item_provider.dart';

import '../../../infrastucture/model/item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop List"),
      ),
      body: const _HomeView(),
      floatingActionButton: const _FabAdd(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ItemProvider>();
    return provider.list.isEmpty
        ? const Center(child: Text("Shop Cart Empty"))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final Item item = provider.list[index];
              return _CardItem(item: item);
            },
            itemCount: provider.list.length,
          );
  }
}

class _CardItem extends StatelessWidget {
  final Item item;
  const _CardItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
        color: Colors.red.shade200.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.nameProduct),
              const SizedBox(height: 4),
              Text("${item.quantity}"),
              Text(item.category),
            ],
          ),
          GestureDetector(
            child: const Icon(Icons.delete_forever_outlined),
            onTap: () => context.read<ItemProvider>().deleteItem(item),
          )
        ],
      ),
    );
  }
}

class _FabAdd extends StatelessWidget {
  const _FabAdd();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.push('/add-item'),
      child: const Icon(Icons.add_circle_outline_outlined),
    );
  }
}
