var sum_of_even = function (limit){
  
  var sum = 0;
  var prevprev = 0;
  var prev = 1;
  var current = prev+prevprev;
  
  while(current <= limit){
    
    if((current%2)===0){
      sum = sum +current;
    }
    prevprev = prev;
    prev = current;
    current = prev + prevprev;
  }
  return sum;
};

console.log(sum_of_even(1000));