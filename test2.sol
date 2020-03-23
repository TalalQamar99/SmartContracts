pragma solidity ^0.5.1 ;

contract test2{
    address payable owner; //here the address of the person who deployed the contract is stored
    mapping (address => uint) public balances; //this mapping stores address and balances
    uint256 opening = 1584946795; //stroing epoch value of opening time 12:00 pm in this case
    uint256 closing = 1584948595; //storing epoch value of closing time 12:30 pm in this case
   
   // constructor to assign owner address
    constructor(address payable ar1) public{
        owner = ar1;
    }
    
    // this modifier puts the time limit condition on the payEther function
    modifier timeLim(){
        require (block.timestamp >=opening && block.timestamp <= closing);
        _;
    }
    
    //this function transfers ether to the address in parameter from the owner
    //the function is available within a specific time range 
    //for purpose of testing I set the time between 12:00 pm and 12:30pm
    
    function payEther(address payable ar2) public payable timeLim{
        ar2.transfer(msg.value);
        balances[ar2] += msg.value;
    }
    
}
