import 'package:riverpod/riverpod.dart';

import '../commons_repository.dart';

final repositoryProvider = Provider<CommonsRepository>((ref) => CommonsRepository());
