var find_sum_1 = function(number){
  var sum=0;
  for(var i = 1; i<number; i++){
    if (i%3===0 || i%5===0){
      sum=sum+i;
    }
  }
  return sum;
};
console.log(find_sum_1(10));