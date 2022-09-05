import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/injection.dart';

// very nice utility function!!!!!!
BlocProvider<T> provide<T extends StateStreamableSource>([void Function(T bloc)? callback]) {
  return BlocProvider(create: (_) {
    T bloc = getIt();
    callback?.call(bloc);
    return bloc;
  });
}
