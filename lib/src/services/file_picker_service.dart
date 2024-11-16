import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class FilePickerService {
  factory FilePickerService() {
    return _filePicker;
  }

  FilePickerService._internal();
  static final FilePickerService _filePicker = FilePickerService._internal();

  final log = Logger();

  Future<String?> pickFiles(List<String> extensions) async {
    try {
      final paths = await FilePicker.platform
          .pickFiles(allowedExtensions: extensions, type: FileType.custom);
      return paths?.files.first.path;
    } on PlatformException catch (e) {
      log.e('Unsupported operation $e');
      return null;
    } catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  Future<String?> pickImage() async {
    try {
      final paths = await ImagePicker().pickImage(source: ImageSource.gallery);
      return paths?.path;
    } on PlatformException catch (e) {
      log.e('Unsupported operation $e');
      return null;
    } catch (e) {
      log.e(e.toString());
      return null;
    }
  }
}
