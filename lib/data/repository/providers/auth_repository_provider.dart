import 'package:riverpod/riverpod.dart';

import '../auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());
