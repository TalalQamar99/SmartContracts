pragma solidity ^0.4.24;
contract test{
    string name
    function getName(string x)public { name = x;}
    function retName() public returns(string) {
        return name;
    }
    function renderHelloWorld () public pure returns (string) {
   return 'helloWorld';
 }
}
