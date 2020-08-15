import 'thing.dart';

/// The whole set of all information.
/// 
/// The information continuum represents a collection of information objects,
/// known as [Thing]s. Intended to be consumed or wrapped by a [Rhizome]
/// instance, it provides and API for obtaining a list of [Thing]s, retrieving
/// a specific [Thing], and storing new information as a [Thing].
class Continuum {

  final Map<Uri, Thing> _things;
  /// A key-value store mapping URIs to [Thing]s.
  Map<Uri, Thing> get things => _things;

  Continuum({Map<Uri, Thing> things}) : _things = things ?? <Uri, Thing>{};

  Thing retrieve(uri) {
    return things[uri];
  }

}
