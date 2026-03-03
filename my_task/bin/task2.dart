import 'package:my_task/my_task.dart' as my_task;

class MyTasks {
  
  void task1() {
    for (int i = 1; i <= 10; i++) {
      print(i);
    }
  }

  void task2() {
    int x = 1;
    while (x <= 5) {
      print("aya");
      x++;
    }
  }

  void task3() {
    int total = 0;
    for (int i = 1; i <= 5; i++) {
      total = total + i;
    }
    print(total);
  }

  void task4() {
    var colors = ["Red", "Green", "Blue"];
    for (var c in colors) {
      print(c);
    }
  }

  void task5() {
    for (int i = 2; i <= 10; i = i + 2) {
      print(i);
    }
  }

  void task6() {
    int n = 5;
    do {
      print(n);
      n--;
    } while (n > 0);
  }

  void task7() {
    int num = 3;
    for (int i = 1; i <= 10; i++) {
      print(num * i);
    }
  }

  void task8() {
    var nums = [10, 20, 30];
    int sum = 0;
    for (int n in nums) {
      sum = sum + n;
    }
    print(sum);
  }

  void task9() {
    String name = "Aya";
    for (int i = 0; i < name.length; i++) {
      print(name[i]);
    }
  }

  void task10() {
    for (int i = 1; i <= 3; i++) {
      print("Task number $i done");
    }
  }
}

void main() {
  MyTasks obj = MyTasks();
  
  obj.task1();
  obj.task3();
  obj.task7();
  obj.task10();
}