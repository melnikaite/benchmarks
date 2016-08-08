import 'dart:io';

main() async {
  var requestServer =
      await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4040);
  print('listening on localhost, port ${requestServer.port}');

  await for (HttpRequest request in requestServer) {
    request.response..write('Hello, world!')
                    ..close();
  }
}
