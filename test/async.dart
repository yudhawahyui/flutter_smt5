void main() async {
  func1();
//   await func4(20).then(
//       (value){
//       print(value);
//         print('then');
//     },).catchError(
//       (error){
//       print(error);
//         print('throw');
//     });

  try {
    var value = await func4(30);
    print(value);
    print('try');
  } catch (error) {
    print(error);
    print('error');
  }

  func2();
  func3();
}

func1() {
  print("Function 1");
}

func2() {
  print("Function 2");
}

func3() {
  print("Function 3");
}

Future<String> func4(int nilai) {
  return Future.delayed(Duration(seconds: 1), () {
    if (nilai > 50) {
      return "Lulus";
    } else {
      throw 'Error Tidak Lulus';
    }
  });
}
