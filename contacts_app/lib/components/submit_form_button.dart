import 'package:flutter/material.dart';

class SubmitFormButton extends StatelessWidget {
  final Map<String, dynamic> data;
  final FormState form;
  final Function onSubmit;

  const SubmitFormButton({Key key, this.data, this.form, this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());

          if (form != null && form.validate()) {
            onSubmit(data);
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        child: Text('Submit'),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}