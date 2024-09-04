import 'package:ticketpadi/core/service/locator.dart';
import 'package:ticketpadi/features/auth/presentation/Provider/controller/authController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postAction = ChangeNotifierProvider((ref) => authprovider(locator()));