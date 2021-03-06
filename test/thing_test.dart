import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Thing', () {
    final information = 'Fake';
    final uri = Uri();
    Thing thing;

    setUp(() {
      thing = Thing(information: information, uri: uri);
    });

    test('has information and a uri', () {
      expect(thing.information, equals(information));
      expect(thing.uri, equals(uri));
    });

    test('has no initial tags', () {
      expect(thing.tags.isEmpty, isTrue);
    });

    test('has no initial targets', () {
      expect(thing.targets.isEmpty, isTrue);
    });

    test('has a string representation', () {
      expect(thing.toString(), matches('Fake'));
    });

    test('#isTaggedBy', () {
      final tag = Thing(information: 'Fake', uri: Uri());
      expect(thing.isTaggedBy(tag), isFalse);
      thing.tagWith(tag);
      expect(thing.isTaggedBy(tag), isTrue);
    });

    test('#isTagging', () {
      final target = Thing(information: 'Fake', uri: Uri());
      expect(thing.isTagging(target), isFalse);
      thing.tag(target);
      expect(thing.isTagging(target), isTrue);
    });

    test('#tagWith adds tag uri to tags and targets reciprocally', () {
      final tag = Thing(information: 'Fake', uri: Uri());
      thing.tagWith(tag);
      expect(thing.tags.contains(tag.uri), isTrue);
      expect(tag.targets.contains(thing.uri), isTrue);
    });

    test('#tag adds tag uri to tags and targets reciprocally', () {
      final target = Thing(information: 'Fake', uri: Uri());
      thing.tag(target);
      expect(thing.targets.contains(target.uri), isTrue);
      expect(target.tags.contains(thing.uri), isTrue);
    });
  });
}
