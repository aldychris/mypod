import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/main.dart';

class AddressPageWithStream extends StatefulWidget {
  const AddressPageWithStream({super.key});

  @override
  AddressPageWithStreamState createState() => AddressPageWithStreamState();
}

class AddressPageWithStreamState extends State<AddressPageWithStream> {
  List<Address> addresses = [];
  final List<TextEditingController> _addressControllers = [];

  @override
  void initState() {
    _listenStreamConnection(Address(street: ''));
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _addressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _listenStreamConnection(Address address) async {
    while (true) {
      try {
        final addressUpdate = client.addressStream.addressUpdates(address);

        await for (final incomingAddress in addressUpdate) {
          if (incomingAddress is Address) {
            final index = addresses
                .indexWhere((element) => element.id == incomingAddress.id);
            if (index != -1) {
              setState(() {
                addresses[index] = incomingAddress;
                _addressControllers[index].text = incomingAddress.street;
              });
            } else {
              setState(() {
                addresses.add(incomingAddress);
                _addressControllers.add(
                  TextEditingController(text: incomingAddress.street),
                );
              });
            }
          }
        }
      } on MethodStreamException catch (e) {
        debugPrint('MethodStreamException $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Page'),
      ),
      body: ListView.builder(
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
                client.addressStream.setAddress(
                  address: addresses[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
