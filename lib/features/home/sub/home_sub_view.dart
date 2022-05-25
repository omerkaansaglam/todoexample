import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoexample/features/home/sub/home_sub_view_model.dart';

class HomeSubPage extends StatelessWidget {
  final HomeSubViewModel _homeSubViewModel = HomeSubViewModel();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _subTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HomeSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeSubViewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Not Ekle"),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _textController,
                      decoration: const InputDecoration(
                          hintText: "Başlık girin...",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _subTextController,
                      decoration: const InputDecoration(
                          hintText: "Bir şey yazın...",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await _homeSubViewModel.addTodoItem(
                          title: _textController.text,
                          subtitle: _subTextController.text,
                        );
                        context.router.pop();
                      },
                      child: const Text("Kaydet"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
