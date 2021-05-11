import 'package:flutter/material.dart';
import 'package:rocket_bank_app/components/editor.dart';
import 'package:rocket_bank_app/models/transfer.dart';

const _titleAppBar = 'Create Transfer';
const _labelAccountNumber = 'Account Number';
const _hintAccountNumber = '0000';
const _labelValue = 'Value';
const _hintValue = '0.00';
const _textConfirmButton = 'Confirm';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _fieldControllerAccountNumber =
  TextEditingController();
  final TextEditingController _fieldControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _fieldControllerAccountNumber,
              label: _labelAccountNumber,
              hint: _hintAccountNumber,
            ),
            Editor(
              controller: _fieldControllerValue,
              label: _labelValue,
              hint: _hintValue,
              icon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(128.0, 8.0, 128.0, 8.0),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text(_textConfirmButton),
                  ],
                ),
                onPressed: () => _createTransfer(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_fieldControllerAccountNumber.text);
    final double value = double.tryParse(_fieldControllerValue.text);
    if (accountNumber != null && double != null) {
      final transfer = Transfer(value, accountNumber);
      Navigator.pop(context, transfer);
    }
  }
}
