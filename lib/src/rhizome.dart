import 'continuum.dart';
import 'repertory.dart';
import 'thing.dart';

/// A living distribution of all the world's information.
///
/// The Rhizome class provides the primary API for storing information,
/// retrieving a specific information object (a [Thing]), and seeking
/// information.
class Rhizome {
  final Continuum _continuum;
  final Repertory _repertory;

  Rhizome({Continuum continuum, Repertory repertory})
      : _continuum = continuum ?? Continuum(),
        _repertory = repertory ?? Repertory();

  /// Retrieve the [Thing] indentified by `uri`.
  Thing retrieve(uri) => _continuum.retrieve(uri);

  /// Retrieve the [Thing] that represents `information`.
  Thing seek(dynamic information) => retrieve(_repertory.seek(information));

  /// Store `information` in the Rhizome, and return the [Thing] that represents
  /// this information. If the `information` already exists, return the existing
  /// [Thing].
  Thing store(dynamic information) {
    if (seek(information) != null) return seek(information);
    final thing = _continuum.store(information);
    _repertory.register(thing);
    return thing;
  }

  /// WIP: Retrieve a list of [Thing]s meeting provided criteria.
  /// WIP: Right now, omit the criteria and just return everything.
  List<Thing> query() {
    return _continuum.things.values.toList();
  }
 
}
