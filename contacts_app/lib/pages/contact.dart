import 'package:contacts_app/components/components.dart';
import 'package:contacts_app/models/models.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final User user;
  final Function onSubmit;

  const ContactPage({Key key, this.user, this.onSubmit}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, FocusNode> _focusNode = {
    'name': FocusNode(),
    'email': FocusNode(),
    'phoneNumber': FocusNode(),
    'notes': FocusNode(),
  };

  Map<String, TextEditingController> _formController = Map();

  @override
  void initState() {
    _formController = widget.user.toFormControl();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _formController.forEach((key, ctrl) => ctrl.dispose());
    super.dispose();
  }

  void _editingComplete(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.user.name)),
        body: _buildForm(context));
  }

  Widget _buildForm(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.user.avatar.isNotEmpty
                      ? widget.user.avatar
                      : 'https://api.adorable.io/avatars/128/.png'),
                  maxRadius: 64,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
                autofocus: true,
                focusNode: _focusNode['name'],
                onEditingComplete: () =>
                    _editingComplete(context, _focusNode['phoneNumber']),
                initialValue: newEntry ? null : widget.user.name,
                decoration: getInputDecorator(context, 'name'),
                validator: _validateName,
                controller: newEntry ? _formController['name'] : null,
                enabled: newEntry),
            TextFormField(
                focusNode: _focusNode['phoneNumber'],
                onEditingComplete: () =>
                    _editingComplete(context, _focusNode['email']),
                initialValue: newEntry ? null : widget.user.phoneNumber,
                decoration: getInputDecorator(context, 'Mobile'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone number is required';
                  }
                },
                controller: newEntry ? _formController['phoneNumber'] : null,
                enabled: newEntry),
            TextFormField(
                focusNode: _focusNode['email'],
                onEditingComplete: () =>
                    _editingComplete(context, _focusNode['notes']),
                initialValue: newEntry ? null : widget.user.email,
                decoration: getInputDecorator(context, 'Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email is required';
                  }
                },
                controller: newEntry ? _formController['email'] : null,
                enabled: newEntry),
            TextFormField(
                focusNode: _focusNode['notes'],
                onEditingComplete: () => _editingComplete(context, FocusNode()),
                initialValue: newEntry ? null : widget.user.notes,
                decoration: getInputDecorator(context, 'Notes'),
                controller: newEntry ? _formController['notes'] : null,
                enabled: newEntry),
            SizedBox(
              height: 16,
            ),
            newEntry
                ? SubmitFormButton(
                    form: _formKey.currentState,
                    data: _formController
                        .map((key, val) => MapEntry(key, val.text)),
                    onSubmit: widget.onSubmit,
                  )
                : Container()
          ]),
        ),
      ),
    );
  }

  getInputDecorator(BuildContext context, String label) {
    return InputDecoration(
        labelText: label,
        labelStyle:
            newEntry ? null : TextStyle(color: Theme.of(context).primaryColor),
        border: newEntry ? UnderlineInputBorder() : InputBorder.none);
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  get newEntry {
    return widget.key == null;
  }
}
