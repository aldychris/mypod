import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/main.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  CompanyPageState createState() => CompanyPageState();
}

class CompanyPageState extends State<CompanyPage> {
  final _textEditingController = TextEditingController();
  final List<TextEditingController> _companyControllers = [];

  List<Company> companies = [];

  @override
  void initState() {
    _getCompanies();
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _companyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchSection(context),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  if (_companyControllers.length <= index) {
                    _companyControllers.add(
                        TextEditingController(text: companies[index].name));
                  }
                  return ListTile(
                    title: TextField(
                      controller: _companyControllers[index],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            _updateCompany(
                              context,
                              companies[index].id!,
                              _companyControllers[index].text,
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteCompany(
                              context,
                              companies[index].id!,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCompany(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Search your company',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ElevatedButton(
            onPressed: () => _searchCompany(context),
            child: const Text('Search'),
          ),
        ),
      ],
    );
  }

  void _deleteCompany(
    BuildContext context,
    int id,
  ) async {
    try {
      await client.company.deleteCompany(id);
      setState(() {
        companies.clear();
        _companyControllers.clear();
      });
      _getCompanies();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _updateCompany(
    BuildContext context,
    int id,
    String name,
  ) async {
    try {
      await client.company.updateCompany(id, name);
      if (mounted) {
        ScaffoldMessenger.of(this.context).showSnackBar(
          const SnackBar(
            content: Text('Company updated'),
          ),
        );
      }
      _getCompanies();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _addCompany(BuildContext context) async {
    try {
      await client.company.addCompany();
      if (mounted) {
        ScaffoldMessenger.of(this.context).showSnackBar(
          const SnackBar(
            content: Text('Company added'),
          ),
        );
      }
      _getCompanies();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _searchCompany(BuildContext context) async {
    try {
      final result =
          await client.company.findMyCompany(_textEditingController.text);
      if (result != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Company found: ${result.name}'),
          ),
        );
      } else if (result == null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Company not found'),
          ),
        );
      }
    } on ServerpodClientException catch (e) {
      if (context.mounted && e.statusCode == HttpStatus.unauthorized) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Not authorized'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
          ),
        );
      }
    }
  }

  void _getCompanies() async {
    try {
      final result = await client.company.getCompanies();
      setState(() {
        companies = result;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
