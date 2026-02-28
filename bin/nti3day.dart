// //Create a function that receives username, password, and isAccountActive. Access is
// granted only if username equals 'student', password equals 'iti123', and account is
// active. Return 'Login Successful' or 'Access Denied'.

String login(String user, String pass, bool active) {
  return (user == 'student' && pass == 'iti123' && active) 
         ? 'Login Successful' 
         : 'Access Denied';
}


// Create a function that receives product price, isPremium, and hasCoupon. Customer
// gets 15% discount if premium member OR has coupon. Return final price.

double getFinalPrice(double price, bool isPremium, bool hasCoupon) {
  return (isPremium || hasCoupon) ? price * 0.85 : price;
}


// Create a function that receives exam score and attendance percentage. Student
// passes only if score ³ 50 AND attendance ³ 75. Return 'Passed' or 'Failed'.

String checkResult(int score, int attendance) {
  return (score >= 50 && attendance >= 75) ? 'Passed' : 'Failed';
}

// Create a function that receives salary, age, and hasExistingLoan. Loan approved if
// salary ³ 5000, age between 21 and 60, and no existing loan. Return 'Loan Approved'
// or 'Loan Rejected'.

String checkLoan(double salary, int age, bool hasExistingLoan) {
  return (salary >= 5000 && age >= 21 && age <= 60 && !hasExistingLoan) 
         ? 'Loan Approved' 
         : 'Loan Rejected';
}

// Create a function that receives order amount and distance in kilometers. Free delivery
// if order ³ 300, otherwise delivery fee = distance × 5. Return total amount including
// delivery.

double calculateTotalWithDelivery(double orderAmount, double distance) {
  double deliveryFee = (orderAmount >= 300) ? 0 : distance * 5;
  return orderAmount + deliveryFee;
}

//   Create a function that receives years of experience and performance rating (1–5).
// Employee receives bonus if experience ³ 3 AND rating ³ 4. Return 'Bonus Granted' or
// 'No Bonus'.

String checkBonus(int yearsOfExperience, int rating) {
  return (yearsOfExperience >= 3 && rating >= 4) ? 'Bonus Granted' : 'No Bonus';
}

// Create a function that receives hasAccessCard and knowsPassword. Door opens only
// if both are true. Return 'Door Opened' or 'Access Restricted'.


String checkDoor(bool hasAccessCard, bool knowsPassword) {
  return (hasAccessCard && knowsPassword) ? 'Door Opened' : 'Access Restricted';
}

// Create a function that receives electricity usage (kWh). usage < 200 ® 'Low
// Consumption', 200–500 ® 'Medium Consumption', above 500 ® 'High Consumption'.
// Return the category

String checkElectricityUsage(int kwh) {
  if (kwh < 200) {
    return 'Low Consumption';
  } else if (kwh >= 200 && kwh <= 500) {
    return 'Medium Consumption';
  } else {
    return 'High Consumption';
  }
}

// Create a function that receives completedLessons and quizScore. Next level unlocks if
// completed lessons ³ 10 AND quiz score ³ 70. Return 'Level Unlocked' or 'Complete
// Requirements'.

String checkLevelUnlock(int completedLessons, int quizScore) {
  return (completedLessons >= 10 && quizScore >= 70) 
         ? 'Level Unlocked' 
         : 'Complete Requirements';
}

// Create a function that receives driver availability, user balance, and trip cost. Ride
// starts if driver available AND balance ³ trip cost. Return 'Ride Confirmed' or
// 'Insufficient Conditions'.


String checkRide(bool isAvailable, double balance, double cost) {
  return (isAvailable && balance >= cost) ? 'Ride Confirmed' : 'Insufficient Conditions';
}


void main() {
  print(login('student', 'iti123', true)); 

  print(getFinalPrice(100, true, false)); 

print(checkResult(60, 80));

print(checkLoan(6000, 30, false));

print('Total Order: ${calculateTotalWithDelivery(200, 10)}');

print('Bonus Status: ' + checkBonus(4, 5));

print(' Door Access: ' + checkDoor(true, true));


print('Electricity: ' + checkElectricityUsage(350));

print('Level Unlock: ' + checkLevelUnlock(12, 85));

print('Ride Status: ' + checkRide(true, 150.0, 100.0));

}





