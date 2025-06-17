import 'package:riverpod/riverpod.dart';

import '../repository.dart';

final repositoryProvider = Provider<Repository>((ref) => Repository());
