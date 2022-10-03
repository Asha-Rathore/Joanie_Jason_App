import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Product_details/Model/add_to_cart_model.dart';

class AddToCartController extends GetxController {
  RxList<Message> addtoCartList = <Message>[].obs;
  // var notes = <Note>[].obs;
  RxDouble total = 0.0.obs;
  void addProduct(Message n) {
    addtoCartList.add(n);
    print("LIST${addtoCartList}");
    print("Note added");
    totalPrice();
    print(n);
  }

  RxDouble totalPrice() {

    for(int i = 0; i < addtoCartList.length; i++){
      print("gggggggggggggggg");
      print(addtoCartList.length);
        total = total + addtoCartList[i].productPrice! as RxDouble;
      }
      //total = addtoCartList[0].productPrice!;
      return total;
    // if (addtoCartList.length == 0) {
    //   return 0.0;
    // }
    // else if(addtoCartList.length > 0){
    //   for(int i = 0; i <= addtoCartList.length; i++){
    //     total = total + addtoCartList[i].productPrice!;
    //   }
    //   //total = addtoCartList[0].productPrice!;
    //   return total;
    // }
    // else if (addtoCartList.length >= 2) {
    //   int i = 0;
    //   while (i <= addtoCartList.length) {
    //     total = total + addtoCartList[i].productPrice!;
    //     i++;
    //   }
    //   return total;
    // }
    // else{
    //   print("errorrrr");
    //   return total;
    // }

    print("ddddddddd");
    print(total);
    //return total;
  }

  @override
  void onInit() {
    // List? storedNotes = GetStorage().read<List>('notes');
    // if(!storedNotes.isNull){
    //   addtoCartList = storedNotes!.map((e) => Message.fromJson(e)).toList().obs;
    // }
    // ever(addtoCartList, (_){
    //   GetStorage().write('notes',addtoCartList.toList());
    // });
    //  totalPrice();
    super.onInit();
  }
}
