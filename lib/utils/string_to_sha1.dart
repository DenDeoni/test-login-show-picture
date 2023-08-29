import 'dart:convert';
import 'package:crypto/crypto.dart';

Digest stringToSha1(String string) {
  return sha1.convert(utf8.encode(string));
}