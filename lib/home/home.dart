import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:package_tracker_app/home/shipping_display.dart';
import 'package:package_tracker_app/home/tracking_search_delegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: MediaQuery.of(context).size.width / 3.75,
          child: Row(
            children: const [
              Icon(Icons.flutter_dash),
              Text('BlueJay'),
            ],
          ),
        ),
        centerTitle: true,
      ),
      bottomSheet: TextButton.icon(
        onPressed: () => showSearch(
          context: context,
          delegate: TrackingSearchDelegate(),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add Tracking ID'),
      ),
      drawer: Drawer(
        child: Column(
          children: const <Widget>[
            // TODO: fix username and email
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('Jay'),
              ),
              accountName: Text('Jay Cowan'),
              accountEmail: Text('jaycowan3@gmail.com'),
            ),
            // TODO: Add Settings Page
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
            Divider(
              height: 0.1,
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const ShippingDisplay();
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
