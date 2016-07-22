var find_largest_prime_factor = function (number){
  var LPM = 2;
  if (number===1){
    return 1;
  }
  else
  {
    while(number > 1){
   
      for(var i = 2; i<=number; i++ ){
      
      
        var simple = 0;
        for (var j = 1; j<=i/2; j++)
          if (i%j===0){
            simple++;
          }
         
        if(simple<2 && number%i===0){
          number = number/i;
          LPM = i;
        }
       
      }
  
    }
    return LPM;
  }
};

console.log(find_largest_prime_factor(600851475143));

//=> 6857