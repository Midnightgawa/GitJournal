import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import 'package:gitjournal/apis/githost_factory.dart';
import 'package:gitjournal/apis/gitlab.dart';

void main() {
  test('Parse json', () async {
    var jsonString = File('test/apis/data/gitlab.json').readAsStringSync();

    var api = GitLab();

    List<dynamic> list = jsonDecode(jsonString);
    var repos = <GitHostRepo>[];
    list.forEach((dynamic d) {
      var map = Map<String, dynamic>.from(d);
      var repo = api.repoFromJson(map);
      repos.add(repo);
    });

    expect(repos.length, 2);
  });
}
