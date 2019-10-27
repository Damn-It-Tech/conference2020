import 'package:conferenceapp/ticket/add_ticket_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'authenticator_button.dart';
import 'settings_toggle.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SettingsToggle(
              title: 'Dark Theme',
              onChanged: (_) => changeBrightness(),
              value: Theme.of(context).brightness == Brightness.dark,
            ),
            SettingsToggle(
              title: 'Reminders',
              onChanged: (_) {},
              value: false,
            ),
            SettingsToggle(
              title: 'Push Notifications from organizers',
              onChanged: (_) {},
              value: false,
            ),
            FlatButton(
              child: Text('Add your ticket'),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => SimpleDialog(
                    children: <Widget>[
                      FlatButton(
                        child: Text('From camera'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTicketPage()));
                        },
                      ),
                      FlatButton(
                        child: Text('Manually'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
            AuthenticatorButton(),
          ],
        ),
      ),
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
      Theme.of(context).brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    );
  }
}
