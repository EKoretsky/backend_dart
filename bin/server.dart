import 'dart:io';

import 'package:backend_dart/cli_commands/cli_parser.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

final _router = Router();
final _host = 'localhost';

void main(List<String> args) async {
  
  final parser = CliParser().parser;
  final result = parser.parse(args);

  final pipeline = shelf.Pipeline();
  pipeline.addMiddleware(shelf.logRequests());
  final _handler = pipeline.addHandler(_router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await io.serve(_handler, _host, port);
  print('Server listening on port ${server.port}');
}
