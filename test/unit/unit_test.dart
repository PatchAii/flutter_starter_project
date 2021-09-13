import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/fixture_reader.dart';

void main() {
  test('Test Weather model', () {
    final w = Weather.fromJson(fixture('weather.json'));
    expect(w.toJson(), fixture('weather.json'));
  });

  test('Test City model', () {
    final c = City.fromJson(fixture('city.json'));
    expect(c.toJson(), fixture('city.json'));
  });

  test('Test User model', () {
    final u = User.fromJson(fixture('user.json'));
    expect(u.toJson(), fixture('user.json'));
  });

  test('Test Company model', () {
    final c = Company.fromJson(fixture('company.json'));
    expect(c.toJson(), fixture('company.json'));
  });

  test('Test Address model', () {
    final a = Address.fromJson(fixture('address.json'));
    expect(a.toJson(), fixture('address.json'));
  });

  test('Test Geo model', () {
    final g = Geo.fromJson(fixture('geo.json'));
    expect(g.toJson(), fixture('geo.json'));
  });

  test('Test Post model', () {
    final p = Post.fromJson(fixture('post.json'));
    expect(p.toJson(), fixture('post.json'));
  });
}
