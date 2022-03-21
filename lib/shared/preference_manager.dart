import 'package:get_storage/get_storage.dart';

GetStorage myStorage = GetStorage();

void saveValue(String key , var value){
  myStorage.write(key, value);
}


void remove(String key){
  myStorage.remove(key);
}


dynamic getValue(String key){
  var value = myStorage.read(key);
  return value;
}