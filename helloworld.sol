pragma solidity ^0.4.24;
contract test{
    string name; 
    
    // this function is used to set the name 
    function getName(string x)public 
    { 
    name = x;
    }
    
    // this function demonstrates the use of **view** . It is used for a function which is 
    // read only
    
    function retName() public view returns(string) 
    {
        return name;
    }
    
    // **HelloWorld** and **Multiply** function makes user of modifier **pure** 
    //to indicate that this function returns a value using only function parameters 
    //and does not make use of any external variable 
    
    function HelloWorld () public pure returns (string) 
    {
   return 'helloWorld';
    }
    function multiply(uint n1,uint n2) public pure returns(uint)
    { 
        return n1*n2;
    }
}
