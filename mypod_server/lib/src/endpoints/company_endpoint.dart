import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CompanyEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Company>> getCompanies(
    Session session,
  ) async {
    var companies = await Company.db.find(
      session,
    );
    return companies;
  }

  //Will inserted random name
  Future<Company> addCompany(
    Session session,
  ) async {
    final random = Random();
    final length = random.nextInt(6) + 3;
    final response = await http.get(
        Uri.parse('https://random-word-api.herokuapp.com/word?length=$length'));

    if (response.statusCode == 200) {
      final randomWord = jsonDecode(response.body)[0];
      var myCompany = Company(
          name: '${randomWord[0].toUpperCase()}${randomWord.substring(1)}');
      var insertedCompany = await Company.db.insertRow(
        session,
        myCompany,
      );
      return insertedCompany;
    } else {
      throw Exception('Failed to fetch random word');
    }
  }

  Future<Company> updateCompany(
    Session session,
    int id,
    String name,
  ) async {
    var myCompany = await Company.db.findFirstRow(
      session,
      where: (t) => t.id.equals(
        id,
      ),
    );
    if (myCompany == null) {
      session.log('Try to update company with id $id');
      throw Exception('Company not found');
    }

    myCompany.name = name;
    return await Company.db.updateRow(
      session,
      myCompany,
    );
  }

  Future<void> deleteCompany(
    Session session,
    int id,
  ) async {
    final companyToDelete = await Company.db.findFirstRow(
      session,
      where: (t) => t.id.equals(
        id,
      ),
    );

    if (companyToDelete == null) {
      session.log('Try to delete company with id $id');
      throw Exception('Company not found');
    }

    await Company.db.deleteRow(
      session,
      companyToDelete,
    );
  }

  Future<Company?> findMyCompany(
    Session session,
    String name,
  ) async {
    var myCompany = await Company.db.findFirstRow(
      session,
      where: (t) => t.name.equals(
        name,
      ),
    );
    return myCompany;
  }
}
