pragma solidity ^0.5.1 ;
contract test2{
    address payable owner;
    mapping (address => uint) public balances;
    constructor(address payable idr) public{
        owner = idr;
    }
    function paySalary() public payable{
        balances[msg.sender] +=msg.value;
        owner.transfer(msg.value);
    }
    
}
