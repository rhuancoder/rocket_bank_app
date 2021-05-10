import 'package:flutter/material.dart';

void main() => runApp(RocketBankApp());

class RocketBankApp extends StatelessWidget {
  const RocketBankApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransfersList(),
      ),
    );
  }
}

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
        title: Text('Create Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _fieldControllerAccountNumber,
              label: 'Account Number',
              hint: '0000',
            ),
            Editor(
              controller: _fieldControllerValue,
              label: 'Value',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(128.0, 8.0, 128.0, 8.0),
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text('Confirm'),
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
      debugPrint('creating');
      debugPrint('$transfer');
      Navigator.pop(context, transfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransferForm(),
              ));
          future.then((receivedTransfer) {
            debugPrint('received');
            debugPrint('$receivedTransfer');
            if(receivedTransfer != null) {
              setState(() {
                widget._transfers.add(receivedTransfer);
              });
            }
          });
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
