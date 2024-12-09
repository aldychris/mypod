import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/main.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  List<Address> addresses = [];
  final List<TextEditingController> _addressControllers = [];

  @override
  void initState() {
    _getAddressList();
    _openStreamConnection();
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _addressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _openStreamConnection() async {
    if (client.streamingConnectionStatus !=
        StreamingConnectionStatus.connected) {
      await client.openStreamingConnection();
      await for (var incomingAddress in client.address.stream) {
        if (incomingAddress is Address) {
          final index = addresses
              .indexWhere((element) => element.id == incomingAddress.id);
          if (index != -1) {
            setState(() {
              addresses[index] = incomingAddress;
              _addressControllers[index].text = incomingAddress.street;
            });
          }
        }
      }
    }
  }

  void _getAddressList() async {
    final addressList = await client.address.getAddressList();
    setState(() {
      addresses = addressList;
      _addressControllers.clear();
      for (var address in addresses) {
        _addressControllers.add(TextEditingController(text: address.street));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // _openStreamConnection();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Page'),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: TextField(
                controller: _addressControllers[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) async {
                  addresses[index].street = value;
                  client.address.sendStreamMessage(addresses[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
