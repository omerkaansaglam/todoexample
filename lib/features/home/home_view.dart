import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoexample/core/constants/app/app_constant.dart';
import 'package:todoexample/core/constants/routes/router.dart';
import 'package:todoexample/features/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeViewModel,
      builder: (context, child) {
        return _scaffoldBuilder(context);
      },
    );
  }

  Scaffold _scaffoldBuilder(BuildContext context) => Scaffold(
      floatingActionButton: _addButton(context),
      appBar: _appBar(),
      body: _streamBuilder());

  StreamBuilder<QuerySnapshot<Object?>> _streamBuilder() {
    return StreamBuilder(
      stream: _homeViewModel.dataStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        switch (streamSnapshot.connectionState) {
          case ConnectionState.waiting:
            return _centerLoadingBuilder();
          case ConnectionState.none:
            return _centerLoadingBuilder();
          case ConnectionState.active:
            return _listViewBuilder(streamSnapshot, context);
          default:
            return _centerLoadingBuilder();
        }
      },
    );
  }

  Center _centerLoadingBuilder() =>
      const Center(child: CircularProgressIndicator());

  ListView _listViewBuilder(
      AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot,
      BuildContext context) {
    return ListView.builder(
        itemCount: streamSnapshot.data?.docs.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () {
                    showAlertDialog(
                        context,
                        streamSnapshot.data?.docs[index].id ?? "",
                        streamSnapshot.data?.docs[index]['title'] ?? "",
                        streamSnapshot.data?.docs[index]['subTitle'] ?? "");
                  },
                  title: Text(streamSnapshot.data?.docs[index]['title'] ?? "",
                      style: Theme.of(context).textTheme.bodyText1),
                  subtitle: Text(
                      streamSnapshot.data?.docs[index]['subTitle'] ?? "",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText1),
                  leading: IconButton(
                      onPressed: () async {
                        // await _homeViewModel.deleteTodoItem(
                        //     streamSnapshot.data?.docs[index].id);
                      },
                      icon: const Icon(
                        Icons.person,
                      )),
                  trailing: IconButton(
                      onPressed: () async {
                        await _homeViewModel.deleteTodoItem(
                            streamSnapshot.data?.docs[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                      ))),
            ),
          );
        });
  }

  AppBar _appBar() {
    return AppBar(
      actions: const [Icon(Icons.notifications_active)],
      title: const Text(AppConstants.APPLICATION_NAME,
          style: TextStyle(fontWeight: FontWeight.normal)),
      centerTitle: true,
      elevation: 5,
    );
  }

  FloatingActionButton _addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        context.router.push(HomeSubRoute());
      },
      child: const Icon(Icons.add),
    );
  }

  showAlertDialog(
      BuildContext context, String id, String text, String subtitle) {
    final TextEditingController _textController =
        TextEditingController(text: text);
    final TextEditingController _subTextController =
        TextEditingController(text: subtitle);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Güncelle"),
      onPressed: () async {
        await _homeViewModel.updateItem(
          title: _textController.text,
          subtitle: _subTextController.text,
          id: id,
        );
        context.router.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Güncelle"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                    hintText: "Başlık girin...", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _subTextController,
                decoration: const InputDecoration(
                    hintText: "Bir şey yazın...", border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
