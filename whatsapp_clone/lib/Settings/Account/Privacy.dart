import 'package:flutter/material.dart';

import '../../Widget/ListTile.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {

  bool tag2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Privacy"),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("who can see my personal info"),
                      const SizedBox(height: 4,),
                      const Text("if you don't share your Last seen.you won't be able to see other people last seen")
                    ],
                  ),
                ),
              ),
              const listTile(
                title: "Last seen",
                subtitle: "Nobody",
              ),
              const listTile(
                title: "Profile photo",
                subtitle:"7 contacts excluded",
              ),
              const listTile(
                title: "About",
                subtitle: "My contacts",
              ),
              const listTile(
                title: "Status",
                subtitle:"7 Contacts selected",
              ),
              SwitchListTile(
                value: tag2,
                onChanged: (value) {
                  setState(() => tag2 = value);
                },
                activeColor: Colors.green,
                title: const Text(
                  "Read receipts",
                ),
                subtitle: const Text(
                    "if turned off.you won't send or receive Read recepts.Read receipts are always sent for group chats."),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 4,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 15),
              child: Container(
                height: 20,
                width: double.infinity,
                child: Text("Disapperings messages"),
              ),
            ),
              ListTile(
                title: Text("Default message timer"),
                subtitle: Text("Start new chats with disappearing messages set to your timer"),
                trailing: Text("off"),
              ),
              const listTile(
                title: "Groups",
                subtitle: "My contacts",
              ),
              const listTile(title: "Live location", subtitle:"None",),
             listTile(title: "Blocked contacts", subtitle: "7"),
              listTile(title: "Fingerprint lock",subtitle:"Disabled" ),
            ],
          ),
        ),
      ),
    );
  }
}

