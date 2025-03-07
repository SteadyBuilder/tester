import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider를 사용하여 카운터 상태 관리
final counterProvider = StateProvider<int>((ref) => 0);
