import 'package:test_project/bootstrap.dart';
import 'package:test_project/src/app/page/app.dart';
import 'package:test_project/src/core/enums/enums.dart';

void main() {
  bootstrap(
    builder: App.new,
    environment: Environment.staging,
  );
}
