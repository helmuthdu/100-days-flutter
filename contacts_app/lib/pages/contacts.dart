import 'package:contacts_app/api/api.dart';
import 'package:contacts_app/models/models.dart';
import 'package:contacts_app/pages/contact.dart';
import 'package:contacts_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: Consumer<AppState>(
        builder: (context, state, child) {
          if (state.users.isEmpty) {
            UsersApi.getAll().then((users) => state.addUsers(users));
          }

          if (state.users.isNotEmpty) {
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ContactPage(
                                  key: Key(state.users[index].id),
                                  user: state.users[index]))),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(state
                                          .users[index].avatar !=
                                      null &&
                                  state.users[index].avatar.isNotEmpty
                              ? state.users[index].avatar
                              : 'https://api.adorable.io/avatars/128/.png')),
                      title: Text(state.users[index].name),
                      subtitle: Text(state.users[index].email),
                      trailing: Icon(Icons.chevron_right),
                    ));
          }
          return Center(
            child: Text('No users'),
          );
        },
      ),
      floatingActionButton: Consumer<AppState>(
        builder: (context, state, child) {
          return FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage(
                          user: User(),
                          onSubmit: (data) => _submitForm(data, context, state),
                        ))),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }

  void _submitForm(
      Map<String, dynamic> data, BuildContext context, AppState state) {
    var user = User.fromJson(data);
    UsersApi.addUser(user)
        .then((res) => state.addUser(user.copyWith(id: res['id'])))
        .then((_) => Navigator.of(context).pop());
  }
}
